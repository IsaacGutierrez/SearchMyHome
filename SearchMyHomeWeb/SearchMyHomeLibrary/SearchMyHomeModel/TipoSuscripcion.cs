using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class TipoSuscripcion
    {
        [Key]
        public int tipoSuscripcion { get; set; }
        public string nombre { get; set; }
        public string descripcion {get;set;}
        public float precio {get;set;}
        public int periodoId { get; set; }
    }
}
