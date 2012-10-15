namespace MvcApplication130.Controllers
{
    using System.Web.Mvc;
    
    public class HomeController : BaseController
    {
       public ActionResult Index()
       {
           return View();
       }
    }
}