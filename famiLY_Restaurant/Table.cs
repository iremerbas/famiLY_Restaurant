using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class Table:Abstract
    {
        //Id
        //Name
        public bool IsStatus { get; set; } // dolu mu boş mu
        public bool IsDelete { get; set; }
    }
}
