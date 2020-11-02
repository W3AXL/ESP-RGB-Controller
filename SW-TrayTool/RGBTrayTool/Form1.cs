using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Net.Http;

namespace RGBTrayTool
{
    public partial class Form1 : Form
    {
        // Classes for config storage
        public class Controller
        {
            public string name;
            public string address;
            public string desc;
            public int activePreset;
        }
        public class Preset
        {
            public string name;
            public byte red;
            public byte green;
            public byte blue;
            public byte intensity;
        }
        public class Config
        {
            public List<Controller> controllers { get; }
            public List<Preset> presets { get; set; }

            public Config()
            {
                Debug.Print("initializing config class object");
                controllers = new List<Controller>();
                presets = new List<Preset>();
            }
        }

        // Initialize our global config class
        Config formConfig = new Config();

        // HttpClient for sending GET requests
        HttpClient ctrlClient = new HttpClient();

        /// <summary>
        /// Utility function to test if a string can be converted to a type
        /// </summary>
        /// <param name="value">String to attempt to convert</param>
        /// <param name="type">Type to attempt to convert to</param>
        /// <returns>True if conversion can be done</returns>
        private bool canConvert(string value, Type type)
        {
            TypeConverter converter = TypeDescriptor.GetConverter(type);
            return converter.IsValid(value);
        }

