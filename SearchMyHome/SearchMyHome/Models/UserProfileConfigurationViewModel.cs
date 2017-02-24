using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.ComponentModel.DataAnnotations;
using SearchMyHome.DataAccess;
using SearchMyHome.Models.Validators;
using System.Text;

namespace SearchMyHome.Models
{
    public class UserProfileConfigurationViewModel
    {
        public string _name { get; set; }
        public string _lastname { get; set; }

        [Required(ErrorMessage ="Este campo es obligatorio")]
        public string _userName { get; set; }
        [Required(ErrorMessage = "Este campo es obligatorio")]
        [EmailAddress(ErrorMessage = "Formato incorrecto")]
        public string _email { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio")]
        [StringLength(100,ErrorMessage ="El password deber contener mas 10 caracteres",MinimumLength = 10)]
        public string _password { get; set; }

        [Required(ErrorMessage = "Este campo es obligatorio")]
        [Compare("_password",ErrorMessage ="Este campo debe ser igual que el password")]
        public string _confirmPassword { get; set; }

        public string _salt { get; set; }
    
        public string _phoneNumber { get; set; }

        public HttpPostedFileBase _profileImage { get; set; }
        public char _gender { get; set; }
       
        public DateTime _birthDate { get; set; }
        public string _suscriptorGuid { get; set; }
        public IEnumerable<Provincias> _provincias { get; set; }
        public int _provinciaId { get; set; }
        public int _municipioId { get; set; }
        public string _street { get; set; }
    
        public UserProfileConfigurationViewModel()
        {   
            ///generate a salt cybertext with 32bytes of length
            this._salt = generateSaltCode(32);

        }

        public UserProfileConfigurationViewModel(bool NongenerateSalt)
        {
             
        }


        private string generateSaltCode(int length)
        {
            byte[] buffer = new byte[length];

            using (RNGCryptoServiceProvider RandomCyberTextGenerator =
                                                new RNGCryptoServiceProvider())

            {
                RandomCyberTextGenerator.GetBytes(buffer);
                string saltCyberString = Convert.ToBase64String(buffer);
                return saltCyberString;

            }
        }


        /// <summary>
        /// this method is use to mix with mixing hide operation 
        /// </summary>
        /// <param name="password"></param>
        /// <param name="CyberSaltText"></param>
        /// <returns></returns>
        private static string mixSaltWithPassword(string password,string CyberSaltText)
        {
            ///operation -> password+salt+salt+salt+password
            string Mix = string.Format("{0}{1}{2}{3}{4}", 
                                password, CyberSaltText, 
                                CyberSaltText, CyberSaltText, password);
            return Mix;
        }

        public static string GeneratePasswordHash(string password,string CyberSaltText)
        {
            string CyberTextToHashing = mixSaltWithPassword(password, CyberSaltText);
            using (HashAlgorithm hashGenerator = SHA256.Create())
            {
                byte[] buffer = Encoding.ASCII.GetBytes(CyberTextToHashing);
                byte[] passwordHashStream =  hashGenerator.ComputeHash(buffer);
                string hashInStringBase64 = Convert.ToBase64String(passwordHashStream);
                return hashInStringBase64;
            }
        }



    }
}