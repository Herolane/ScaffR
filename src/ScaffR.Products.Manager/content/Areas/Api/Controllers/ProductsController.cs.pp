namespace $rootnamespace$.Areas.Api.Controllers
{
    using Core.Interfaces.Service;
    using Core.Model;

    public partial class ProductsController : ApiController<Product>
    {
	   protected IProductService ProductService;

       public ProductsController(IProductService service)
       {	       
           Service = ProductService = service;
       }
    }
}
