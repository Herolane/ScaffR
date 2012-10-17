@using $rootnamespace$.Extensions
@using MvcSiteMapProvider.Web.Html
@{
	//if (ViewBag.SitemapProvider == null)
    //{
    //    ViewBag.SitemapProvider = "Modules";
    //}
	Layout = "~/Views/Shared/Bootstrap/MembershipStarterTemplate.cshtml";
}
<div class="row-fluid">
    <div class="span2">
        @Html.Partial("_UserWidget")
		
		@*@{
            SiteMapProvider provider = SiteMap.Providers[ViewBag.SitemapProvider];
        }
        @Html.MvcSiteMap(provider).Pills(0, true, true, 1)*@
		Something
    </div>
    <div class="span10" id="mainPanel">        
        @*@Html.MvcSiteMap((string)ViewBag.SitemapProvider).Breadcrumb()*@
        <div class="row-fluid">            
            @RenderBody()
        </div>
    </div>
</div>