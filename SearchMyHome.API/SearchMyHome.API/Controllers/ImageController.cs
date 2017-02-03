using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace SearchMyHome.API.Controllers
{
    public class ImageController : Controller
    {
        // GET: Image
        public ActionResult Index()
        {
            return View();
        }

        public FileResult GetImage() {

                byte[] fileBytes = System.IO.File.ReadAllBytes(@"C:\Users\Isaac Gutierrez\Downloads\ForRentHome-1050x751.jpg");
                string filename = "ForRentHome-1050x751.jpg";
                return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, filename);        
        }
    }
}