using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication10.Controllers
{
    public class FileController : Controller
    {
        //
        // GET: /Upload/
        [AllowAnonymous]
        public ActionResult Upload()
        {
            return View();
        }

    }
}
