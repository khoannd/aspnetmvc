using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoView.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return RedirectToAction("Login");
        }

        // GET: User/Details/5
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Login(string username, string password)
        {
            if(username == "khoan" && password == "1")
            {
                Session["LoginUser"] = true;
                return Json(new { Result = true });
            }
            Session["LoginUser"] = false;
            return Json(new { Result = false });
        }
        
    }
}
