using CollegeSocialNetwork.Model;
using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CollegeSocialNetwork.Controller
{
    public class GetUserProfileController : ApiController
    {

        private DataBaseUtility dataBaseUtility;

        public IEnumerable<GetsUserProfileSocialActivity> GetUserProfileSocialActivity(string userName)
        {

            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", userName.Trim()));
            List<GetsUserProfileSocialActivity> getUserActivity = null;
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_GetUserProfileSocialActivity", "GetUserProfileSocialActivity", paramName);
            if (getDiscussion != null)
            {
                getUserActivity = new List<GetsUserProfileSocialActivity>();
                foreach (DataRow dr in getDiscussion.Rows)
                {
                    GetsUserProfileSocialActivity getsUserProfileSocialActivity = new GetsUserProfileSocialActivity();
                    getsUserProfileSocialActivity.ID = dr["ID"].ToString();
                    getsUserProfileSocialActivity.UserName = dr["UserName"].ToString();
                    getsUserProfileSocialActivity.PDFfileName = dr["PDFfileName"].ToString();                    
                    getsUserProfileSocialActivity.FileType = dr["FileType"].ToString();
                    if (!string.IsNullOrEmpty(dr["FileData"].ToString()))
                    {
                        byte[] bytes = (byte[])dr["FileData"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        getsUserProfileSocialActivity.FileData = "data://text/plain;base64," + base64String;
                   }
                    getsUserProfileSocialActivity.UploadedPdfFileDate = dr["UploadedPdfFileDate"].ToString();
                    getsUserProfileSocialActivity.ImagesfileName = dr["ImagesfileName"].ToString();
                    getsUserProfileSocialActivity.ImagesFileType = dr["ImagesFileType"].ToString();
                    if (!string.IsNullOrEmpty(dr["ImagesData"].ToString()))
                    {
                        byte[] bytes = (byte[])dr["ImagesData"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        getsUserProfileSocialActivity.ImagesData = "data:image/png;base64," + base64String;
                    }
                    getsUserProfileSocialActivity.UploadedImagesFileDate = dr["UploadedImagesFileDate"].ToString();
                    getsUserProfileSocialActivity.Chat = dr["Chat"].ToString();
                    getsUserProfileSocialActivity.ChatDate = dr["ChatDate"].ToString();
                    getsUserProfileSocialActivity.Likes = dr["Likes"].ToString();
                    getsUserProfileSocialActivity.LikeDateTime = dr["LikeDateTime"].ToString();
                    getsUserProfileSocialActivity.Comment = dr["LikeDateTime"].ToString();
                    getsUserProfileSocialActivity.CommentDateTime = dr["LikeDateTime"].ToString();
                    getUserActivity.Add(getsUserProfileSocialActivity);
                }
            }
            return getUserActivity;
        }

        public string GetUserProfileLike(string UserName, string Like, string UserProfileID)
        {
            string status = "No";
            Queue paramName = new Queue();
            if(!string.IsNullOrEmpty(UserName))
            {
                paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
            }
            if (!string.IsNullOrEmpty(Like))
            {
                paramName.Enqueue(new SqlParameter("@Likes", Like.Trim()));
                paramName.Enqueue(new SqlParameter("@LikeDateTime", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
            }
            if (!string.IsNullOrEmpty(UserProfileID))
            {
                paramName.Enqueue(new SqlParameter("@UserProfileID", UserProfileID.Trim()));
            }
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_UserProfileLike", "UserProfileLike", paramName);
            if (getDiscussion != null)
            {
                status = "Yes";
            }
            return status;
        }

        public string GetUserProfileComment(string UserName, string Comment, string UserProfileID)
        {
            string status = "No";
            Queue paramName = new Queue();
            if (!string.IsNullOrEmpty(UserName))
            {
                paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
            }
            if (!string.IsNullOrEmpty(Comment))
            {
                paramName.Enqueue(new SqlParameter("@Comment", Comment.Trim()));
                paramName.Enqueue(new SqlParameter("@CommentDateTime", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
            }

            if (!string.IsNullOrEmpty(UserProfileID))
            {
                paramName.Enqueue(new SqlParameter("@UserProfileID", UserProfileID.Trim()));
            }
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_UserProfileLike", "UserProfileLike", paramName);
            if (getDiscussion != null)
            {
                status = "Yes";
            }
            return status;
        }
    }
}
