using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{
    using Core.Common.Lists;

    public class DropdownController : Controller
    {
        public JsonResult GetDropdownFor(string method, string parameter)
        {
            return Json(Dropdowns.Dropdowns.UnitedStates(), JsonRequestBehavior.AllowGet);
        }

    }
}
