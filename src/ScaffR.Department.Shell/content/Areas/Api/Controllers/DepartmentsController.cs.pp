namespace $rootnamespace$.Areas.Api.Controllers
{
    using Core.Interfaces.Service;
    using Core.Model;

    public partial class DepartmentsController : ApiController<Department>
    {
	   protected IDepartmentService DepartmentService;

       public DepartmentsController(IDepartmentService service)
       {	       
           Service = DepartmentService = service;
       }
    }
}
