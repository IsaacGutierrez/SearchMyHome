using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SearchMyHome.Models
{
    public class SubscriptionDetailViewModel
    {
        public int _subscriptionId { get; set; }
        public string _subscriptionTitle { get; set; }
        public decimal _price { get; set; }
        public string _period { get; set; }
        public IEnumerable<string> _features { get; set; }
    }
}