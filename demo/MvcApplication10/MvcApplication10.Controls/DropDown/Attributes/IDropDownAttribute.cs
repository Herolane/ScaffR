namespace MvcApplication10.Controls.DropDown.Attributes
{
    using System.Collections.Generic;
    using System.Web.Mvc;

    public interface IDropDownAttribute
    {
        string DependsOn { get; set; }
        IEnumerable<SelectListItem> GetMethodResult();
    }
}