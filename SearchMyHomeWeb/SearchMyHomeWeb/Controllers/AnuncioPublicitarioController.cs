using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SearchMyHomeLibrary;
namespace SearchMyHomeWeb.Controllers
{
    public class AnuncioPublicitarioController : Controller
    {
        // GET: AnuncioPublicitario
        public ActionResult AgregarAnuncio()
        {
            return View();
        }
        //POST
        [HttpPost]
        public ActionResult AgregarAnuncio(AnuncioPublicitario anuncio)
        {

            return RedirectToAction("Index");
        }

        public ActionResult ModificarAnuncio()
        {
            return RedirectToAction("Index");
        }

        //POST
        [HttpPost]
        public ActionResult ModificarAnuncio(AnuncioPublicitario anuncio)
        {

            return RedirectToAction("Index");
        }
        
    }
}