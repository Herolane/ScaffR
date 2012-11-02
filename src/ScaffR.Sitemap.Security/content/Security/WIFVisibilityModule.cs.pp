namespace $rootnamespace$.Security
{
    using System;
    using System.Collections.Generic;
    using System.IdentityModel.Services;
    using System.Linq;
    using System.Reflection;
    using System.Web;
    using System.Web.Mvc;
    using IdentityModel.Authorization;
    using IdentityModel.Authorization.MVC;
    using MvcSiteMapProvider;
    using MvcSiteMapProvider.Extensibility;

    public class WIFVisibilityModule : ISiteMapNodeVisibilityProvider
    {
        private MethodInfo GetRequestedAction(MvcSiteMapNode mvcNode)
        {
            var resolver = new DefaultControllerTypeResolver();
            var controllerType = resolver.ResolveControllerType(mvcNode.Area, mvcNode.Controller);

            var methods =
                controllerType.GetMethods().Where(
                    w => w.Name.Equals(mvcNode.Action, StringComparison.CurrentCultureIgnoreCase));

            MethodInfo theMethod = null;

            foreach (var method in methods)
            {
                var principalSecurity =
                    method.GetCustomAttributes<ClaimsPrincipalPermissionAttribute>().FirstOrDefault();

                var getAttr = method.GetCustomAttribute<HttpGetAttribute>();

                // if this is for the GET request and there is security flag, this is likely the correct action method
                if (getAttr != null && principalSecurity != null)
                {
                    theMethod = method;
                    break;
                }

                // if there is no method chose, but there is security, this is probably it
                if (theMethod == null && principalSecurity != null)
                {
                    theMethod = method;
                }
            }

            return theMethod;
        }

        public bool IsVisible(SiteMapNode node, HttpContext context, IDictionary<string, object> sourceMetadata)
        {
            var mvcNode = node as MvcSiteMapNode;
            if (mvcNode != null)
            {
                var theMethod = GetRequestedAction(mvcNode);
                
                if (theMethod != null)
                {
                    var principalSecurity =
                        theMethod.GetCustomAttributes<ClaimsAuthorizeAttribute>().FirstOrDefault();

                    if (principalSecurity != null)
                    {
                        var resource = principalSecurity._resources;
                        var operation = principalSecurity._action;

                        return ClaimsAuthorization.CheckAccess(operation, resource);
                    }
                }
            }
            return true;
        }
    }
}