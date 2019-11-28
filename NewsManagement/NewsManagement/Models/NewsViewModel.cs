using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsManagement.Models
{
    public class NewsViewModel
    {
        private News _news;
        public NewsViewModel(News news)
        {
            _news = news;
            NewsID = news.NewsID;
            UserID = news.UserID;
            Title = news.Title;
            Content = news.Content;
            CreatedTime = news.CreatedTime;
            ShortDesc = news.ShortDesc;
            ImageUrl = news.ImageUrl;
            Published = news.Published;
            Comments = news.Comments;
            Categories = news.Categories;
            User = news.User;
        }

        public void UpdateNews(News news)
        {
            news.NewsID = NewsID;
            news.UserID = UserID;
            news.Title = Title;
            news.Content = Content;
            news.CreatedTime = CreatedTime;
            news.ShortDesc = ShortDesc;
            news.ImageUrl = ImageUrl;
            news.Published = Published;
        }
        public NewsViewModel()
        {

        }
        public int NewsID { get; set; }
        public int UserID { get; set; }
        public string Title { get; set; }
        [AllowHtml]
        public string Content { get; set; }
        public System.DateTime CreatedTime { get; set; }
        public string ShortDesc { get; set; }
        public string ImageUrl { get; set; }
        public bool Published { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Category> Categories { get; set; }
        public List<int> CategoryID { get; set; }
    }
}