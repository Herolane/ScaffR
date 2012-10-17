namespace $rootnamespace$.Controllers.Home
{
    using System.Web.Mvc;
    using MvcSiteMapProvider;
    
    public partial class HomeController : BaseController
    {
       [MvcSiteMapNode(Title = "Home")]  
	   [AllowAnonymous]
       public ActionResult Index()
       {
           return View();
       }
    }
}