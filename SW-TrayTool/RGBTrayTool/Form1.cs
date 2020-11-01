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
        }
        public class Preset
        {
            public string name;
            public char red;
            public char green;
            public char blue;
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

        private void updateControllerList()
        {
            // clear and repopulate the list
            fldControllerList.Items.Clear();
            foreach (Controller ctrl in formConfig.controllers)
            {
                fldControllerList.Items.Add(ctrl.name);
            }
        }

        private void selectedControllerChanged()
        {
            // show information for the currently selected item
            int selected = fldControllerList.SelectedIndex;
            if (selected >= 0)
            {
                fldCurControllerIP.Text = formConfig.controllers[selected].address;
                fldCurControllerDesc.Text = formConfig.controllers[selected].desc;
            } else
            {
                fldCurControllerIP.Text = "";
                fldCurControllerDesc.Text = "";
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
        }

        private void btnAddController_Click(object sender, EventArgs e)
        {
            // variable for new controller
            Controller test = new Controller();
            // open the add controller dialog
            using (var addDialog = new AddControllerDialog())
            {
                var result = addDialog.ShowDialog();
                if (result == DialogResult.OK)
                {
                    test.name = addDialog.controllerName;
                    test.address = addDialog.controllerAddr;
                    test.desc = addDialog.controllerDesc;
                    Debug.WriteLine("Adding new controller from dialog");
                    Debug.Print("Adding item: ");
                    Debug.Print(test.name);
                    Debug.Print(test.address);
                    Debug.Print(test.desc);
                    // add controller to list
                    formConfig.controllers.Add(test);
                    // save our config files
                    saveConfig();
                    // update the list of controllers
                    updateControllerList();
                    selectedControllerChanged();
                } else
                {
                    Debug.WriteLine("Add controller dialog cancelled");
                }
                
            }
        }

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
                selectedControllerChanged();
            }
        }

        private void fldControllerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedControllerChanged();
        }
    }
}
