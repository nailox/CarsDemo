using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CarsDemo.Startup))]
namespace CarsDemo
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
