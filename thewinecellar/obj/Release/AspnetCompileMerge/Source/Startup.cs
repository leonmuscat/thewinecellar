using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(theWineCellar.Startup))]
namespace theWineCellar
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
