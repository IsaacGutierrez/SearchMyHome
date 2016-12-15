using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SearchMyHome.DATA;
using System.Linq.Expressions;

namespace SearchMyHome.DATA.Repository
{
    public class SuscriptorRepository : IRepository<Suscriptor>
    {
        SearchMyHomeDBEntities entities = new SearchMyHomeDBEntities();
        public string create(Suscriptor entity)
        {
            if (entity != null) {
                try {

                    entities.Suscriptor.Add(entity);
                    entities.SaveChanges();
                    return string.Format("API/Suscriptores/{0}", entity.suscriptorId);
                }
                catch (Exception)
                {
                    return string.Empty;
                }
            }
            return string.Empty;
        }

        public void delete(Suscriptor entity)
        {
            var suscriptor = entities.Suscriptor.Find(entity.suscriptorId);

            if (suscriptor!= null)
            {
                entities.Suscriptor.Remove(suscriptor);
                entities.SaveChanges();
            }
            
        }

        public IQueryable<Suscriptor> read(Expression<Func<Suscriptor,bool>> predicate)
        {
            var suscriptor = entities.Suscriptor.Where(predicate);
            return suscriptor;

           
        }

        public Suscriptor findById(int id)
        {
            var suscriptor = entities.Suscriptor.Single(model => model.suscriptorId == id);
            return suscriptor;

        }

        public IEnumerable<Suscriptor> readAll()
        {
            return entities.Suscriptor.AsEnumerable();
        }

        public string update(Suscriptor entity, int id)
        {
            var suscriptor = entities.Suscriptor.Find(id);
            if (suscriptor != null)
            {
                suscriptor.nombres = entity.nombres;
                suscriptor.apellidos = entity.apellidos;
                suscriptor.Direcciones.calle = entity.Direcciones.calle;
                suscriptor.correoElectronico = entity.correoElectronico;
                suscriptor.fechaNacimiento = entity.fechaNacimiento;
            }

            return string.Format("API/Suscriptores/{0}",id);
        }
    }
}
