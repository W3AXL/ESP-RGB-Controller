using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RGBTrayTool
{
    public partial class AddControllerDialog : Form
    {
        public string controllerName { get; set; }
        public string controllerAddr { get; set; }
        public string controllerDesc { get; set; }

        private bool validateIPAddr(string ip)
        {
            // Validate not null or whitespace
            if (String.IsNullOrWhiteSpace(ip))
            {
                return false;
            }
            // validate a proper 4-octet ip
            string[] splitValues = ip.Split('.');
            if (splitValues.Length != 4)
            {
                return false;
            }
            // validate values are all 0-255
            byte temp;
            foreach (string oct in splitValues)
            {
                if (!byte.TryParse(oct, out temp))
                {
                    return false;
                }
            }
            // If everything looks good, return true
            return true;
        }

        public AddControllerDialog()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.controllerName = "";
            this.controllerAddr = "";
            this.controllerDesc = "";
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (validateIPAddr(fldControllerAddr.Text))
            {
                // get values from form and close
                this.controllerName = fldControllerName.Text;
                this.controllerAddr = fldControllerAddr.Text;
                this.controllerDesc = fldControllerDesc.Text;
                this.DialogResult = DialogResult.OK;
                this.Close();
            } else
            {
                MessageBox.Show("Invalid IP address specified", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
