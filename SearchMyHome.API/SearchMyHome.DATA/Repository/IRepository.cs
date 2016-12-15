using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;


namespace SearchMyHome.DATA.Repository
{
    interface IRepository<T> where T:class 
    {
        string create(T entity );
        string update(T entity,int id);
        void delete(T entity);
        IQueryable<T> read(Expression<Func<T,bool>> predicate);
        T findById(int id);
        IEnumerable<T> readAll();
       
    }
}
