using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary
{
    public class TipoInmuebleComponentes
    {
        [Key]
        public int ComponenteId { get; set; }
        public int tipoInmuebleId { get; set; }
        public int componenteId { get; set; }
    }
}
