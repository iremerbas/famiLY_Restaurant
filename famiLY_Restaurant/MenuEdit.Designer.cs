namespace famiLY_Restaurant
{
    partial class MenuEdit
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MenuEdit));
            this.editMenuDgw = new System.Windows.Forms.DataGridView();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.numericPrice = new System.Windows.Forms.NumericUpDown();
            this.statusCb = new System.Windows.Forms.CheckBox();
            this.label9 = new System.Windows.Forms.Label();
            this.editBtn = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.pCategoryTxt = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.pNameTxt = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.editMenuDgw)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericPrice)).BeginInit();
            this.SuspendLayout();
            // 
            // editMenuDgw
            // 
            this.editMenuDgw.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.editMenuDgw.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.editMenuDgw.Location = new System.Drawing.Point(311, 14);
            this.editMenuDgw.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.editMenuDgw.Name = "editMenuDgw";
            this.editMenuDgw.RowHeadersWidth = 51;
            this.editMenuDgw.RowTemplate.Height = 24;
            this.editMenuDgw.Size = new System.Drawing.Size(581, 602);
            this.editMenuDgw.TabIndex = 0;
            this.editMenuDgw.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.editMenuDgw_CellDoubleClick);
            // 
            // groupBox2
            // 
            this.groupBox2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("groupBox2.BackgroundImage")));
            this.groupBox2.Controls.Add(this.numericPrice);
            this.groupBox2.Controls.Add(this.statusCb);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.editBtn);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.pCategoryTxt);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.pNameTxt);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Location = new System.Drawing.Point(51, 14);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox2.Size = new System.Drawing.Size(255, 602);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "EditMenu";
            // 
            // numericPrice
            // 
            this.numericPrice.Location = new System.Drawing.Point(21, 301);
            this.numericPrice.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.numericPrice.Maximum = new decimal(new int[] {
            -1486618624,
            232830643,
            0,
            0});
            this.numericPrice.Name = "numericPrice";
            this.numericPrice.Size = new System.Drawing.Size(151, 22);
            this.numericPrice.TabIndex = 30;
            // 
            // statusCb
            // 
            this.statusCb.AutoSize = true;
            this.statusCb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.statusCb.Location = new System.Drawing.Point(17, 385);
            this.statusCb.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.statusCb.Name = "statusCb";
            this.statusCb.Size = new System.Drawing.Size(18, 17);
            this.statusCb.TabIndex = 29;
            this.statusCb.UseVisualStyleBackColor = true;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label9.ForeColor = System.Drawing.Color.Moccasin;
            this.label9.Location = new System.Drawing.Point(15, 341);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(78, 20);
            this.label9.TabIndex = 27;
            this.label9.Text = "IsStatus";
            // 
            // editBtn
            // 
            this.editBtn.BackColor = System.Drawing.Color.Sienna;
            this.editBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.editBtn.ForeColor = System.Drawing.Color.Moccasin;
            this.editBtn.Location = new System.Drawing.Point(21, 489);
            this.editBtn.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.editBtn.Name = "editBtn";
            this.editBtn.Size = new System.Drawing.Size(192, 42);
            this.editBtn.TabIndex = 24;
            this.editBtn.Text = "EDİT";
            this.editBtn.UseVisualStyleBackColor = false;
            this.editBtn.Click += new System.EventHandler(this.editBtn_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label5.ForeColor = System.Drawing.Color.Moccasin;
            this.label5.Location = new System.Drawing.Point(15, 258);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 20);
            this.label5.TabIndex = 22;
            this.label5.Text = "Price";
            // 
            // pCategoryTxt
            // 
            this.pCategoryTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.pCategoryTxt.Location = new System.Drawing.Point(17, 204);
            this.pCategoryTxt.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pCategoryTxt.Multiline = true;
            this.pCategoryTxt.Name = "pCategoryTxt";
            this.pCategoryTxt.Size = new System.Drawing.Size(152, 31);
            this.pCategoryTxt.TabIndex = 21;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label6.ForeColor = System.Drawing.Color.Moccasin;
            this.label6.Location = new System.Drawing.Point(17, 170);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(155, 20);
            this.label6.TabIndex = 20;
            this.label6.Text = "Product Category";
            // 
            // pNameTxt
            // 
            this.pNameTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.pNameTxt.Location = new System.Drawing.Point(21, 116);
            this.pNameTxt.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.pNameTxt.Multiline = true;
            this.pNameTxt.Name = "pNameTxt";
            this.pNameTxt.Size = new System.Drawing.Size(149, 30);
            this.pNameTxt.TabIndex = 19;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label8.ForeColor = System.Drawing.Color.Moccasin;
            this.label8.Location = new System.Drawing.Point(17, 86);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(128, 20);
            this.label8.TabIndex = 18;
            this.label8.Text = "Product Name";
            // 
            // MenuEdit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Sienna;
            this.ClientSize = new System.Drawing.Size(959, 654);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.editMenuDgw);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "MenuEdit";
            this.Text = "MenuEdit";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MenuEdit_FormClosing);
            this.Load += new System.EventHandler(this.MenuEdit_Load);
            ((System.ComponentModel.ISupportInitialize)(this.editMenuDgw)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericPrice)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView editMenuDgw;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Button editBtn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox pCategoryTxt;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox pNameTxt;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.CheckBox statusCb;
        private System.Windows.Forms.NumericUpDown numericPrice;
    }
}