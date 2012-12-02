namespace $rootnamespace$.Controllers.Home
{
    using System.Web.Mvc;
    using IdentityModel.Authorization.MVC;

    public partial class HomeController : Controller
    {
        [ClaimsAuthorize("View", "ManageUsers")]
        public ActionResult Manage()
        {
            return Content("No Content");
        }
    }
}