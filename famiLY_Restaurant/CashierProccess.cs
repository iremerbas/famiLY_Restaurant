using famiLY_Restaurant.DbContext;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    class CashierProccess
    {
        public static string Name { get; set; }
        public static string Surname { get; set; }
     
        public static int Id { get; set; }

        public CashierProccess()
        {
            UserNameSurame();
        }
        private void UserNameSurame()
        {

            Context.db().Open();

            SqlCommand sql = new SqlCommand("select * from Cashier where Id=" + Id, Context.db());

            SqlDataReader reader = sql.ExecuteReader();

            while (reader.Read())
            {

                Name = reader["Name"].ToString();
                Surname = reader["Surname"].ToString();
             
            }
            Context.db().Close();

        }
    }
}
