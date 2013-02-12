namespace MvcApplication10.Controllers.Home
{
    using System.Web.Mvc;
    using Models.Home;

    public partial class HomeController : Controller
    {
       [AllowAnonymous] 
       public ActionResult Index()
       {
           return View(new DropdownViewModel());
       }
    }
}