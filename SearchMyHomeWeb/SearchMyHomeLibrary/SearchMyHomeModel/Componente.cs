using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class Componente
    {
        [Key]
        public int componentesId { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public int Nombre { get; set; }
    }
}
