using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class menu : Abstract
    {
        //Id
        //Name

        public int Price { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
        public string CategoryName { get; set; }
    }
}
