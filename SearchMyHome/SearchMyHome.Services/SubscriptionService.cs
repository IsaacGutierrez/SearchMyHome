using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Stripe;
using SearchMyHome.DataAccess;
using System.Configuration;

namespace SearchMyHome.Services
{
    public class SubscriptionService
    {
        private SearchMyHomeDBEntities entities = new SearchMyHomeDBEntities();
        private StripeSubscriptionService subscriptionServices;
                
       public StripeSubscriptionService _subscriptionServices
        {
            get {
               return subscriptionServices ?? new StripeSubscriptionService();
            }
            private set { subscriptionServices = value;
            }
        }

        private StripeCustomerService customerServices;
        public StripeCustomerService _customerServices {
            get {
                return customerServices ?? new StripeCustomerService();
                }
            private  set {
                customerServices = value;
          
            }
        }

        public void createSuscription(int userId, TipoSuscripcion suscripcion, string token, string stripePrivateKey)
        {
          StripeConfiguration.SetApiKey(stripePrivateKey);
           var suscriptor = entities.Suscriptor.Find(userId);
            if (string.IsNullOrEmpty(suscriptor.stripeCustomerId))
            {
                var customer = new StripeCustomerCreateOptions() {
                    Email = suscriptor.correoElectronico,
                    SourceToken = token,
                    PlanId = suscripcion.externalId
                     
                     
                };

                var stripeCustomer = _customerServices.Create(customer);
               

                    suscriptor.stripeCustomerId = stripeCustomer.Id;
                    suscriptor.TipoSuscripcionSuscriptor.Add(new TipoSuscripcionSuscriptor() {
                    suscriptorId = suscriptor.suscriptorId,
                    tipoSuscripcionId = suscripcion.tipoSuscripcionId,
                    fechaExperacion = (DateTime.Now.AddDays(30)),
                    fechaCompra = DateTime.Now
                });

                entities.SaveChanges();

            }else{

                var subscriptionService = subscriptionServices.Create(suscriptor.stripeCustomerId, suscripcion.externalId);
                ///// update suscription

               }
            }
        }

    }

