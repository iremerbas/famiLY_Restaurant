namespace famiLY_Restaurant
{
    partial class StockAdd
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StockAdd));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.kStockNud = new System.Windows.Forms.NumericUpDown();
            this.kStatusCb = new System.Windows.Forms.CheckBox();
            this.kAddBtn = new System.Windows.Forms.Button();
            this.kUnitTxt = new System.Windows.Forms.TextBox();
            this.kNameTxt = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.Stock = new System.Windows.Forms.Label();
            this.ProductCategory = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kStockNud)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Linen;
            this.groupBox1.Controls.Add(this.kStockNud);
            this.groupBox1.Controls.Add(this.kStatusCb);
            this.groupBox1.Controls.Add(this.kAddBtn);
            this.groupBox1.Controls.Add(this.kUnitTxt);
            this.groupBox1.Controls.Add(this.kNameTxt);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.Stock);
            this.groupBox1.Controls.Add(this.ProductCategory);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(21, 30);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.groupBox1.Size = new System.Drawing.Size(274, 359);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Add Menu";
            // 
            // kStockNud
            // 
            this.kStockNud.Location = new System.Drawing.Point(19, 214);
            this.kStockNud.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.kStockNud.Maximum = new decimal(new int[] {
            1874919424,
            2328306,
            0,
            0});
            this.kStockNud.Name = "kStockNud";
            this.kStockNud.Size = new System.Drawing.Size(206, 20);
            this.kStockNud.TabIndex = 4;
            // 
            // kStatusCb
            // 
            this.kStatusCb.AutoSize = true;
            this.kStatusCb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kStatusCb.Location = new System.Drawing.Point(18, 266);
            this.kStatusCb.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.kStatusCb.Name = "kStatusCb";
            this.kStatusCb.Size = new System.Drawing.Size(15, 14);
            this.kStatusCb.TabIndex = 3;
            this.kStatusCb.UseVisualStyleBackColor = true;
            // 
            // kAddBtn
            // 
            this.kAddBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kAddBtn.Location = new System.Drawing.Point(18, 300);
            this.kAddBtn.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.kAddBtn.Name = "kAddBtn";
            this.kAddBtn.Size = new System.Drawing.Size(205, 38);
            this.kAddBtn.TabIndex = 2;
            this.kAddBtn.Text = "ADD";
            this.kAddBtn.UseVisualStyleBackColor = true;
            this.kAddBtn.Click += new System.EventHandler(this.addBtn_Click);
            // 
            // kUnitTxt
            // 
            this.kUnitTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kUnitTxt.Location = new System.Drawing.Point(18, 143);
            this.kUnitTxt.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.kUnitTxt.Multiline = true;
            this.kUnitTxt.Name = "kUnitTxt";
            this.kUnitTxt.Size = new System.Drawing.Size(206, 23);
            this.kUnitTxt.TabIndex = 1;
            // 
            // kNameTxt
            // 
            this.kNameTxt.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.kNameTxt.Location = new System.Drawing.Point(18, 75);
            this.kNameTxt.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.kNameTxt.Multiline = true;
            this.kNameTxt.Name = "kNameTxt";
            this.kNameTxt.Size = new System.Drawing.Size(206, 28);
            this.kNameTxt.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label4.Location = new System.Drawing.Point(16, 241);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(54, 17);
            this.label4.TabIndex = 0;
            this.label4.Text = "Status";
            // 
            // Stock
            // 
            this.Stock.AutoSize = true;
            this.Stock.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Stock.Location = new System.Drawing.Point(16, 183);
            this.Stock.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Stock.Name = "Stock";
            this.Stock.Size = new System.Drawing.Size(48, 17);
            this.Stock.TabIndex = 0;
            this.Stock.Text = "Stock";
            // 
            // ProductCategory
            // 
            this.ProductCategory.AutoSize = true;
            this.ProductCategory.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.ProductCategory.Location = new System.Drawing.Point(16, 115);
            this.ProductCategory.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.ProductCategory.Name = "ProductCategory";
            this.ProductCategory.Size = new System.Drawing.Size(37, 17);
            this.ProductCategory.TabIndex = 0;
            this.ProductCategory.Text = "Unit";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(16, 41);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Name";
            // 
            // StockAdd
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(353, 443);
            this.Controls.Add(this.groupBox1);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "StockAdd";
            this.Text = "StockAdd";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.StockAdd_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kStockNud)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox kStatusCb;
        private System.Windows.Forms.Button kAddBtn;
        private System.Windows.Forms.TextBox kUnitTxt;
        private System.Windows.Forms.TextBox kNameTxt;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label Stock;
        private System.Windows.Forms.Label ProductCategory;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown kStockNud;
    }
}