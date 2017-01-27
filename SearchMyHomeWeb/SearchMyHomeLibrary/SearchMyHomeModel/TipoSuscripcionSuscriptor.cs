using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class TipoSuscripcionSuscriptor
    {
        [Key]
        public int tiposuscripcionsuscriptorId { get; set; }
        public int suscriptorid { get; set; }
        public int tiposuscripcion { get; set; }
        public DateTime fechaCompra { get; set; }
        public DateTime fechaExpiracion { get; set; }
        public int estadoSuscripcion { get; set; }
    }
}
