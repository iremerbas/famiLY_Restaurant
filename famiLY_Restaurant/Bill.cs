using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal class Bill:Abstract //Adisyon
    {
        //Id
        public string waiterName { get; set; } //garson name
        public string tableName { get; set; } //masa name
        public string menuName { get; set; } //yemek_içecek
        public float TotalPrice { get; set; } //Toplam Fiyat
        public DateTime PaymentDate { get; set; }  //Ödeme Tarihi
        public bool IsStatus { get; set; }
        public bool IsDelete { get; set; }
    }
}
