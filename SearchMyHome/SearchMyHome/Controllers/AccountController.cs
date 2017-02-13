using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using SearchMyHome.Models;
using SearchMyHome.DataAccess;
using System.Net;

namespace SearchMyHome.Controllers
{  
    [Authorize]
    [RequireHttps]
    public class AccountController : Controller
    {
        private SearchMyHomeDBEntities _entities = new SearchMyHomeDBEntities();
      
     
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {

            return View();
        }
        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            PreRegisterViewModel model = new PreRegisterViewModel();
            return View(model);
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Register(PreRegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                Suscriptor suscriptor = new Suscriptor()
                {
                    nombres = model.Names,
                    apellidos = model.Lastnames,
                    correoElectronico = model.Email,
                    numeroTelefonico = model.PhoneNumber,
                    emailConfirmation = false,
                    SuscriptorGUID = model.getSuscriptorGuid().ToString()
                };
                 
                _entities.Suscriptor.Add(suscriptor);
                _entities.SaveChanges();


                string link = "https://localhost:44345/Account/EmailConfirmation?GuidCode=" + model.getSuscriptorGuid().ToString();

                string fileUrl = HttpContext.Server.MapPath(@"~/Content/EmailConfirmation.html");
                string ConfirmationMail = System.IO.File.ReadAllText(fileUrl);
                string replaced = ConfirmationMail.Replace("{LINK-CONFIRMATION}", link);
                EmailHelper emailSender = new EmailHelper(replaced, model.Email);

                emailSender.SendEmailAsync();


                return View("EmailConfirmationSended",model);

            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult EmailConfirmation(string GuidCode)
        {
            Suscriptor suscriptor = _entities.Suscriptor
                                    .Where(model => model.SuscriptorGUID
                                    == GuidCode).FirstOrDefault();
            if (suscriptor != null) {

                suscriptor.emailConfirmation = true;
                _entities.SaveChanges();

                return RedirectToAction("ConfigUserProfile", "Account",
                    new { suscriptorGUID = suscriptor.SuscriptorGUID });

            }

            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        }

        [AllowAnonymous]
        public ActionResult ConfigUserProfile(string suscriptorGUID)
        {
            var suscriptor = _entities.Suscriptor
                                      .Where(model => model.SuscriptorGUID == suscriptorGUID)
                                      .FirstOrDefault();
            if (suscriptor != null) {

                UserProfileConfigurationViewModel model = new UserProfileConfigurationViewModel(false);
                model._name = suscriptor.nombres;
                model._lastname = suscriptor.apellidos;
                model._email = suscriptor.correoElectronico;
                model._phoneNumber = suscriptor.numeroTelefonico;
                model._provincias = _entities.Provincias.AsEnumerable();
                return View(model);
            }

            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult ConfigUserProfile(UserProfileConfigurationViewModel model)
        {
            Suscriptor suscriptorAConfig = _entities.Suscriptor
                      .Where(suscriptor => suscriptor.SuscriptorGUID == model._suscriptorGuid)
                      .Single();
            if (suscriptorAConfig != null)
            {
                suscriptorAConfig.nombres = model._name;
                suscriptorAConfig.apellidos = model._lastname;
                suscriptorAConfig.correoElectronico = model._email;
                //suscriptorAConfig.fotoPerfilUrl = ""


            }
            return View();
        }



        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}