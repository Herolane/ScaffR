@using MvcSiteMapProvider
@model $rootnamespace$.Models.Sitemap.SitemapHelperModel

@{
    var topLevel = Model.Nodes;
    SiteMapNodeModel activeNode;

    Func<SiteMapNodeModel, bool> isActive = (node) =>
                                                {
                                                    var active = (node.IsCurrentNode
                                                        || node.IsInCurrentPath
                                                        || (ViewContext.Controller.ValueProvider.GetValue("action").RawValue.ToString().Equals(node.Action, StringComparison.CurrentCultureIgnoreCase)
                                                            && ViewContext.Controller.ValueProvider.GetValue("controller").RawValue.ToString().Equals(node.Controller, StringComparison.InvariantCultureIgnoreCase)
                                                            && !node.IsRootNode));
                                                    return active;
                                                };

    activeNode = topLevel.Where(x => isActive(x)).FirstOrDefault();                                                
}

<div id="main-menu">
    <ul class="nav nav-tabs">
        @foreach (var node in topLevel)
        {
            <li class="@(isActive(node) ? "active" : "") @(node.Title == "Admin" ? "pull-right" : "")">

                @if (node.IsClickable)
                {
                    <a href="@Url.Action(node.Action, node.Controller)">@node.Title</a>
                }
                else
                {
                    if (node.Children.Any())
                    {
                        <a href="@node.Children[0].Url">@node.Title</a>
                    }
                    else
                    {
                       <a>@node.Title</a> 
                    }
                    
                }

            </li>    
        }
    </ul>

    @if (activeNode != null)
    {
        <div id="sub-menu">

            <ul class="nav nav-pills">

                @foreach (var child in activeNode.Children)
                {
                    <li class="@((child.IsCurrentNode || child.IsInCurrentPath) ? "active" : "")">
                        <a href="@child.Url">@child.Title</a>
                    </li>
                }

            </ul>
        </div>
    }


</div>
