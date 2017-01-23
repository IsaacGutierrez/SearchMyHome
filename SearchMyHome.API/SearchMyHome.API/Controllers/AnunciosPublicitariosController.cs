using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SearchMyHome.DATA;

namespace SearchMyHome.API.Controllers
{
    public class AnunciosPublicitariosController : ApiController
    {
        SearchMyHomeDBEntities entities = new SearchMyHomeDBEntities();
        public IHttpActionResult get()
        {
            try {

                var anuncios = entities.AnuncioPublicitario.AsEnumerable();
                /// 200 HTTP status code success
                return Ok(anuncios);

            } catch (Exception)
            {
                /// 500 HTTP status code internal server error
                return InternalServerError();
            }
           
        }

        [HttpPost]
        public IHttpActionResult post([FromBody] AnuncioPublicitario anuncioPublicitario)
        {

            return Created("/AnuncioPublicitarios/" + 2, new AnuncioPublicitario());
        }
    }
} 
