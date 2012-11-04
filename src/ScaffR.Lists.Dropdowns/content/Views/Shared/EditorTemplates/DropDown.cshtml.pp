@using $rootnamespace$.Extensions
@model object

@{
    var attr = new Dictionary<string, object>();
    if (ViewData.ModelMetadata.AdditionalValues.ContainsKey("parentName"))
    {
        var prefix = ViewData.TemplateInfo.HtmlFieldPrefix.SubstringBefore('.');
        attr.Add("data-parent", prefix + "_" + ViewData.ModelMetadata.AdditionalValues["parentName"]);
        attr.Add("data-message", "Select " + ViewData.ModelMetadata.GetDisplayName());
        
        if (ViewData.ModelMetadata.AdditionalValues.ContainsKey("methodName"))
        {
            attr.Add("data-method", ViewData.ModelMetadata.AdditionalValues["methodName"]);
        }
    }
}

@Html.DropDownListFor(m => m, Html.GetAutomatedList(m => m).SetSelected(Model), attr)