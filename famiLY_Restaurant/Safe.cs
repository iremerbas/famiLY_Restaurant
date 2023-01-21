using famiLY_Restaurant.DbContext;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace famiLY_Restaurant
{
    public partial class Safe : Form
    {
        public static int id = 0;
        public Safe()
        {
            InitializeComponent();
        }

        private void Safe_Load(object sender, EventArgs e)
        {
            GetBill();
            cmbAccount.Items.Add("Cash");
            cmbAccount.Items.Add("Credi Cart");
        }

        public void GetBill()
        {
            Context.db().Open();
            DataTable dataTable = new DataTable();
            string sorgu = "Select Bill.Id,BillNo,TableName,Waiter.Name,Date,TotalPrice from Bill inner join Waiter on(Waiter.Id=Bill.WaiterId) where Bill.IsStatus=1";
            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);
            dgwBill.DataSource = dataTable;
            dgwBill.Columns[0].Visible = false;

            Context.db().Close();
        }

        public void GetBillProduct()
        {
            Context.db().Open();
            DataTable dataTable = new DataTable();

            string sorgu = "select Bill.Id, Bill.BillNo,Menu.ProductName,Menu.Price,BillProduct.Piece, BillProduct.ProductTotal, BillProduct.Id from BillProduct inner join Bill on(Bill.Id=BillProduct.BillId) inner join Menu on (Menu.Id = BillProduct.ProductId) where Bill.IsStatus = 1 and BillProduct.IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);
         
            Context.db().Close();
        }

        private void dgwBill_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dgwBill.CurrentRow.Cells[0].Value);
        }

        private void btnPay_Click(object sender, EventArgs e)
        {
            Context.db().Open();

            SqlCommand sqlCommand = new SqlCommand("AddBillPay", Context.db());
            sqlCommand.CommandType = CommandType.StoredProcedure;

            sqlCommand.Parameters.Add("BillNo", SqlDbType.Int).Value = Convert.ToInt32(dgwBill.CurrentRow.Cells[0].Value);
            sqlCommand.Parameters.Add("PayName", SqlDbType.NVarChar, 50).Value = cmbAccount.SelectedIndex.ToString();
            sqlCommand.Parameters.Add("TotalPrice" ,SqlDbType.Float).Value= Convert.ToInt32(dgwBill.CurrentRow.Cells[5].Value);


            var ReturnValue = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
            ReturnValue.Direction = ParameterDirection.ReturnValue;
            sqlCommand.ExecuteNonQuery();
            int result = Convert.ToInt32(ReturnValue.Value);

            Context.db().Close();

            if (result == 0 )
            {
                MessageBox.Show("BillPay Added Successfull", "BillPay Add",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetBill();
            }
            else
            {
                MessageBox.Show("An error occurred while adding!", "BillPay Add", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            Context.db().Open();
            SqlCommand sql = new SqlCommand("EditBillStatus", Context.db());
            sql.CommandType = CommandType.StoredProcedure;
            sql.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(dgwBill.CurrentRow.Cells[0].Value);


            var returnValue = sql.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;
            sql.ExecuteNonQuery();
            int result1 = Convert.ToInt32(returnValue.Value);
            Context.db().Close();


            if (result1 == 1)
            {
                GetBillProduct();
            }
            else
            {
                MessageBox.Show("BillProduct Not Found",
                             "Delete BillProduct?",
                             MessageBoxButtons.OK,
                             MessageBoxIcon.Warning);
            }
        }

        private void btnRapor_Click(object sender, EventArgs e)
        {
           Rapor rapor = new Rapor();
            rapor.ShowDialog();
            this.Show();
        }
    }
}
