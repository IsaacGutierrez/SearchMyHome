using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Inmobiliaria
    {
        [Key]
        public int inmobiliariaId { get; set; }
        public int suscriptorid { get; set; }
        public string correoEletronico { get; set; }
        public string numeroTelefonico { get; set; }
        public string descripcion { get; set; }
    }
}
