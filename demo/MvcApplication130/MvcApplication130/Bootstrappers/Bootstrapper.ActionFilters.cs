[assembly: WebActivator.PreApplicationStartMethod(typeof(MvcApplication130.Bootstrappers.Bootstrapper), "ActionFilters")]

namespace MvcApplication130.Bootstrappers
{
    using System.Web.Mvc;

    public partial class Bootstrapper
    {
        public static void ActionFilters()
        {
            GlobalFilters.Filters.Add(new HandleErrorAttribute());
        }
    }
}