using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace NewsManagement
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapMvcAttributeRoutes();

            routes.MapRoute(
                name: "Category",
                url: "Category/{category}/{name}",
                defaults: new { controller = "PublicNews", action = "Index", category = UrlParameter.Optional, name = UrlParameter.Optional }
            );


            routes.MapRoute(
                name: "PublicDefault",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "PublicNews", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
