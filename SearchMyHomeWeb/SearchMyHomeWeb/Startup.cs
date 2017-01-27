using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SearchMyHomeWeb.Startup))]
namespace SearchMyHomeWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
