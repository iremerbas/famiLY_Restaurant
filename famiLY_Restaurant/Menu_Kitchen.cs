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
    public partial class Menu_Kitchen : Form
    {
        int addMenuId = 0;
        int deleteMenuId = 0;
        public int id = 0;
        List<kitchen> Kitchen = new List<kitchen>();
        List<menu> Menu = new List<menu>();
        public Menu_Kitchen()
        {
            InitializeComponent();
        }

        private void Menu_Kitchen_Load(object sender, EventArgs e)
        {
            GetMenuKitchen();
            GetMenu();
            GetKitchen();
            GetMenuType();
            GetKitchenType();
        }


        public void GetMenuKitchen()
        {
            Context.db().Open();

            string sorgu = "select MenuKitchenn.Id,Menu.ProductName,Kitchen.Name,Piece,Unit from MenuKitchenn \r\ninner join Menu on(MenuKitchenn.MenuId=Menu.Id) \r\ninner join Kitchen on(MenuKitchenn.KitchenId=Kitchen.Id)\r\nwhere MenuKitchenn.IsDelete=0";
            SqlCommand sql = new SqlCommand(sorgu, Context.db());

            SqlDataAdapter sqlData = new SqlDataAdapter(sql);

            DataTable table = new DataTable();
            sqlData.Fill(table);

            dataGridView3.DataSource = table;  //MenuKitchen
            dataGridView4.DataSource = table;  //Add
            dataGridView5.DataSource = table;  //Delete

            dataGridView3.Columns[0].Visible = false;
            dataGridView4.Columns[0].Visible = false;
            dataGridView5.Columns[0].Visible = false;

            Context.db().Close();


        }
        public void GetMenu()
        {


            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select ProductName,ProductCategory from Menu";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            dataGridView1.DataSource = dataTable;

            Context.db().Close();


        }

        public void GetKitchen()
        {

            Context.db().Open();

            DataTable dataTable = new DataTable();
            string sorgu = "select Name, Unit, Stock from Kitchen where IsDelete=0";

            SqlDataAdapter sql = new SqlDataAdapter(sorgu, Context.db());
            sql.Fill(dataTable);

            dataGridView2.DataSource = dataTable;




            Context.db().Close();
        }

        public void GetMenuType()
        {
            Context.db().Open();

            string sorgu = "select Id,ProductName from Menu where IsDelete=0 and IsStatus=1";
            SqlCommand sql = new SqlCommand(sorgu, Context.db());

            SqlDataAdapter sqlData = new SqlDataAdapter(sql);

            DataTable table = new DataTable();


            sqlData.Fill(table);

            addMenuNameCombo.DataSource = table;
            addMenuNameCombo.ValueMember = "Id";
            addMenuNameCombo.DisplayMember = "ProductName";



            Context.db().Close();
        }
        public void GetKitchenType()
        {
            Context.db().Open();

            string sorgu = "select Id,Name from Kitchen where IsDelete=0 and IsStatus=1";
            SqlCommand sql = new SqlCommand(sorgu, Context.db());

            SqlDataAdapter sqlData = new SqlDataAdapter(sql);

            DataTable table = new DataTable();


            sqlData.Fill(table);

            addKitchenNameCombo.DataSource = table;
            addKitchenNameCombo.ValueMember = "Id";
            addKitchenNameCombo.DisplayMember = "Name";

            Context.db().Close();
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();
            SqlCommand sqlCommand = new SqlCommand("AddMenuKitchen", Context.db());
            sqlCommand.CommandType = CommandType.StoredProcedure;
            //sqlCommand.Parameters.Add("Id", SqlDbType.Int).Value = addMenuId;
            sqlCommand.Parameters.Add("MenuId", SqlDbType.Int).Value = Convert.ToInt32(addMenuNameCombo.SelectedValue);
            sqlCommand.Parameters.Add("KitchenId", SqlDbType.Int).Value = Convert.ToInt32(addKitchenNameCombo.SelectedValue);
            sqlCommand.Parameters.Add("Piece", SqlDbType.Float).Value = AddtxtPiece.Text;
            sqlCommand.Parameters.Add("Status", SqlDbType.Bit).Value = addCheckIsStatus.Checked;


            var ReturnValue = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
            ReturnValue.Direction = ParameterDirection.ReturnValue;
            sqlCommand.ExecuteNonQuery();
            int result = Convert.ToInt32(ReturnValue.Value);

            Context.db().Close();

            if (result == 1)
            {
                MessageBox.Show("MenuKitchen Added Successfull", "MenuKitchenn Add", MessageBoxButtons.OK, MessageBoxIcon.Information);
                GetMenuKitchen();
            }
            else
            {
                MessageBox.Show("An error occurred while adding!", "MenuKitchen Add", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void deleteBtn_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = new DialogResult();
            dialogResult = MessageBox.Show("Delete Menu-Kitchen",
                                            "Delete",
                                            MessageBoxButtons.YesNo,
                                            MessageBoxIcon.Information);

            if (dialogResult == DialogResult.Yes)
            {
                Context.db().Open();

                SqlCommand sqlCommand = new SqlCommand("DeleteMenuKitchen", Context.db());
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.Add("Id", SqlDbType.Int).Value = deleteMenuId;

                var ReturnValue = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Int);
                ReturnValue.Direction = ParameterDirection.ReturnValue;
                sqlCommand.ExecuteNonQuery();



                Context.db().Close();

                int result = Convert.ToInt32(ReturnValue.Value);
                if (result == 1)
                {
                    MessageBox.Show("Menu-Kitchen deleted succesful",
                                    "Delete",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Warning);
                    GetMenuKitchen();
                    // UnselectDeleteMovie();
                }
                else
                {
                    MessageBox.Show("Not Found Menu-Kitchen",
                                    "Delete",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("Deletion Canceled",
                                "Delete",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Information);
            }
        }

        private void dataGridView5_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            deleteMenuId = Convert.ToInt32(dataGridView5.CurrentRow.Cells[0].Value);

            deleteMenuName.Items.Clear();
            deleteMenuName.Items.Add(dataGridView5.CurrentRow.Cells[1].Value);
            deleteMenuName.SelectedIndex = 0;

            deleteKitchenName.Items.Clear();
            deleteKitchenName.Items.Add(dataGridView5.CurrentRow.Cells[2].Value);
            deleteKitchenName.SelectedIndex = 0;

            deletePieceTxt.Text = dataGridView5.CurrentRow.Cells[3].Value.ToString();

            deleteUnitTxt.Text = dataGridView5.CurrentRow.Cells[4].Value.ToString();


        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
