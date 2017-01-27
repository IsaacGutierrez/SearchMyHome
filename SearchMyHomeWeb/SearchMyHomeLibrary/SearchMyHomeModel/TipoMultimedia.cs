using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class TipoMultimedia
    {
        [Key]
        public int tipoMultimedia { get; set; }
        public string descripcion { get; set; }
    }
}
