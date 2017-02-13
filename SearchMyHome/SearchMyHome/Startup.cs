using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SearchMyHome.Startup))]
namespace SearchMyHome
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
