using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Reunion
    {
        [Key]
        public int reunionId { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaTermino { get; set; }
        public TimeSpan duracion { get; set; }
        public int suscriptorSolicitanteId { get; set; }
        public int suscriptorEncargadoId { get; set; }
        public int estadoReunionId { get; set; }
    }
}
