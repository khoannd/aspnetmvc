using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NewsManagement;
using NewsManagement.Models;

namespace NewsManagement.Controllers
{
    public class NewsController : Controller
    {
        private NewsEntities db = new NewsEntities();

        // GET: News
        public ActionResult Index()
        {
            var news = db.News.Include(n => n.User);
            return View(news.ToList());
        }

        // GET: News/Details/5
        public ActionResult Details(int? id)
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

        // GET: News/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName");
            ViewBag.Categories = 
                new SelectList(
                    db.Categories.Select(c => new { Text = c.Name, Value = c.CategoryID }).ToList()
                    , "Value"
                    , "Text");
            NewsViewModel news = new NewsViewModel();
            news.CreatedTime = DateTime.Now;
            return View(news);
        }

        // POST: News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewsViewModel newsViewModel, HttpPostedFileBase ImageFile)
        {
            if (ModelState.IsValid)
            {
                var newNews = new News();

                // save image to disk
                // /NewsImages/imagename.png

                // create relative path
                string relativePath = "/NewsImages/" + DateTime.Now.Ticks.ToString() + "_" + ImageFile.FileName;
                // map the relative to physical path
                string physicalPath = Server.MapPath(relativePath);

                
                // check if the image folder exists
                string imageFolder = Path.GetDirectoryName(physicalPath);
                if (!Directory.Exists(imageFolder))
                {
                    Directory.CreateDirectory(imageFolder);
                }

                // save the image to physical path
                ImageFile.SaveAs(physicalPath);
                newsViewModel.ImageUrl = relativePath;

                newsViewModel.UpdateNews(newNews);

                //always check if the object null before usage
                if (newsViewModel.CategoryID != null)
                {
                    foreach (var cID in newsViewModel.CategoryID)
                    {
                        var category = db.Categories.Find(cID);
                        if (category != null)
                        {
                            newNews.Categories.Add(category);
                        }
                    }
                }
                
                db.News.Add(newNews);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", newsViewModel.UserID);
            return View(newsViewModel);
        }

        // GET: News/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.Categories =
                new SelectList(
                    db.Categories.Select(c => new { Text = c.Name, Value = c.CategoryID }).ToList()
                    , "Value"
                    , "Text");

            NewsViewModel newsViewModel = new NewsViewModel(news);

            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", newsViewModel.UserID);
            return View(newsViewModel);
        }

        // POST: News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NewsViewModel newsViewModel, HttpPostedFileBase ImageFile)
        {
            if (ModelState.IsValid)
            {
                var newNews = db.News.Find(newsViewModel.NewsID);
                if (newNews == null)
                {
                    return HttpNotFound();
                }

                // save image to disk
                // /NewsImages/imagename.png
                if (ImageFile != null)
                {
                    // create relative path
                    string relativePath = "/NewsImages/" + DateTime.Now.Ticks.ToString() + "_" + ImageFile.FileName;
                    // map the relative to physical path
                    string physicalPath = Server.MapPath(relativePath);


                    // check if the image folder exists
                    string imageFolder = Path.GetDirectoryName(physicalPath);
                    if (!Directory.Exists(imageFolder))
                    {
                        Directory.CreateDirectory(imageFolder);
                    }

                    // save the image to physical path
                    ImageFile.SaveAs(physicalPath);
                    newsViewModel.ImageUrl = relativePath;
                }                

                newsViewModel.UpdateNews(newNews);

                newNews.Categories.Clear();

                //always check if the object null before usage
                if (newsViewModel.CategoryID != null)
                {
                    foreach (var cID in newsViewModel.CategoryID)
                    {
                        var category = db.Categories.Find(cID);
                        if (category != null)
                        {
                            newNews.Categories.Add(category);
                        }
                    }
                }

                db.Entry(newNews).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", newsViewModel.UserID);
            return View(newsViewModel);
        }

        // GET: News/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("Index");
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
