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

namespace RGBTrayTool
{
    public partial class Form1 : Form
    {
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

        public List<Controller> controllers;
        public List<Preset> presets;

        private void loadConfig()
        {
            // Check if the config file exists. If not, create it.
            if (!File.Exists("conf.json"))
            {
                File.Create("conf.json");
            }
            else
            {
                // Open the JSON
                using (StreamReader r = new StreamReader("conf.json"))
                {
                    string json = r.ReadToEnd();
                    controllers = JsonConvert.DeserializeObject<List<Controller>>(json);
                    presets = JsonConvert.DeserializeObject<List<Preset>>(json);
                }
            }
        }

        private void saveConfig()
        {
            if (!File.Exists("conf.json"))
            {
                File.Create("conf.json");
            }
            // Save the JSON
            using (StreamWriter file = new StreamWriter("conf.json"))
            {
                string cntrlJSON = JsonConvert.SerializeObject(controllers);
                string prstJSON = JsonConvert.SerializeObject(presets);
                file.Write(cntrlJSON);
                file.Write(prstJSON);
            }
        }
            
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loadConfig();
            fldControllerList.DataSource = controllers;
        }

        private void btnAddController_Click(object sender, EventArgs e)
        {
            controllers.Add
        }
    }
}
