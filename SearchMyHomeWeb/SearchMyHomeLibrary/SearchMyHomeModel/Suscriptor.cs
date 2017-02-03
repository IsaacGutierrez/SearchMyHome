using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Suscriptor
    {
        [Key]
        public int suscriptorId { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string nombreUsuario { get; set; }
        public string password { get; set; }
        public int dirrecionId { get; set; }
        public DateTime fechaDeNacimiento { get; set; }
        public string numeroTelefonico{ get; set; }
        public string Email { get; set; }
        public int tipoSuscripcionId { get; set; }
    }
}
