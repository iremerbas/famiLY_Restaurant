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
    public partial class Tables : Form
    {
        SqlConnection db = new SqlConnection(@"Data source=(localdb)\MsSqlLocalDb; initial catalog=famiLYRestaurantDb; User Id = sa; password = 123"); //Bağlantı   şifreli
        public Tables()
        {
            InitializeComponent();
        }

        private void Tables_Load(object sender, EventArgs e)
        {


        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

       
    }
}
