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
    public partial class StockAddDeleteEdit : Form
    {
        
        public static int id = 0;
        DataTable dataTable = new DataTable();
        
        public StockAddDeleteEdit()
        {
            InitializeComponent();

        }

        public void GetKitchen()
        {

            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Id,Name, Unit,Stock,IsStatus from Kitchen where IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            dataGridView1.DataSource = dataTable;
            dataGridView1.Columns[0].Visible = false;

            Context.db().Close();

        } 
        private void button1_Click(object sender, EventArgs e) //Ekleme
        {
            StockAdd stockAdd = new StockAdd(this);
            stockAdd.ShowDialog();
        }

        private void StockAddDeleteEdit_Load(object sender, EventArgs e)
        {
            GetKitchen();
        }

        private void button3_Click(object sender, EventArgs e) //Silme
        {
            DialogResult deleteDialog = new DialogResult();

            deleteDialog = MessageBox.Show("Delete Menu?",
                                             "Delete Menu?",
                                             MessageBoxButtons.YesNo,
                                             MessageBoxIcon.Question);
            if (deleteDialog == DialogResult.Yes)
            {
                Context.db().Open();

                SqlCommand deleteControl = new SqlCommand("DeleteKitchen", Context.db());
                deleteControl.CommandType = CommandType.StoredProcedure;
                deleteControl.Parameters.Add("Id", SqlDbType.Int).Value = id;

                var returnValue = deleteControl.Parameters.Add("@ReturnVal", SqlDbType.Int);
                returnValue.Direction = ParameterDirection.ReturnValue;

                deleteControl.ExecuteNonQuery();

                int result = Convert.ToInt32(returnValue.Value);

                Context.db().Close();


                if (result == 1)
                {


                    MessageBox.Show("Menu Deletion Successful",
                                      "Delete Menu?",
                                       MessageBoxButtons.OK,
                                       MessageBoxIcon.Information);
                    GetKitchen();

                }
                else
                {
                    MessageBox.Show("Menu Not Found",
                                 "Delete Menu?",
                                 MessageBoxButtons.OK,
                                 MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Menu Deletion Canceled",
                                 "Delete Menu?",
                                 MessageBoxButtons.OK,
                                 MessageBoxIcon.Information);  //Menu Silme işlemi iptal edildi
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            StockEdit stockEdit = new StockEdit(this);
            stockEdit.ShowDialog();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value);
        }
    }
}
