using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Smartsheduler_Api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
           // config.Routes.MapHttpRoute(
           //    name: "DefaultApi123",
           //    routeTemplate: "api/{controller}/{action}/{id}",
           //    defaults: new { id = RouteParameter.Optional }
           //);
           // config.Routes.MapHttpRoute(
           //    name: "DefaultApi112323",
           //    routeTemplate: "api/{controller}/{action}",
           //    defaults: new { id = RouteParameter.Optional }
           //);

            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new System.Net.Http.Headers.MediaTypeHeaderValue("text/html"));
        }
    }
}
