using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class waiter : Abstract //garson
    {
        //Id
        //Name
        public string Surname { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    }
}
