using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SearchMyHome.DATA;

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

        public void delete(int id)
        {
            var suscriptor = entities.Suscriptor.Find(id);

            if (suscriptor!= null)
            {
                entities.Suscriptor.Remove(suscriptor);
                entities.SaveChanges();
            }
            
        }

        public Suscriptor read(int id)
        {
            var suscriptor = entities.Suscriptor.Find(id);
            if (suscriptor!= null)
                return suscriptor;
            throw new Exception("no se encontro la entidad");
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
