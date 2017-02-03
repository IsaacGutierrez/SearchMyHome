using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Servicios
    {
        [Key]
        public int servicioId { get; set; }
        public string descripcion { get; set; }
        public string nombre { get; set; }
        public string nombreProveedor { get; set; }
        public int tipoServicioId { get; set; }
    }
}
