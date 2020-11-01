namespace RGBTrayTool
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.fldControllerList = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnAddController = new System.Windows.Forms.Button();
            this.btnEditController = new System.Windows.Forms.Button();
            this.btnDeleteController = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.prstName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.prstRed = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.prstGreen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.prstBlue = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.prstIntensity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label3 = new System.Windows.Forms.Label();
            this.fldCurControllerIP = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.fldCurControllerDesc = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // fldControllerList
            // 
            this.fldControllerList.FormattingEnabled = true;
            this.fldControllerList.Location = new System.Drawing.Point(12, 29);
            this.fldControllerList.Name = "fldControllerList";
            this.fldControllerList.Size = new System.Drawing.Size(148, 95);
            this.fldControllerList.TabIndex = 0;
            this.fldControllerList.SelectedIndexChanged += new System.EventHandler(this.fldControllerList_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(56, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Controllers";
            // 
            // btnAddController
            // 
            this.btnAddController.Location = new System.Drawing.Point(12, 130);
            this.btnAddController.Name = "btnAddController";
            this.btnAddController.Size = new System.Drawing.Size(40, 23);
            this.btnAddController.TabIndex = 2;
            this.btnAddController.Text = "Add";
            this.btnAddController.UseVisualStyleBackColor = true;
            this.btnAddController.Click += new System.EventHandler(this.btnAddController_Click);
            // 
            // btnEditController
            // 
            this.btnEditController.Location = new System.Drawing.Point(58, 130);
            this.btnEditController.Name = "btnEditController";
            this.btnEditController.Size = new System.Drawing.Size(40, 23);
            this.btnEditController.TabIndex = 3;
            this.btnEditController.Text = "Edit";
            this.btnEditController.UseVisualStyleBackColor = true;
            // 
            // btnDeleteController
            // 
            this.btnDeleteController.Location = new System.Drawing.Point(104, 130);
            this.btnDeleteController.Name = "btnDeleteController";
            this.btnDeleteController.Size = new System.Drawing.Size(56, 23);
            this.btnDeleteController.TabIndex = 4;
            this.btnDeleteController.Text = "Delete";
            this.btnDeleteController.UseVisualStyleBackColor = true;
            this.btnDeleteController.Click += new System.EventHandler(this.btnDeleteController_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 160);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Preset Colors";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.prstName,
            this.prstRed,
            this.prstGreen,
            this.prstBlue,
            this.prstIntensity});
            this.dataGridView1.Location = new System.Drawing.Point(12, 177);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(320, 252);
            this.dataGridView1.TabIndex = 6;
            // 
            // prstName
            // 
            this.prstName.HeaderText = "Name";
            this.prstName.MaxInputLength = 16;
            this.prstName.Name = "prstName";
            this.prstName.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.prstName.Width = 107;
            // 
            // prstRed
            // 
            this.prstRed.HeaderText = "Red";
            this.prstRed.MaxInputLength = 3;
            this.prstRed.Name = "prstRed";
            this.prstRed.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.prstRed.Width = 40;
            // 
            // prstGreen
            // 
            this.prstGreen.HeaderText = "Green";
            this.prstGreen.MaxInputLength = 3;
            this.prstGreen.Name = "prstGreen";
            this.prstGreen.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.prstGreen.Width = 40;
            // 
            // prstBlue
            // 
            this.prstBlue.HeaderText = "Blue";
            this.prstBlue.MaxInputLength = 3;
            this.prstBlue.Name = "prstBlue";
            this.prstBlue.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.prstBlue.Width = 40;
            // 
            // prstIntensity
            // 
            this.prstIntensity.HeaderText = "Intensity";
            this.prstIntensity.MaxInputLength = 3;
            this.prstIntensity.Name = "prstIntensity";
            this.prstIntensity.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.prstIntensity.Width = 50;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(166, 29);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "IP Address";
            // 
            // fldCurControllerIP
            // 
            this.fldCurControllerIP.AutoSize = true;
            this.fldCurControllerIP.Font = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fldCurControllerIP.Location = new System.Drawing.Point(167, 46);
            this.fldCurControllerIP.Name = "fldCurControllerIP";
            this.fldCurControllerIP.Size = new System.Drawing.Size(144, 19);
            this.fldCurControllerIP.TabIndex = 8;
            this.fldCurControllerIP.Text = "255.255.255.255";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(167, 69);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Description";
            // 
            // fldCurControllerDesc
            // 
            this.fldCurControllerDesc.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.fldCurControllerDesc.Location = new System.Drawing.Point(167, 86);
            this.fldCurControllerDesc.Name = "fldCurControllerDesc";
            this.fldCurControllerDesc.Size = new System.Drawing.Size(165, 67);
            this.fldCurControllerDesc.TabIndex = 10;
            this.fldCurControllerDesc.Text = "Empty Controller Description";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(344, 441);
            this.Controls.Add(this.fldCurControllerDesc);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.fldCurControllerIP);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnDeleteController);
            this.Controls.Add(this.btnEditController);
            this.Controls.Add(this.btnAddController);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.fldControllerList);
            this.Name = "Form1";
            this.Text = "RGB Controller";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox fldControllerList;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnAddController;
        private System.Windows.Forms.Button btnEditController;
        private System.Windows.Forms.Button btnDeleteController;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn prstName;
        private System.Windows.Forms.DataGridViewTextBoxColumn prstRed;
        private System.Windows.Forms.DataGridViewTextBoxColumn prstGreen;
        private System.Windows.Forms.DataGridViewTextBoxColumn prstBlue;
        private System.Windows.Forms.DataGridViewTextBoxColumn prstIntensity;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label fldCurControllerIP;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label fldCurControllerDesc;
    }
}

