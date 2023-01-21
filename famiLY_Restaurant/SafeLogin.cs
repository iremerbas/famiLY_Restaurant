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
    public partial class SafeLogin : Form
    {
        string loginMessage = "";
        public SafeLogin()
        {
            InitializeComponent();
        }

        private void loginBtn_Click(object sender, EventArgs e)
        {
            Context.db().Open();

            SqlCommand loginControl = new SqlCommand("CashierLogin", Context.db());
            loginControl.CommandType = CommandType.StoredProcedure;
            loginControl.Parameters.Add("RegistrationNo", SqlDbType.NVarChar, 200).Value = registrationNoTxt.Text;
            loginControl.Parameters.Add("Password", SqlDbType.NVarChar, 200).Value = passwordTxt.Text;


            var returnValue = loginControl.Parameters.Add("@LoginControl", SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            loginControl.ExecuteNonQuery();

            var resualt = returnValue.Value;

            Context.db().Close();
            loginMessage = resualt.ToString() == "0" ? "Login Failed" : "Login Success";

            if (resualt.ToString() != "0")
            {
                MessageBox.Show(loginMessage, "Login System", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Safe safe= new Safe();

                //mainMenu.id = Convert.ToInt32(resualt);
                CashierProccess.Id = Convert.ToInt32(resualt);

                this.Hide();
                safe.ShowDialog();
                this.Show();
                
               

            }
            else
            {
                MessageBox.Show(loginMessage, "Login System", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
