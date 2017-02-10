﻿using System.ComponentModel.DataAnnotations;

namespace SearchMyHomeLibrary
{
    public class Municipio
    {
        [Key]
        public int municipioId { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string nombre { get; set; }
        [StringLength(maximumLength: 50)]
        public string geoLatitud { get; set; }
        [Required]
        [StringLength(maximumLength: 50)]
        public string geoLongitud { get; set; }
        public int provinciaid { get; set; }
    }
}