//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NewsManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public int CommentID { get; set; }
        public int NewsID { get; set; }
        public string Comment1 { get; set; }
        public System.DateTime CreatedTime { get; set; }
        public bool Approval { get; set; }
    
        public virtual News News { get; set; }
    }
}
