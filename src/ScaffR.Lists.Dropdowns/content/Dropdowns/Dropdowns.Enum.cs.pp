using System;
using System.Collections.Generic;
using System.Linq;

namespace $rootnamespace$.Dropdowns
{
    using System.Web.Mvc;
    using ScaffR.Extensions;

    public partial class Dropdowns
	{
        public static SelectList ForEnum<TEnum>(TEnum enumType)
        {
            IEnumerable<TEnum> values = Enum.GetValues(typeof(TEnum)).Cast<TEnum>();

            IEnumerable<SelectListItem> items = from value in values
                                                select new SelectListItem
                                                {
                                                    Text = EnumExtensions.GetEnumDescription(value),
                                                    Value = value.ToString()                                                    
                                                };
           return new SelectList(items);            
        }
	}
}