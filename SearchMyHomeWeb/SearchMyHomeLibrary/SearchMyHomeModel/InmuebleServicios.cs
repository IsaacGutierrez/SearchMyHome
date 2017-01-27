using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class InmuebleServicios
    {
        [Key]
        public int inmuebleServicioId { get; set; }
        public int inmuebleId { get; set; }
        public int servicioId { get; set; }
    }
}
