using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Sucursales
    {
        [Key]
        public int surcusalId { get; set; }
        public int direccionId { get; set; }
        public string numeroTelefonico { get; set; }
        public int inmobiliarioId { get; set; }
    }
}
