using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class Cashier : Abstract
    {
        //Id
        //Name
        public string Surname { get; set; }
        public float RegistrationNo { get; set; }
        public string Password { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
    }
}
