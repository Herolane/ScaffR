[assembly: WebActivator.PreApplicationStartMethod(typeof(MvcApplication130.Bootstrappers.Bootstrapper), "Routes")]

namespace MvcApplication130.Bootstrappers
{
    using System.Web.Http;
    using System.Web.Mvc;
    using System.Web.Routing;

    public partial class Bootstrapper
    {
        public static void Routes()
        {
            RouteTable.Routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            GlobalConfiguration.Configuration.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            RouteTable.Routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
