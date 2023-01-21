using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant.DbContext
{
    public class Context
    {
        private static SqlConnection database = new SqlConnection(@"Data Source=(localdb)\MssqlLocaldb; initial Catalog=famiLYRestaurantDb;integrated security=true");

        public static SqlConnection db()
        {
            return database;
        }
    }
}
