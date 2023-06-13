using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollegeSocialNetwork.Model
{
    public class GetsUserProfileSocialActivity
    {
        public string ID { get; set; }
        public string UserName { get; set; }
        public string PDFfileName { get; set; }
        public string FileType { get; set; }
        public string FileData { get; set; }
        public string UploadedPdfFileDate { get; set; }
        public string ImagesfileName { get; set; }
        public string ImagesFileType { get; set; }
        public string ImagesData { get; set; }
        public string UploadedImagesFileDate { get; set; }
        public string Chat { get; set; }
        public string ChatDate { get; set; }
        public string Likes { get; set; }
        public string LikeUserName { get; set; }
        public string LikeDateTime { get; set; }
        public string Comment { get; set; }
        public string CommentDateTime { get; set; }
    }
}