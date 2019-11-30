//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NewsFri
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class News
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public News()
        {
            this.Comments = new HashSet<Comment>();
            this.Categories = new HashSet<Category>();
        }
    
        public int NewsID { get; set; }
        public int UserID { get; set; }
        public string Title { get; set; }
        public string ShortDesc { get; set; }
        [AllowHtml]
        public string LongDesc { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string ImageUrl { get; set; }
        public bool Published { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Category> Categories { get; set; }
    }
}
