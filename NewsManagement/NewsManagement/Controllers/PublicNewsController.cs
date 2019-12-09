using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NewsManagement;

namespace NewsManagement.Controllers
{
    public class PublicNewsController : Controller
    {
        private NewsEntities db = new NewsEntities();

        // GET: PublicNews
        public ActionResult Index(int? category)
        {
            var news = db.News.Include(n => n.User)
                .Where(n => n.Categories.Any(c => category != null ? c.CategoryID == category : true) && n.Published)
                .OrderByDescending(n => n.CreatedTime).Take(5);


            ViewBag.Categories = db.Categories;
            return View(news.ToList());
        }

        // GET: PublicNews/Details/5
        [Route("news/{name}-{id}")]
        public ActionResult Details(string name, int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.Categories = db.Categories;
            return View(news);
        }
        
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