        /// <summary>
        /// Sends the HTTP GET request to the specified controller
        /// </summary>
        /// <param name="controller"></param>
        /// <param name="preset"></param>
        /// <returns>true if GET request successful, false otherwise</returns>
        private bool sendRGBCmd(Controller controller, Preset preset)
        {
            float intensityFactor = (float)preset.intensity / 255;
            byte newRed = Convert.ToByte((float)preset.red * intensityFactor);
            byte newGreen = Convert.ToByte((float)preset.green * intensityFactor);
            byte newBlue = Convert.ToByte((float)preset.blue * intensityFactor);
            string rgbStr = newRed.ToString() + "," + newGreen.ToString() + "," + newBlue.ToString();
            Debug.WriteLine("sending RGB command: " + rgbStr);
            string requestAddr = "http://" + controller.address + "?rgb=" + rgbStr;
            try
            {
                var result = ctrlClient.GetAsync(requestAddr).Result;
                if (result.StatusCode != System.Net.HttpStatusCode.OK)
                {
                    Debug.WriteLine("GET request returned error: " + result.StatusCode);
                    return false;
                }
                else
                {
                    Debug.WriteLine("GET request OK");
                    return true;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("GET request caused exception: " + ex.ToString());
                return false;
            }      
        }

        /// <summary>
        /// Loads config from controller and preset json files
        /// </summary>
        private void loadConfig()
        {
            // Check if the config files exist
            if (!File.Exists("controllers.json"))
            {
                var ctrlFile = File.Create("controllers.json");
                ctrlFile.Close();
            } else
            {
                // Open the Controller JSON
                using (StreamReader r = new StreamReader("controllers.json"))
                {
                    Debug.WriteLine("Reading controllers from json file");
                    string json = r.ReadToEnd();
                    List<Controller> readControllers =  JsonConvert.DeserializeObject<List<Controller>>(json);
                    foreach(var ctrl in readControllers)
                    {
                        Debug.WriteLine("added controller " + ctrl.name);
                        formConfig.controllers.Add(ctrl);
                    }
                }
            }
            // Same for the presets file
            if (!File.Exists("presets.json"))
            {
                var presetFile = File.Create("presets.json");
                presetFile.Close();
            } else
            {
                // Open the Presets JSON
                using (StreamReader r = new StreamReader("presets.json"))
                {
                    Debug.WriteLine("Reading presets from json file");
                    string json = r.ReadToEnd();
                    List<Preset> readPresets = JsonConvert.DeserializeObject<List<Preset>>(json);
                    foreach(var preset in readPresets)
                    {
                        Debug.WriteLine("added preset " + preset.name);
                        formConfig.presets.Add(preset);
                    }
                }
            }
            
        }

        /// <summary>
        /// Saves config to controller and preset json files
        /// </summary>
        private void saveConfig()
        {
            if (!File.Exists("controllers.json"))
            {
                File.Create("controllers.json");
            }
            if (!File.Exists("presets.json"))
            {
                File.Create("presets.json");
            }
            // Save the controllers and presets to JSON files
            using (StreamWriter file = new StreamWriter("controllers.json"))
            {
                string cntrlJSON = JsonConvert.SerializeObject(formConfig.controllers);
                file.Write(cntrlJSON);
            }
            using (StreamWriter file = new StreamWriter("presets.json"))
            {
                string presetJSON = JsonConvert.SerializeObject(formConfig.presets);
                file.Write(presetJSON);
            }
        }

        /// <summary>
        /// Updates list of controllers in form
        /// </summary>
        private void updateControllerList()
        {
            // clear and repopulate the list
            fldControllerList.Items.Clear();
            foreach (Controller ctrl in formConfig.controllers)
            {
                fldControllerList.Items.Add(ctrl.name);
            }
        }

        /// <summary>
        /// Updates information for the selected controller in the list
        /// </summary>
        private void updateSelectedController()
        {
            // show information for the currently selected item
            Debug.WriteLine("controller index " + fldControllerList.SelectedIndex.ToString());
            int selected = fldControllerList.SelectedIndex;
            if (selected >= 0)
            {
                fldCurControllerIP.Text = formConfig.controllers[selected].address;
                fldCurControllerDesc.Text = formConfig.controllers[selected].desc;
                updateActivePreset();   // update the active preset for the selected controller
            } else
            {
                fldCurControllerIP.Text = "";
                fldCurControllerDesc.Text = "";
            }
        }

        /// <summary>
        /// Updates the list of presets in the preset table
        /// </summary>
        private void updatePresetList()
        {
            fldPresets.Rows.Clear();
            foreach (Preset prst in formConfig.presets)
            {
                fldPresets.Rows.Add(false, prst.name, prst.red, prst.green, prst.blue, prst.intensity);
            }
        }

        /// <summary>
        /// Updates the active preset for the selected controller in the preset list, called when a new controller is selected
        /// </summary>
        private void updateActivePreset()
        {
            int controllerIdx = fldControllerList.SelectedIndex;
            int presetIdx = formConfig.controllers[controllerIdx].activePreset;
            // -1 is no preset active
            if (presetIdx < 0) {
                // clear all checkboxes
                foreach (DataGridViewRow row in fldPresets.Rows)
                {
                    row.Cells[0].Value = false;
                }
                // exit
                return; 
            }
            // Check the box by the preset that's active
            fldPresets.Rows[presetIdx].Cells[0].Value = true;
            // Clear checkboxes from all the other presets
            foreach (DataGridViewRow row in fldPresets.Rows)
            {
                if (row.Index != presetIdx)
                {
                    row.Cells[0].Value = false;
                }
            }
        }

        /// <summary>
        /// Activates preset for the currently selected controller.
        /// </summary>
        /// Does not change the value for the checkbox in the table (that would make an inifnite loop, I think)
        /// <param name="presetRow">the preset row to activate</param>
        private void activatePreset(int presetRow)
        {
            int ctrlIdx = fldControllerList.SelectedIndex;
            // Make sure we have a controller selected
            if ( (ctrlIdx < 0) || (ctrlIdx > formConfig.controllers.Count -1) )
            {
                MessageBox.Show("No controller selected", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                // clear the checkbox
                fldPresets.Rows[presetRow].Cells[0].Value = false;
            } else
            {
                // clear checkboxes from all the other rows
                foreach (DataGridViewRow row in fldPresets.Rows)
                {
                    if (row.Index != presetRow)
                    {
                        row.Cells[0].Value = false;
                    }
                }
                Debug.WriteLine("Activating preset " + presetRow.ToString() + " for controller " + fldControllerList.SelectedIndex.ToString());
                formConfig.controllers[ctrlIdx].activePreset = presetRow;
                if (!sendRGBCmd(formConfig.controllers[ctrlIdx], formConfig.presets[presetRow]))
                {
                    MessageBox.Show("HTTP error on sending GET request", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    // clear the checkbox
                    fldPresets.Rows[presetRow].Cells[0].Value = false;
                }
            }
        }
            
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loadConfig();
            updateControllerList();
            updatePresetList();
            updateSelectedController();
        }

        /// <summary>
        /// Adds controller using the new controller dialog form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAddController_Click(object sender, EventArgs e)
        {
            // variable for new controller
            Controller newController = new Controller();
            // open the add controller dialog
            using (var addDialog = new AddControllerDialog())
            {
                var result = addDialog.ShowDialog();
                if (result == DialogResult.OK)
                {
                    newController.name = addDialog.controllerName;
                    newController.address = addDialog.controllerAddr;
                    newController.desc = addDialog.controllerDesc;
                    newController.activePreset = 0;
                    Debug.WriteLine("Adding new controller from dialog");
                    Debug.Print("Adding item: ");
                    Debug.Print(newController.name);
                    Debug.Print(newController.address);
                    Debug.Print(newController.desc);
                    // add controller to list
                    formConfig.controllers.Add(newController);
                    // save our config files
                    saveConfig();
                    // update the list of controllers
                    updateControllerList();
                    updateSelectedController();
                } else
                {
                    Debug.WriteLine("Add controller dialog cancelled");
                }
                
            }
        }

        /// <summary>
        /// Deletes the selected controller from the list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDeleteController_Click(object sender, EventArgs e)
        {
            // get the index of the currently selected item in the list
            int ctrlIdx = fldControllerList.SelectedIndex;
            // remove the item from the config list and save config
            if (ctrlIdx >= 0)
            {
                formConfig.controllers.RemoveAt(ctrlIdx);
                saveConfig();
                // update the list
                updateControllerList();
                updateSelectedController();
            }
        }

        /// <summary>
        /// Runs whenever a new controller is selected in the controller list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldControllerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateSelectedController();
        }

        /// <summary>
        /// Validates the entered preset data before saving it
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_CellValidating(object sender, DataGridViewCellValidatingEventArgs e)
        {
            Debug.WriteLine("validing cell...");
            // We don't validate the active or name columns
            if ( (e.ColumnIndex == fldPresets.Columns["prstName"].Index) || (e.ColumnIndex == fldPresets.Columns["prstActive"].Index) )
            {
                Debug.WriteLine("no validation needed on this column");
                return;
            }
            // Make sure cell is not empty
            if (string.IsNullOrEmpty(e.FormattedValue.ToString()))
            {
                Debug.WriteLine("value is empty, not valid");
                fldPresets.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = 0;
                //e.Cancel = true;
                return;
            }
            // Make sure cell is valid 0-255 range
            if (!canConvert(e.FormattedValue.ToString(), typeof(byte) )) {
                Debug.WriteLine("value is outside 0-255, not valid");
                MessageBox.Show("Value cannot be outside range: 0-255", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                fldPresets.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = 0;
                //e.Cancel = true;
                return;
            }
        }

        /// <summary>
        /// Clears error text (if present) after cell has been validated
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_CellValidated(object sender, DataGridViewCellEventArgs e)
        {
            Debug.WriteLine("cell change validated");
            fldPresets.Rows[e.RowIndex].ErrorText = null;
        }

        /// <summary>
        /// Updates the preset data after we've validated it
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            Debug.WriteLine("edit detected on preset table row " + e.RowIndex.ToString());
            // First verify that the row that was changed is valid
            if ( (e.RowIndex < 0) || (e.RowIndex > formConfig.presets.Count) )  // we allow 1 above the current preset count to allow a new preset to be added
            {
                Debug.WriteLine("cell change was in row outside valid bounds, ignoring");
                return;
            }
            // Next handle the checkbox being checked before anything else
            if (e.ColumnIndex == 0)
            {
                // check if the box has been checked
                if (Convert.ToBoolean(fldPresets.Rows[e.RowIndex].Cells[e.ColumnIndex].Value))
                {
                    activatePreset(e.RowIndex);
                }
            } 
            else
            // Handle everything else now
            {
                Debug.WriteLine("Preset table entry " + e.RowIndex.ToString() + " changed");
                // Get the row and cell that was changed
                DataGridViewRow row = fldPresets.Rows[e.RowIndex];
                DataGridViewCell cell = row.Cells[e.ColumnIndex];
                // Get the new data
                var newData = cell.Value;
                // if we don't have a preset at this row index yet, add one
                if (formConfig.presets.Count < e.RowIndex + 1)
                {
                    Debug.WriteLine("preset does not yet exist, creating...");
                    Preset newPreset = new Preset();
                    formConfig.presets.Add(newPreset);
                }
                Debug.WriteLine("updating preset");
                // Figure out which property we need to update
                switch (e.ColumnIndex)
                {
                    case 1:
                        formConfig.presets[e.RowIndex].name = newData.ToString();
                        break;
                    case 2:
                        formConfig.presets[e.RowIndex].red = Convert.ToByte(newData);
                        break;
                    case 3:
                        formConfig.presets[e.RowIndex].green = Convert.ToByte(newData);
                        break;
                    case 4:
                        formConfig.presets[e.RowIndex].blue = Convert.ToByte(newData);
                        break;
                    case 5:
                        formConfig.presets[e.RowIndex].intensity = Convert.ToByte(newData);
                        break;
                }
                saveConfig();
            }
        }

        /// <summary>
        /// Clears error text on cell editing end (like ESC key)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            fldPresets.Rows[e.RowIndex].ErrorText = String.Empty;
        }

        /// <summary>
        /// Populates the new row with default preset values
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_DefaultValuesNeeded(object sender, DataGridViewRowEventArgs e)
        {
            e.Row.Cells["prstName"].Value = "Preset Name";
            e.Row.Cells["prstRed"].Value = 0;
            e.Row.Cells["prstGreen"].Value = 0;
            e.Row.Cells["prstBlue"].Value = 0;
            e.Row.Cells["prstIntensity"].Value = 0;
        }

        /// <summary>
        /// Adds a new row to the preset table
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAddPreset_Click(object sender, EventArgs e)
        {
            fldPresets.Rows.Add();
        }

        /// <summary>
        /// this specifically exists for handling the checkboxes, so we can trigger the active preset without exiting the cell
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void fldPresets_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.ColumnIndex == 0 && e.RowIndex != -1)
            {
                fldPresets.EndEdit();
            }
        }
    }
}
