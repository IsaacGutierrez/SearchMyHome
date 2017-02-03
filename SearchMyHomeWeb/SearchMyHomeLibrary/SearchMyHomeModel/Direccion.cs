using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class Direccion
    {
        [Key]
        public int direccionId { get; set; }
        [Required]
        [StringLength(maximumLength: 100)]
        public string calle { get; set; }
        [Required]
        [StringLength(maximumLength: 10)]
        public string numeroPropiedad { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string geoLatitud { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string geoLongitud { get; set; }
        [Required]
        public int localidadId { get; set; }
    }
}
