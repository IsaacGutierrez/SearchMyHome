using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SearchMyHome.DATA;

namespace SearchMyHome.API.Controllers
{
    public class SuscriptoresController : ApiController
    {
        SearchMyHomeDBEntities entities = new SearchMyHomeDBEntities();
        public IHttpActionResult get()
        {
            try {
                var suscriptores = entities.Suscriptor.Select(model => new
                { suscriptorid = model.suscriptorId, nombres = model.nombres, apellidos =model.apellidos, suscripcion = model.TipoSuscripcion.nombre
                }).AsEnumerable();
                return Ok(suscriptores);
            }
            catch (Exception)
            {
                return InternalServerError();
            }
        }
    }
}
