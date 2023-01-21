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
    public partial class MenuEdit : Form
    {
       
        MenuAddDeleteEdit MenuAddDeleteEdit;
        DataTable dataTable = new DataTable();
        public MenuEdit(MenuAddDeleteEdit menuAddDeleteEdit)
        {
            InitializeComponent();
            MenuAddDeleteEdit = menuAddDeleteEdit;
        }
        
        private void MenuEdit_Load(object sender, EventArgs e)
        {
           GetMenu();
          
        }
      
        public void GetMenu()
        {

            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Id, ProductName,ProductCategory,Price,IsStatus from Menu";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            editMenuDgw.DataSource = dataTable;
            editMenuDgw.Columns[0].Visible = false;
            Context.db().Close();

        }

    
        private void editBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();


            SqlCommand procedure = new SqlCommand("EditMenu", Context.db());
            procedure.CommandType = CommandType.StoredProcedure;
            procedure.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(editMenuDgw.CurrentRow.Cells[0].Value);
            procedure.Parameters.Add("ProductName", SqlDbType.NVarChar, 100).Value = pNameTxt.Text;
            procedure.Parameters.Add("ProductCategory", SqlDbType.NVarChar, 100).Value = pCategoryTxt.Text;
            procedure.Parameters.Add("Price", SqlDbType.Float).Value = numericPrice.Value;
            procedure.Parameters.Add("Status", SqlDbType.Bit).Value = statusCb.Checked;
            
            var returnValue = procedure.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            procedure.ExecuteNonQuery();


            int result = Convert.ToInt32(returnValue.Value);
            Context.db().Close();
         
            if (result == 1)
            {
                MessageBox.Show("Menu Edit Successful");
                
                pCategoryTxt.Clear();
                pNameTxt.Clear();
                numericPrice.ResetText();
                statusCb.Checked = false;
                GetMenu();
            }
            else
            {
                MessageBox.Show("This product is not in the menu");
            }

        }

        private void MenuEdit_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            MenuAddDeleteEdit.GetMenu();
           
        }

        private void editMenuDgw_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            pNameTxt.Text = editMenuDgw.CurrentRow.Cells[1].Value.ToString();
            pCategoryTxt.Text = editMenuDgw.CurrentRow.Cells[2].Value.ToString();
            numericPrice.Value = Convert.ToDecimal(editMenuDgw.CurrentRow.Cells[3].Value);
            statusCb.Checked = Convert.ToBoolean(editMenuDgw.CurrentRow.Cells[4].Value);
        }
    }
}
