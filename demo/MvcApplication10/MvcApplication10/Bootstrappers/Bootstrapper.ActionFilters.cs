[assembly: WebActivator.PreApplicationStartMethod(typeof(MvcApplication10.Bootstrappers.Bootstrapper), "ActionFilters")]

namespace MvcApplication10.Bootstrappers
{
    using System.Web.Mvc;
    using Controls.DropDown.Filters;

    public partial class Bootstrapper
    {
        public static void ActionFilters()
        {
            GlobalFilters.Filters.Add(new HandleErrorAttribute());
            GlobalFilters.Filters.Add(new AuthorizeAttribute());
            GlobalFilters.Filters.Add(new FillDropDowns());
        }
    }
}