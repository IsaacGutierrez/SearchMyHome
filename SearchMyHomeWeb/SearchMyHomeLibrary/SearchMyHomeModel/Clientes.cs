using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Clientes
    {
        [Key]
        public int clienteId { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string nombre { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string apellidos { get; set; }


        public int inmobiliariaId { get; set; }

        [Required]
        [StringLength(maximumLength: 30)]
        public string documentoIdentidad { get; set; }


        public string numeroTelefonico { get; set; }
        public string numeroMovil { get; set; }
        [Required]
        public int dirrecionId { get; set; }

    }
}