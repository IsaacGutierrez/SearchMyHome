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
    
    public partial class Suscriptor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Suscriptor()
        {
            this.AnuncioPublicitario = new HashSet<AnuncioPublicitario>();
            this.Inmobiliarias = new HashSet<Inmobiliarias>();
            this.Inmuebles = new HashSet<Inmuebles>();
            this.Reunion = new HashSet<Reunion>();
            this.Reunion1 = new HashSet<Reunion>();
            this.TipoSuscripcionSuscriptor = new HashSet<TipoSuscripcionSuscriptor>();
        }
    
        public int suscriptorId { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string nombreUsuario { get; set; }
        public string password { get; set; }
        public string salt { get; set; }
        public Nullable<int> direccionId { get; set; }
        public System.DateTime fechaNacimiento { get; set; }
        public string numeroTelefonico { get; set; }
        public string correoElectronico { get; set; }
        public Nullable<int> tipoSuscripcionId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AnuncioPublicitario> AnuncioPublicitario { get; set; }
        public virtual Direcciones Direcciones { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Inmobiliarias> Inmobiliarias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Inmuebles> Inmuebles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reunion> Reunion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reunion> Reunion1 { get; set; }
        public virtual TipoSuscripcion TipoSuscripcion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TipoSuscripcionSuscriptor> TipoSuscripcionSuscriptor { get; set; }
    }
}
