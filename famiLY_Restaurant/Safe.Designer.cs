
namespace famiLY_Restaurant
{
    partial class Safe
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Safe));
            this.dgwBill = new System.Windows.Forms.DataGridView();
            this.btnPay = new System.Windows.Forms.Button();
            this.cmbAccount = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnRapor = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgwBill)).BeginInit();
            this.SuspendLayout();
            // 
            // dgwBill
            // 
            this.dgwBill.AllowUserToAddRows = false;
            this.dgwBill.AllowUserToDeleteRows = false;
            this.dgwBill.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgwBill.Location = new System.Drawing.Point(24, 11);
            this.dgwBill.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dgwBill.Name = "dgwBill";
            this.dgwBill.ReadOnly = true;
            this.dgwBill.RowHeadersWidth = 51;
            this.dgwBill.RowTemplate.Height = 24;
            this.dgwBill.Size = new System.Drawing.Size(502, 145);
            this.dgwBill.TabIndex = 0;
            this.dgwBill.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgwBill_CellDoubleClick);
            // 
            // btnPay
            // 
            this.btnPay.Font = new System.Drawing.Font("Cambria", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnPay.Location = new System.Drawing.Point(330, 190);
            this.btnPay.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnPay.Name = "btnPay";
            this.btnPay.Size = new System.Drawing.Size(206, 33);
            this.btnPay.TabIndex = 2;
            this.btnPay.Text = "Pay";
            this.btnPay.UseVisualStyleBackColor = true;
            this.btnPay.Click += new System.EventHandler(this.btnPay_Click);
            // 
            // cmbAccount
            // 
            this.cmbAccount.FormattingEnabled = true;
            this.cmbAccount.Location = new System.Drawing.Point(1, 224);
            this.cmbAccount.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.cmbAccount.Name = "cmbAccount";
            this.cmbAccount.Size = new System.Drawing.Size(116, 21);
            this.cmbAccount.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Cambria", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.label1.Location = new System.Drawing.Point(7, 190);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(110, 19);
            this.label1.TabIndex = 4;
            this.label1.Text = "Account Type";
            // 
            // btnRapor
            // 
            this.btnRapor.Font = new System.Drawing.Font("Cambria", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnRapor.Location = new System.Drawing.Point(330, 243);
            this.btnRapor.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnRapor.Name = "btnRapor";
            this.btnRapor.Size = new System.Drawing.Size(206, 32);
            this.btnRapor.TabIndex = 5;
            this.btnRapor.Text = "Genel Rapor";
            this.btnRapor.UseVisualStyleBackColor = true;
            this.btnRapor.Click += new System.EventHandler(this.btnRapor_Click);
            // 
            // Safe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(570, 378);
            this.Controls.Add(this.btnRapor);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbAccount);
            this.Controls.Add(this.btnPay);
            this.Controls.Add(this.dgwBill);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Safe";
            this.Text = "Safe";
            this.Load += new System.EventHandler(this.Safe_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgwBill)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgwBill;
        private System.Windows.Forms.Button btnPay;
        private System.Windows.Forms.ComboBox cmbAccount;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnRapor;
    }
}