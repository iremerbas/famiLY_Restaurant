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
    public partial class BillForm : Form
    {
        public static int id = 0;
        public static int price = 0;
        public static int TotalPrice = 0;

        public BillForm()
        {
            InitializeComponent();
        }

        private void BillForm_Load(object sender, EventArgs e)
        {
            GetMenu();
            GetBill();
            GetWaiter();
            GetBillProduct();
        }

        public void GetMenu()
        {
            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Id,ProductName,ProductCategory,Price from Menu";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            dgwMenu.DataSource = dataTable;
            cmbProductName.DataSource = dataTable;
            cmbProductName.ValueMember = "Id";
            cmbProductName.DisplayMember = "ProductName";

            Context.db().Close();
        }

        public void GetBill()
        {
            Context.db().Open();
            DataTable dataTable = new DataTable();
            string sorgu = "Select Id,BillNo,TableName,Date from Bill where IsStatus=1 and IsDelete=0";
            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);
            dqwBill.DataSource = dataTable;
            dqwBill.Columns[0].Visible = false;

            mbBillNo.DataSource = dataTable;
            mbBillNo.ValueMember = "Id";
            mbBillNo.DisplayMember = "BillNo";

            Context.db().Close();
        }
        public void GetWaiter()
        {
            Context.db().Open();
            DataTable dataTable = new DataTable();
            string sorgu = "Select Id,Name from Waiter where IsStatus=1 and IsDelete=0";
            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            cmbWaiter.DataSource = dataTable;
            cmbWaiter.ValueMember = "Id";
            cmbWaiter.DisplayMember = "Name";

            Context.db().Close();
        }

        public void GetBillProduct()
        {
            Context.db().Open();
            DataTable dataTable = new DataTable();

            string sorgu = "select Bill.Id, Bill.BillNo,Menu.ProductName,Menu.Price,BillProduct.Piece, BillProduct.ProductTotal, BillProduct.Id from BillProduct inner join Bill on(Bill.Id=BillProduct.BillId) inner join Menu on (Menu.Id = BillProduct.ProductId) where Bill.IsStatus = 1 and BillProduct.IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);
            dgwBillProduct.DataSource = dataTable;
            dgwBillProduct.Columns[0].Visible = false;
            dgwBillProduct.Columns[6].Visible = false;
            Context.db().Close();
        }


        private void btnAdd_Click(object sender, EventArgs e)
        {
            Context.db().Open();

            SqlCommand sqlCommand = new SqlCommand("AddBill", Context.db());
            sqlCommand.CommandType = CommandType.StoredProcedure;
            //sqlCommand.Parameters.Add("Id", SqlDbType.Int).Value = addMenuId;
            sqlCommand.Parameters.Add("BillNo", SqlDbType.Int).Value = Convert.ToInt32(txtBillNo.Text);
            sqlCommand.Parameters.Add("TableName", SqlDbType.NVarChar, 100).Value = txtTableName.Text;
            sqlCommand.Parameters.Add("WaiterId", SqlDbType.Int).Value = 0;
            sqlCommand.Parameters.Add("Date", SqlDbType.Date).Value = dtDate.Text;
            sqlCommand.Parameters.Add("TotalPrice", SqlDbType.Float).Value = 0f;

            var ReturnValue = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
            ReturnValue.Direction = ParameterDirection.ReturnValue;
            sqlCommand.ExecuteNonQuery();
            int result = Convert.ToInt32(ReturnValue.Value);

            Context.db().Close();

            if (result == 0)
            {
                MessageBox.Show("Bill Added Successfull", "Bill Add", MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetBill();
            }
            else
            {
                MessageBox.Show("An error occurred while adding!", "Bill Add", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

            DialogResult deleteDialog = new DialogResult();

            deleteDialog = MessageBox.Show("Delete Menu?",
                                             "Delete Menu?",
                                             MessageBoxButtons.YesNo,
                                             MessageBoxIcon.Question);
            if (deleteDialog == DialogResult.Yes)
            {
                Context.db().Open();

                SqlCommand deleteControl = new SqlCommand("DeleteBill", Context.db());
                deleteControl.CommandType = CommandType.StoredProcedure;
                deleteControl.Parameters.Add("Id", SqlDbType.Int).Value = id;

                var returnValue = deleteControl.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnValue.Direction = ParameterDirection.ReturnValue;

                deleteControl.ExecuteNonQuery();

                int result = Convert.ToInt32(returnValue.Value);

                Context.db().Close();


                if (result == 1)
                {


                    MessageBox.Show("Bill Deletion Successful",
                                      "Delete Bill?",
                                       MessageBoxButtons.OK,
                                       MessageBoxIcon.Information);
                    GetBill();

                }
                else
                {
                    MessageBox.Show("Bill Not Found",
                                 "Delete Bill?",
                                 MessageBoxButtons.OK,
                                 MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Bill Deletion Canceled",
                                 "Delete Bill?",
                                 MessageBoxButtons.OK,
                                 MessageBoxIcon.Information);  //Menu Silme işlemi iptal edildi
            }
        }

        private void dqwBill_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dqwBill.CurrentRow.Cells[0].Value);
        }


        private void dgwMenu_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dgwMenu.CurrentRow.Cells[0].Value);

            Context.db().Open();

            //string sorgu = "select ProductName , ProductCategory, Price from Menu where Id=" + id; 
            string sorgu = "select Id, ProductName , ProductCategory, Price from Menu";

            SqlCommand sqlCommand = new SqlCommand(sorgu, Context.db());

            SqlDataReader sqlData = sqlCommand.ExecuteReader();


            for (int i = 0; i < dgwMenu.SelectedRows.Count; i++)
            {
                cmbProductName.Text = dgwMenu.SelectedRows[i].Cells["ProductName"].Value.ToString();
                txtPrice.Text = dgwMenu.SelectedRows[i].Cells["Price"].Value.ToString();
            }
            Context.db().Close();
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();

            SqlCommand sqlCommand = new SqlCommand("AddBillProduct", Context.db());
            sqlCommand.CommandType = CommandType.StoredProcedure;
            //sqlCommand.Parameters.Add("Id", SqlDbType.Int).Value = addMenuId;
            sqlCommand.Parameters.Add("BillId", SqlDbType.Int).Value = Convert.ToInt32(mbBillNo.SelectedValue);
            sqlCommand.Parameters.Add("ProductId", SqlDbType.Int).Value = Convert.ToInt32(cmbProductName.SelectedValue);

            price = Convert.ToInt32(txtPrice.Text) * Convert.ToInt32(numericPiece.Value);

            sqlCommand.Parameters.Add("Price", SqlDbType.Float).Value = txtPrice.Text;
            sqlCommand.Parameters.Add("Piece", SqlDbType.Float).Value = numericPiece.Text;
            sqlCommand.Parameters.Add("ProductTotal", SqlDbType.Float).Value = price;
            //sqlCommand.Parameters.Add("IsStatus", SqlDbType.Bit).Value = 1;
            //sqlCommand.Parameters.Add("IsDelete", SqlDbType.Bit).Value = 0;


            TotalPrice += price;
            lblTotalPrice.Text = TotalPrice.ToString();



            var ReturnValue = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
            ReturnValue.Direction = ParameterDirection.ReturnValue;
            sqlCommand.ExecuteNonQuery();
            int result = Convert.ToInt32(ReturnValue.Value);

            //Eklenicek Kısım
            //Sql De bill tablo değişcek 
            //Add Bill
            //Edit Bill ödencek.
            //TotalPrice += oldtotalprice 
            SqlCommand sql = new SqlCommand("EditBill", Context.db());
            sql.CommandType = CommandType.StoredProcedure;
            sql.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(mbBillNo.SelectedValue);
            sql.Parameters.Add("WaiterId", SqlDbType.Int).Value = Convert.ToInt32(cmbWaiter.SelectedValue);
            sql.Parameters.Add("TotalPrice", SqlDbType.Int).Value = TotalPrice;

            var returnValue = sql.Parameters.Add("@ReturnVal", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;
            sql.ExecuteNonQuery();

            Context.db().Close();

            if (result == 1)
            {
                MessageBox.Show("BillProduct Added Successfull", "BillProduct Add",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetBillProduct();
                TotalPrice = 0;
            }
            else
            {
                MessageBox.Show("An error occurred while adding!", "BillProduct Add", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void addDelete_Click(object sender, EventArgs e)
        {
            DialogResult deleteDialog = new DialogResult();

            deleteDialog = MessageBox.Show("Delete BillProduct?",
                                             "Delete BillProduct?",
                                             MessageBoxButtons.YesNo,
                                             MessageBoxIcon.Question);
            if (deleteDialog == DialogResult.Yes)
            {
                Context.db().Open();

                SqlCommand deleteControl = new SqlCommand("DeleteBillProduct", Context.db());
                deleteControl.CommandType = CommandType.StoredProcedure;
                deleteControl.Parameters.Add("Id", SqlDbType.Int).Value = id;

                var returnValue = deleteControl.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnValue.Direction = ParameterDirection.ReturnValue;

                deleteControl.ExecuteNonQuery();

                int result = Convert.ToInt32(returnValue.Value);


                SqlCommand sql = new SqlCommand("EditBillProductStatus", Context.db());
                sql.CommandType = CommandType.StoredProcedure;
                sql.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(dgwBillProduct.CurrentRow.Cells[0].Value);


                var returnValue1 = sql.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnValue1.Direction = ParameterDirection.ReturnValue;
                sql.ExecuteNonQuery();


                price = Convert.ToInt32(txtPrice.Text) * Convert.ToInt32(numericPiece.Value);

                TotalPrice -= price;
                lblTotalPrice.Text = TotalPrice.ToString();
                SqlCommand sql1 = new SqlCommand("EditBill", Context.db());
                sql1.CommandType = CommandType.StoredProcedure;
                sql1.Parameters.Add("Id", SqlDbType.Int).Value = Convert.ToInt32(mbBillNo.SelectedValue);
                sql1.Parameters.Add("WaiterId", SqlDbType.Int).Value = Convert.ToInt32(cmbWaiter.SelectedValue);
                sql1.Parameters.Add("TotalPrice", SqlDbType.Int).Value = TotalPrice;

                var returnValue2 = sql1.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnValue2.Direction = ParameterDirection.ReturnValue;
                sql1.ExecuteNonQuery();

                Context.db().Close();


                if (result == 1)
                {
                    MessageBox.Show("BillProduct Deletion Successful",
                                      "Delete BillProduct?",
                                       MessageBoxButtons.OK,
                                       MessageBoxIcon.Information);

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
            else
            {
                MessageBox.Show("BillProduct Deletion Canceled",
                                 "Delete BillProduct?",
                                 MessageBoxButtons.OK,
                                 MessageBoxIcon.Information);  //Menu Silme işlemi iptal edildi
            }
        }

        private void dgwBillProduct_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

            id = Convert.ToInt32(dgwBillProduct.CurrentRow.Cells[6].Value);
        }

        private void btnAccount_Click(object sender, EventArgs e)
        {
            SafeLogin safe = new SafeLogin();

            this.Hide();
            safe.ShowDialog();
            this.Show();

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }
    }
}
