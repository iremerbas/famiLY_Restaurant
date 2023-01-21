using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class PaymentType:Abstract
    {
        public string Cash { get; set; }
        public string CreditCard { get; set; }
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
    }
}
