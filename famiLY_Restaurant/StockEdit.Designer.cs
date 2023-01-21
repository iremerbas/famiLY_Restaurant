namespace famiLY_Restaurant
{
    partial class StockEdit
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StockEdit));
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.kStockNud = new System.Windows.Forms.NumericUpDown();
            this.kStatusCb = new System.Windows.Forms.CheckBox();
            this.label9 = new System.Windows.Forms.Label();
            this.kEditBtn = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.kUnitTxt = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.kNameTxt = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.editStockDgw = new System.Windows.Forms.DataGridView();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kStockNud)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.editStockDgw)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox2
            // 
            this.groupBox2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("groupBox2.BackgroundImage")));
            this.groupBox2.Controls.Add(this.kStockNud);
            this.groupBox2.Controls.Add(this.kStatusCb);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.kEditBtn);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.kUnitTxt);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.kNameTxt);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Location = new System.Drawing.Point(48, 27);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox2.Size = new System.Drawing.Size(232, 558);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "StockMenu";
            // 
            // kStockNud
            // 
            this.kStockNud.Location = new System.Drawing.Point(21, 296);
            this.kStockNud.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.kStockNud.Maximum = new decimal(new int[] {
            -1486618624,
            232830643,
            0,
            0});
            this.kStockNud.Name = "kStockNud";
            this.kStockNud.Size = new System.Drawing.Size(151, 22);
            this.kStockNud.TabIndex = 30;
            // 
            // kStatusCb
            // 
            this.kStatusCb.AutoSize = true;
            this.kStatusCb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kStatusCb.Location = new System.Drawing.Point(17, 380);
            this.kStatusCb.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.kStatusCb.Name = "kStatusCb";
            this.kStatusCb.Size = new System.Drawing.Size(18, 17);
            this.kStatusCb.TabIndex = 29;
            this.kStatusCb.UseVisualStyleBackColor = true;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label9.ForeColor = System.Drawing.Color.White;
            this.label9.Location = new System.Drawing.Point(15, 336);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(78, 20);
            this.label9.TabIndex = 27;
            this.label9.Text = "IsStatus";
            // 
            // kEditBtn
            // 
            this.kEditBtn.BackColor = System.Drawing.Color.Sienna;
            this.kEditBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kEditBtn.ForeColor = System.Drawing.Color.White;
            this.kEditBtn.Location = new System.Drawing.Point(21, 489);
            this.kEditBtn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.kEditBtn.Name = "kEditBtn";
            this.kEditBtn.Size = new System.Drawing.Size(192, 42);
            this.kEditBtn.TabIndex = 24;
            this.kEditBtn.Text = "EDİT";
            this.kEditBtn.UseVisualStyleBackColor = false;
            this.kEditBtn.Click += new System.EventHandler(this.kEditBtn_Click_1);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label5.ForeColor = System.Drawing.Color.White;
            this.label5.Location = new System.Drawing.Point(15, 253);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 20);
            this.label5.TabIndex = 22;
            this.label5.Text = "Stock";
            // 
            // kUnitTxt
            // 
            this.kUnitTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kUnitTxt.Location = new System.Drawing.Point(17, 199);
            this.kUnitTxt.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.kUnitTxt.Multiline = true;
            this.kUnitTxt.Name = "kUnitTxt";
            this.kUnitTxt.Size = new System.Drawing.Size(152, 31);
            this.kUnitTxt.TabIndex = 21;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label6.ForeColor = System.Drawing.Color.White;
            this.label6.Location = new System.Drawing.Point(17, 165);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(43, 20);
            this.label6.TabIndex = 20;
            this.label6.Text = "Unit";
            // 
            // kNameTxt
            // 
            this.kNameTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kNameTxt.Location = new System.Drawing.Point(21, 111);
            this.kNameTxt.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.kNameTxt.Multiline = true;
            this.kNameTxt.Name = "kNameTxt";
            this.kNameTxt.Size = new System.Drawing.Size(149, 30);
            this.kNameTxt.TabIndex = 19;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label8.ForeColor = System.Drawing.Color.White;
            this.label8.Location = new System.Drawing.Point(17, 81);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(57, 20);
            this.label8.TabIndex = 18;
            this.label8.Text = "Name";
            // 
            // editStockDgw
            // 
            this.editStockDgw.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.editStockDgw.Location = new System.Drawing.Point(328, 38);
            this.editStockDgw.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.editStockDgw.Name = "editStockDgw";
            this.editStockDgw.RowHeadersWidth = 51;
            this.editStockDgw.RowTemplate.Height = 24;
            this.editStockDgw.Size = new System.Drawing.Size(539, 533);
            this.editStockDgw.TabIndex = 6;
            this.editStockDgw.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.editStockDgw_CellDoubleClick);
            // 
            // StockEdit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Sienna;
            this.ClientSize = new System.Drawing.Size(897, 612);
            this.Controls.Add(this.editStockDgw);
            this.Controls.Add(this.groupBox2);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "StockEdit";
            this.Text = "StockEdit";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.StockEdit_FormClosing);
            this.Load += new System.EventHandler(this.StockEdit_Load);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kStockNud)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.editStockDgw)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.NumericUpDown kStockNud;
        private System.Windows.Forms.CheckBox kStatusCb;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Button kEditBtn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox kUnitTxt;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox kNameTxt;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.DataGridView editStockDgw;
    }
}