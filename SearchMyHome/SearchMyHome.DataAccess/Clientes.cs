//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SearchMyHome.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Clientes
    {
        public int clienteId { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public Nullable<int> inmobiliariaId { get; set; }
        public string documentoIdentidad { get; set; }
        public string numeroTelefonico { get; set; }
        public string numeroMovil { get; set; }
        public int direccionId { get; set; }
    
        public virtual Direcciones Direcciones { get; set; }
        public virtual Inmobiliarias Inmobiliarias { get; set; }
    }
}
