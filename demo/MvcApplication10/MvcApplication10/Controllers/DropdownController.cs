using System.Web.Mvc;

namespace MvcApplication10.Controllers
{
    using System.Reflection;

    public class DropdownController : Controller
    {
        [AllowAnonymous]
        public JsonResult GetDropdownFor(string method, string parameter = null)
        {
            var staticType = typeof(Dropdowns.Dropdowns);
            MethodInfo methodInfo = staticType.GetMethod(method, BindingFlags.Static | BindingFlags.Public);

            object[] param = null;
            if (parameter != null)
                param = parameter.Split('|');

            var listObj = methodInfo.Invoke(null, param);
            return Json(listObj, JsonRequestBehavior.AllowGet);
        }
    }
}
