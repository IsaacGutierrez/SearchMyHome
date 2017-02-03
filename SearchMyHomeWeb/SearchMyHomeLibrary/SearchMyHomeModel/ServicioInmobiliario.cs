using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class ServicioInmobiliario
    {
        [Key]
        public int servicioInmobiliarioId { get; set; }
        public int servicioInmobiliario { get; set; }
    }
}
