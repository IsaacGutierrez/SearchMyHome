using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace SearchMyHomeLibrary.SearchMyHomeModel
{
    public class Periodos
    {
        [Key]
        public int idPeriodo{ get; set; }
        public string periodo { get; set; }
    }
}
