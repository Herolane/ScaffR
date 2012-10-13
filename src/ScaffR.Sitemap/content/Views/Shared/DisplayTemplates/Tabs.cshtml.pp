@using $rootnamespace$.Helpers
@model $rootnamespace$.Extensions.TabsHelperModel
<ul class="nav nav-tabs">
    @foreach (var node in Model)
    {
        <li class="@Html.AddClass("active", node.IsCurrentNode || node.IsInCurrentPath && !node.IsRootNode)">
            <a href="@Url.Action(node.Action, node.Controller)">@node.Title</a></li>
    }
</ul>
