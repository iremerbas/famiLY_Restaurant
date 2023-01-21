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
    public partial class CustomerAdd : Form
    {
        MenuAddDeleteEdit MenuAddDeleteEdit;
        public CustomerAdd(MenuAddDeleteEdit menuAddDeleteEdit)
        {
            InitializeComponent();
            MenuAddDeleteEdit = menuAddDeleteEdit;

        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();
            SqlCommand procedure = new SqlCommand("AddMenu", Context.db());
            procedure.CommandType = CommandType.StoredProcedure;
            procedure.Parameters.Add("ProductName", SqlDbType.NVarChar, 100).Value = productnameTxt.Text;
            procedure.Parameters.Add("ProductCategory", SqlDbType.NVarChar, 100).Value = productCategoryTxt.Text;
            procedure.Parameters.Add("Price", SqlDbType.Float).Value = PriceTxt.Text;
            procedure.Parameters.Add("IsStatus", SqlDbType.Bit).Value = Statuscb.Checked;
            procedure.Parameters.Add("IsDelete", SqlDbType.Bit).Value = "False";

            var returnValue = procedure.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            procedure.ExecuteNonQuery();


            int result = Convert.ToInt32(returnValue.Value);
            Context.db().Close();
            if (result == 0)
            {
                MessageBox.Show("Menu Added Successful");
                productnameTxt.Clear();
                productCategoryTxt.Clear();
                PriceTxt.Clear();
                Statuscb.Checked = false;
                RestaurantLogin r = new RestaurantLogin();
            }
            else
            {
                MessageBox.Show("There is this product on the menu");
            }
        }

        private void CustomerAdd_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.DialogResult = DialogResult.OK; //Sayfa kapatma komutu

            MenuAddDeleteEdit.GetMenu();
        }
    }
}
