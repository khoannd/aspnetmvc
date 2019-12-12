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
        [Route("")]
        [Route("category/{categoryid}/{name}")]
        // abc.com/category/1/sport
        public ActionResult Index(int? categoryid, string name)
        {
            var news = db.News.Include(n => n.User)
                .Where(
                    n => categoryid != null ? n.Categories.Any(c => c.CategoryID == categoryid) : true
                )
                .OrderByDescending(n => n.CreatedTime)
                .Take(3)
                .Select( n => n);
            ViewBag.Categories = db.Categories;

            return View(news.ToList());
        }

        // GET: detail/news-title-5.html
        [Route("detail/{title}-{id}")]
        public ActionResult Details(string title, int? id)
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
            return View(news);
        }

        public static string EncodeUrl(News news)
        {
            return string.Format("detail/{0}-{1}", HttpUtility.UrlEncode(news.Title), news.NewsID);
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
