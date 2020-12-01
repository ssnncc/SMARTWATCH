using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace ProjectSEM3
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["Songuoitruycap"] = 0;
           // Application["Songuoionline"] = 0;
        }
        protected void Session_Start()
        {
            Application.Lock();//Dùng để đồng bộ hóa
            Application["Songuoitruycap"] = (int)Application["Songuoitruycap"] + 1;
           // Application["Songuoionline"]= (int)Application["Songuoionline"] + 1;
            Application.UnLock();
        }
        //protected void Session_End()
        //{
        //    Application.Lock();//Dùng để đồng bộ hóa
        //    Application["Songuoionline"] = (int)Application["Songuoionline"] - 1;
        //    Application.UnLock();
        //}
    }
}
