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
    
    public partial class AnuncioPublicitario
    {
        public int anuncioPublicitarioId { get; set; }
        public string tituloAnuncio { get; set; }
        public int servicioInmobiliarioId { get; set; }
        public int suscriptorId { get; set; }
        public System.DateTime fechaPublicacion { get; set; }
        public System.DateTime fechaExpiracion { get; set; }
        public int inmuebleId { get; set; }
        public string descripcion { get; set; }
        public int estadoAnuncioId { get; set; }
        public Nullable<int> numeroVisitantes { get; set; }
    
        public virtual EstadoAnuncioPublicitario EstadoAnuncioPublicitario { get; set; }
        public virtual Inmuebles Inmuebles { get; set; }
        public virtual ServiciosInmobiliarios ServiciosInmobiliarios { get; set; }
        public virtual Suscriptor Suscriptor { get; set; }
    }
}
