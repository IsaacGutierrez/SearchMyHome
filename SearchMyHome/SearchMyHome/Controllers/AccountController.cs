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
             if (ModelState.IsValid)
            {
                Suscriptor suscriptor = _entities.Suscriptor
                                       .Where(entity => entity.nombreUsuario == model._UserName)
                                        .SingleOrDefault();

                string passwordToValidate = UserProfileConfigurationViewModel
                                               .GeneratePasswordHash(model._Password,suscriptor.salt);

                if (passwordToValidate == suscriptor.password)
                {
                    model._Name = suscriptor.nombres;
                    LogIn(model);
                    return RedirectToAction("Index","Home");
                }

                ModelState.AddModelError("Password","Nombre de usuario o password incorecto");

            }

            return View();
        }
        //

        public ActionResult LogOut()
        {
            logOut();
            return RedirectToAction("Index","Home");
        }
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


                EmailHelper emailSender = new
                              EmailHelper(model.Email,HttpContext,suscriptor.SuscriptorGUID);
                /////send the email in other worker thread
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
                model._suscriptorGuid = suscriptor.SuscriptorGUID;
                model._email = suscriptor.correoElectronico;

                return View(model);
            }

            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult ConfigUserProfile(UserProfileConfigurationViewModel model)
        {
            if (ModelState.IsValid) {
                int SuscripcionBasica = 1;
            Suscriptor suscriptorAConfig = _entities.Suscriptor
                      .Where(suscriptor => suscriptor.SuscriptorGUID == model._suscriptorGuid)
                      .Single();

                     if (suscriptorAConfig != null)
                 {
                    suscriptorAConfig.nombres = model._name;
                    suscriptorAConfig.apellidos = model._lastname;
                    suscriptorAConfig.emailConfirmation = true;
                    suscriptorAConfig.password = UserProfileConfigurationViewModel
                                                         .GeneratePasswordHash(model._password,model._salt);
                    suscriptorAConfig.nombreUsuario = model._userName;
                    suscriptorAConfig.sexo = model._gender.ToString();
                    suscriptorAConfig.salt = model._salt;
                    suscriptorAConfig.perfilConfigurated = true;
                    suscriptorAConfig.numeroTelefonico = model._phoneNumber;
                    suscriptorAConfig.tipoSuscripcionId = SuscripcionBasica;
                 
                    _entities.SaveChanges();

                    LoginViewModel LoginModel = new LoginViewModel();
                    LoginModel._UserName = model._userName;
                    LoginModel._Name = model._name;
                    LogIn(LoginModel);

                    return RedirectToAction("Index","UserAdministration");
                   }
            }
            model._provincias = _entities.Provincias.AsEnumerable();
            return View(model);
        }

        [AllowAnonymous]
        public JsonResult GetMunicipios(int ProvinciaId)
        {
            var result = _entities.Municipios.Where(model => model.provinciaId == ProvinciaId)
                .Select(model => new {
                    value = model.municipioId,
                    name = model.nombre
            });

            return Json(result,JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// requires: LoginViewModel with user information
        /// effect: set the claims for authentication
        /// </summary>
        /// <param name="model">LoginViewModel with user information</param>
        private void LogIn(LoginViewModel model)
        {
            ClaimsIdentity identity = new ClaimsIdentity(DefaultAuthenticationTypes.ApplicationCookie);
            identity.AddClaim(new Claim(ClaimTypes.Name, model._Name));
            identity.AddClaim(new Claim(ClaimTypes.NameIdentifier,model._UserName));
            identity.AddClaim(new Claim(ClaimTypes.IsPersistent,model._RememberMe.ToString()));
            HttpContext.GetOwinContext().Authentication.SignIn(identity);

        }


        private void logOut()
        {
            HttpContext.GetOwinContext().Authentication.SignOut();
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