using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollegeSocialNetwork.Model
{
    public class DiscussionForum
    {
        public string UserName { get; set; }

        public string CourseName { get; set; }

        public string Semester { get; set; }

        public string SubjectName { get; set; }

        public string Comment { get; set; }

        public string AttachFileName { get; set; }

        public string AttachFile { get; set; }

        public string DateOfPost { get; set; }
    }
}