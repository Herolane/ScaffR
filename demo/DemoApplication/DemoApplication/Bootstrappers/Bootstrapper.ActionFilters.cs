[assembly: WebActivator.PreApplicationStartMethod(typeof(DemoApplication.Bootstrappers.Bootstrapper), "ActionFilters")]

namespace DemoApplication.Bootstrappers
{
    using System.Web.Mvc;

    public partial class Bootstrapper
    {
        public static void ActionFilters()
        {
            GlobalFilters.Filters.Add(new HandleErrorAttribute());
			GlobalFilters.Filters.Add(new AuthorizeAttribute());
        }
    }
}