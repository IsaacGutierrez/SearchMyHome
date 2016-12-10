using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace SearchMyHome.DATA.Repository
{
    interface IRepository<T>
    {
        string create(T entity );
        string update(T entity,int id);
        void delete(T entity);
        T read(int id);
        IEnumerable<T> readAll();
       
    }
}
