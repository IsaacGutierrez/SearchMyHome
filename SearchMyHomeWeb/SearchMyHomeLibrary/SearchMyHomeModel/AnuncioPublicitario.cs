using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary
{
    public class AnuncioPublicitario
    {
        [Key]
        public int anuncioPublicitarioId { get; set; }

        [Required]
        [StringLength(maximumLength: 300, MinimumLength = 10)]
        public string tituloAnuncio { get; set; }

        public int servicioInmobiliarioId { get; set; }

        public int suscriptorId { get; set; }

        public DateTime fechaPublicacion { get; set; }

        public DateTime fechaExpiracion { get; set; }

        public int inmuebleId { get; set; }

        [Required]
        [StringLength(maximumLength: 300, MinimumLength = 10)]
        public string descripcion { get; set; }

        public int estadoAnuncioId { get; set; }

        public int numeroVisitantes { get; set; }

    }
}
