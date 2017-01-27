using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class Inmueble
    {
        [Key]
        public int inmuebleid { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string codigoNFC { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string codigoQR { get; set; }
        [Required]
        [StringLength(maximumLength: 300)]
        public string descripcion { get; set; }
        [Required]
        public int suscriptorId { get; set; }
        public int tipoInmuebleId { get; set; }
        public int estadoInmuebleId { get; set; }
        [DataType(DataType.Currency)]
        public float Precio { get; set; }
        [Required]
        public int direccionId { get; set; }
    }
}
