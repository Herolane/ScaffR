using System.Collections.Generic;

namespace MvcApplication10.Models.Home
{
    using Controls.DropDown.Attributes;

    public class DropdownViewModel
    {
        public DropdownViewModel()
        {
            MultiSelect = new List<string>();
        }

        [DropDown("Sample")]
        public IList<string> MultiSelect { get; set; }
    }
}