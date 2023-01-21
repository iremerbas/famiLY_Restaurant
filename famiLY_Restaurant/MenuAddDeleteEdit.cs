using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using famiLY_Restaurant.DbContext;


using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using Context = famiLY_Restaurant.DbContext.Context;

namespace famiLY_Restaurant
{
    public partial class MenuAddDeleteEdit : Form
    {
        string ImageFolder = @"C:\Users\Dell\Desktop\famiLY_Restaurant\famiLY_Restaurant\images\";
        public static int id = 0;
        DataTable dataTable = new DataTable();
        public MenuAddDeleteEdit()
        {
            InitializeComponent();
        }



        public void GetMenu()
        {

            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Id, ProductName , ProductCategory,Price from Menu where IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            
            dataGridView1.DataSource = dataTable;
            dataGridView1.Columns[0].Visible = false;


           
            Context.db().Close();

        }


        private void MenuAddDeleteEdit_Load(object sender, EventArgs e)
        {
            GetMenu();
        }

        private void button1_Click(object sender, EventArgs e) //Ekleme
        {
            CustomerAdd customerAdd = new CustomerAdd(this);
            customerAdd.ShowDialog();
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

                SqlCommand deleteControl = new SqlCommand("DeleteMenu", Context.db());
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
                    GetMenu();
                
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



        private void MenuAddDeleteEdit_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e) //Edit
        {
            MenuEdit menuEdit = new MenuEdit(this);
            menuEdit.ShowDialog();
        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value);
        }
    }
}
