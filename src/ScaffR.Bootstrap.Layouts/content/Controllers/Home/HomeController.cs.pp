namespace $rootnamespace$.Controllers.Home
{
    using System.Web.Mvc;
    
    public partial class HomeController : Controller
    {
       [AllowAnonymous] 
       public ActionResult Index()
       {
           return View();
       }
    }
}