namespace $rootnamespace$.Areas.Api.Controllers
{
    using System.Collections;
    using System.Web.Http;
    using Core.Model;

    public partial class ProductsController
    {
        [HttpGet]
        public IEnumerable Categories(int productId)
        {
            var categories = ProductService.GetCategoriesForProduct(productId);
            return categories;
        }

        public CategoryFeaturedProduct AddCategory(CategoryFeaturedProduct categoryProduct)
        {
            return categoryProduct;
        }
    }
}
