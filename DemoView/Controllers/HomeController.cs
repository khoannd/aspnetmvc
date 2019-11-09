using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoView.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            if(Session["LoginUser"] != null && (bool)Session["LoginUser"] == true)
            {
                ViewBag.Message = "This is a secure page.";

                return View();
            }

            return RedirectToAction("Login", "User");
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}