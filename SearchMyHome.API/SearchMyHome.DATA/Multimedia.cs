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
    
    public partial class Multimedia
    {
        public int multimediaId { get; set; }
        public string URL { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> tipoMultimediaId { get; set; }
        public Nullable<int> inmuebleId { get; set; }
    
        public virtual Inmuebles Inmuebles { get; set; }
        public virtual TipoMultimedia TipoMultimedia { get; set; }
    }
}
