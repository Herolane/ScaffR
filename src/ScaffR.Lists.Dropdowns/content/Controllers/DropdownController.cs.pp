using System.Web.Mvc;

namespace $rootnamespace$.Controllers
{
    using System.Reflection;

    public class DropdownController : Controller
    {
        public JsonResult GetDropdownFor(string method, string parameter)
        {
            var param = parameter.Split('|');

            var staticType = typeof(Dropdowns.Dropdowns);

            MethodInfo methodInfo = staticType.GetMethod(method, BindingFlags.Static | BindingFlags.Public);

            var listObj = methodInfo.Invoke(null, param);

            return Json(listObj, JsonRequestBehavior.AllowGet);
        }

    }
}
