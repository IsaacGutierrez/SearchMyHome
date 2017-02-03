using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Multimedia
    {
        [Key]
        public int multimediaId { get; set; }
        [Required]
        public string Url { get; set; }
        public string descripcion {get; set;}
        public int tipoMultimediaId { get; set; }
        public int inmuebleId { get; set; }
    }
}
