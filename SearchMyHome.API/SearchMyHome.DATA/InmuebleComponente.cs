//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SearchMyHome.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class InmuebleComponente
    {
        public int inmuebleComponenteId { get; set; }
        public int componenteId { get; set; }
        public Nullable<int> inmuebleId { get; set; }
        public Nullable<double> cantidad { get; set; }
        public string descripcion { get; set; }
    
        public virtual Componentes Componentes { get; set; }
        public virtual Inmuebles Inmuebles { get; set; }
    }
}
