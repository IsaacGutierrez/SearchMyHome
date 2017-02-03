using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class TipoServicios
    {
        [Key]
        public int TipoServicioId { get; set; }
        public string nombre { get; set; }
        public string Descripcion { get; set; }

    }
}
