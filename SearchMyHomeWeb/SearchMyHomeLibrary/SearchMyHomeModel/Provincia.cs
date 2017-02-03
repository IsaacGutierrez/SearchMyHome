using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class Provincia
    {
        [Key]
        public int provinciaId { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string nombre { get; set; }
        [StringLength(maximumLength: 50)]
        public string geoLatitud { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string geoLongitud { get; set; }
    }
}
