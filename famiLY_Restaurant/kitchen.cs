using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class kitchen:Abstract //mutfak
    {
        //Id
        public double Unit { get; set; } //Birimi
        public int Stock { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
    }
}
