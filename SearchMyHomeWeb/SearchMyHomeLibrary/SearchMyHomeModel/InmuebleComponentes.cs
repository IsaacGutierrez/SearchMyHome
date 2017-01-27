using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class InmuebleComponentes
    {
        [Key]
        public int inmuebleComponentesId { get; set; }
        public int componentesId { get; set; }
        public int InmuebleId { get; set; }
        public float cantidad { get; set; }
        public int descripcion { get; set; }
    }
}
