namespace MvcApplication10.Dropdowns
{
    using System.Collections.Generic;
    using System.Web.Mvc;
    using Controls.DropDown;

    public partial class Dropdowns : IDropdownProvider
    {
        public static IEnumerable<SelectListItem> Sample()
        {
            for (var i = 0; i < 10; i++)
            {
                yield return new SelectListItem()
                    {
                        Text = i.ToString(),
                        Value = i.ToString()
                    };
            }
        }

        public static IEnumerable<SelectListItem> SampleCascade(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                int val = int.Parse(value);

                for (var i = 0; i < 10; i++)
                {
                    yield return new SelectListItem()
                    {
                        Text = (i * val).ToString(),
                        Value = (i * val).ToString()
                    };
                }
            }
        } 
    }
}