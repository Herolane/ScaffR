namespace $rootnamespace$.Filters
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;
    using Models.Attributes;

    public class FillDropDowns : ActionFilterAttribute
    {
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            var viewModel = filterContext.Controller.ViewData.Model;
            if (viewModel != null)
                setLists(viewModel.GetType(), filterContext.Controller.ViewData);

            base.OnResultExecuting(filterContext);
        }

        private static void setLists(Type viewModelType, IDictionary<string, object> viewData)
        {
            foreach (var property in viewModelType.GetProperties())
            {
                if (!(property.PropertyType.IsClass && !(property.PropertyType == typeof(string))))
                {
                    var att = (DropDownAttribute)GetCustomAttribute(property, typeof(DropDownAttribute));
                    if (att != null)
                    {
                        var viewDataKey = "DDKey_" + property.Name;
                        viewData[viewDataKey] = viewData[viewDataKey] ?? att.GetMethodResult();
                    }
                }
                else
                {
                    setLists(property.PropertyType, viewData);
                }
            }
        }
    }
}