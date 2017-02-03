using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class TipoInmueble
    {
        [Key]
        public int tipoInmuebleId { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public int Nombre { get; set; }
        [Required]
        [StringLength(maximumLength: 100)]
        public int Descripcion { get; set; }
    }
}
