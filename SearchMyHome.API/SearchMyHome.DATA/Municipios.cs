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
    
    public partial class Municipios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Municipios()
        {
            this.Localidad = new HashSet<Localidad>();
        }
    
        public int municipioId { get; set; }
        public string nombre { get; set; }
        public string geoLongitud { get; set; }
        public string geoLatitud { get; set; }
        public Nullable<int> provinciaId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Localidad> Localidad { get; set; }
        public virtual Provincias Provincias { get; set; }
    }
}
