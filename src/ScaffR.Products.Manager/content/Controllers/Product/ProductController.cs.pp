namespace $rootnamespace$.Controllers.Product
{
    using System.Web.Mvc;
    using Core.Interfaces.Service;
    
    public class ProductController : Controller
    {
        protected IProductService ProductService;

        public ProductController(IProductService service)
        {
            ProductService = service;
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}
