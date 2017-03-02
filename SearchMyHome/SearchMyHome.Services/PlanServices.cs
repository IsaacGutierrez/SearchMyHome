using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Stripe;
using SearchMyHome.DataAccess;

namespace SearchMyHome.Services
{
    public class PlanServices
    {
        private PlanServices _planServices { get; set; }
        private SearchMyHomeDBEntities _model { get; set; }
        public PlanServices(SearchMyHomeDBEntities entities, PlanServices planServices)
        {
            this._model = entities;
            this._planServices = planServices;
        }
        public PlanServices():this(new SearchMyHomeDBEntities(),new PlanServices())
        {

        }


    }
}
