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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace famiLY_Restaurant
{
    public partial class StockEdit : Form
    {
        StockAddDeleteEdit StockAddDeleteEdit = new StockAddDeleteEdit();
        public StockEdit(StockAddDeleteEdit stockAddDeleteEdit)
        {
            InitializeComponent();
            StockAddDeleteEdit = stockAddDeleteEdit;
        }

        private void StockEdit_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK; //Sayfa kapatma komutu
            StockAddDeleteEdit.GetKitchen();
        }

        private void StockEdit_Load(object sender, EventArgs e)
        {
            GetKitchen();
        }

        public void GetKitchen()
        {

            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Id,Name,Unit,Stock,IsStatus from Kitchen where IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            editStockDgw.DataSource = dataTable;
            editStockDgw.Columns[0].Visible = false;
            Context.db().Close();

        }

        private void kEditBtn_Click_1(object sender, EventArgs e)
        {
            Context.db().Open();


            SqlCommand procedure = new SqlCommand("EditKitchen", Context.db());
            procedure.CommandType = CommandType.StoredProcedure;
            procedure.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(editStockDgw.CurrentRow.Cells[0].Value);
            procedure.Parameters.Add("Name", SqlDbType.NVarChar, 50).Value = kNameTxt.Text;
            procedure.Parameters.Add("Unit", SqlDbType.NVarChar, 50).Value = kUnitTxt.Text;
            procedure.Parameters.Add("Stock", SqlDbType.Float).Value = kStockNud.Value;
            procedure.Parameters.Add("Status", SqlDbType.Bit).Value = kStatusCb.Checked;

            var returnValue = procedure.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            procedure.ExecuteNonQuery();


            int result = Convert.ToInt32(returnValue.Value);
            Context.db().Close();

            if (result == 1)
            {
                MessageBox.Show("Kitchen Edit Successful");
                
                kUnitTxt.Clear();
                kNameTxt.Clear();
                kStockNud.ResetText();
                kStatusCb.Checked = false;
                StockAddDeleteEdit.GetKitchen();
            }
            else
            {
                MessageBox.Show("This product is not in the Kitchen");
            }
        }

        private void editStockDgw_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            kNameTxt.Text = editStockDgw.CurrentRow.Cells[1].Value.ToString();

            kUnitTxt.Text = editStockDgw.CurrentRow.Cells[2].Value.ToString();

            kStockNud.Value = Convert.ToInt32(editStockDgw.CurrentRow.Cells[3].Value);
            kStatusCb.Checked = Convert.ToBoolean(editStockDgw.CurrentRow.Cells[4].Value);
        }
    }
}
