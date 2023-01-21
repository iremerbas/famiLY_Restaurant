using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace famiLY_Restaurant
{
    internal interface ICrud<T>
    {
        void insert(T entity); //oluştur
        void delete(T entity); //sil
        void Update(T entity); //güncelle
        List<T> list();  // Read komutu


    }
}
