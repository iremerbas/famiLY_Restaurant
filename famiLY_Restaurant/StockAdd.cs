using famiLY_Restaurant.DbContext;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace famiLY_Restaurant
{

    public partial class StockAdd : Form
    {
        StockAddDeleteEdit StockAddDeleteEdit = new StockAddDeleteEdit();
        public StockAdd(StockAddDeleteEdit stockAddDeleteEdit)
        {
            InitializeComponent();
            StockAddDeleteEdit = stockAddDeleteEdit;
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();
            SqlCommand procedure = new SqlCommand("AddKitchen", Context.db());
            procedure.CommandType = CommandType.StoredProcedure;
            procedure.Parameters.Add("Name", SqlDbType.NVarChar, 100).Value = kNameTxt.Text;
            procedure.Parameters.Add("Unit", SqlDbType.NVarChar, 100).Value = kUnitTxt.Text;
            procedure.Parameters.Add("Stock", SqlDbType.Float).Value = kStockNud.Value;
            procedure.Parameters.Add("IsStatus", SqlDbType.Bit).Value = kStatusCb.Checked;
            procedure.Parameters.Add("IsDelete", SqlDbType.Bit).Value = "False";

            var returnValue = procedure.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            procedure.ExecuteNonQuery();


            int result = Convert.ToInt32(returnValue.Value);
            Context.db().Close();
            if (result == 0)
            {
                MessageBox.Show("Kitchen Added Successful");
                kNameTxt.Clear();
                kUnitTxt.Clear();
                kStockNud.ResetText();
                kStatusCb.Checked = false;




            }
            else
            {
                MessageBox.Show("There is this product on the Kitchen");
            }
        }

        private void StockAdd_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK; //Sayfa kapatma komutu
            StockAddDeleteEdit.GetKitchen();
        }
    }
}
