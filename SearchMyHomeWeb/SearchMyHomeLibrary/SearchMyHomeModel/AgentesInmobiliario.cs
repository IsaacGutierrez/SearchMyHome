using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class AgentesInmobiliario
    {
        [Key]
        public int agenteInmobiliarioId { get; set; }
        [Required]
        [StringLength(maximumLength:50)]
        public string nombre { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string apellidos { get; set; }

        public int surcusalId { get; set; }
    }
}
