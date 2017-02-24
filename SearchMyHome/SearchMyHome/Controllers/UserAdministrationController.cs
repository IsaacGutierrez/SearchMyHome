using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SearchMyHome.Controllers
{
    [Authorize]
    public class UserAdministrationController : Controller
    {
        // GET: UserAdministration
       
        public ActionResult Index()
        {
            return View();
        }
    }
}