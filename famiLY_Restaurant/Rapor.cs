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
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }


        private void Rapor_Load(object sender, EventArgs e)
        {
            Context.db().Open();

            SqlCommand sql = new SqlCommand("CashTotal", Context.db());
            sql.CommandType = CommandType.StoredProcedure;

            var returnValue =sql.Parameters.Add("@ReturnVal",SqlDbType.Float);

            returnValue.Direction = ParameterDirection.ReturnValue;

            sql.ExecuteNonQuery();

            SqlCommand sqlCommand = new SqlCommand("CrediCartTotal", Context.db());
            sqlCommand.CommandType = CommandType.StoredProcedure;

            var returnValue1 = sqlCommand.Parameters.Add("@ReturnVal", SqlDbType.Float);

            returnValue1.Direction = ParameterDirection.ReturnValue;

            sqlCommand.ExecuteNonQuery();

            SqlCommand sc = new SqlCommand("Total", Context.db());
            sc.CommandType = CommandType.StoredProcedure;

            var returnValue2 = sc.Parameters.Add("@ReturnVal", SqlDbType.Float);

            returnValue2.Direction = ParameterDirection.ReturnValue;

            sc.ExecuteNonQuery();

            Context.db().Close();


            double result = Convert.ToDouble(returnValue.Value);

            lblCash.Text = result.ToString();

            double result1 = Convert.ToDouble(returnValue1.Value);

            lblIban.Text = result1.ToString();


            double result2 = Convert.ToDouble(returnValue2.Value);

            lblTotal.Text = result2.ToString();



        }
    }
}
