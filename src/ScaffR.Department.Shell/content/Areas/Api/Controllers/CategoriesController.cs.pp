namespace $rootnamespace$.Areas.Api.Controllers
{
    using Core.Interfaces.Service;
    using Core.Model;

    public partial class CategoriesController : ApiController<Category>
    {
	   protected ICategoryService CategoryService;

       public CategoriesController(ICategoryService service)
       {	       
           Service = CategoryService = service;
       }
    }
}
