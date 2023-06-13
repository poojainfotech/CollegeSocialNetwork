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
    public class DiscussionForumController : ApiController
    {
        private DataBaseUtility dataBaseUtility;
        public IEnumerable<DiscussionForum> GetDiscussionForum(string userName,string CourseName,string Semester,string SubjectName,string Comment)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", userName.Trim()));
            paramName.Enqueue(new SqlParameter("@CourseName", CourseName.Trim()));
            paramName.Enqueue(new SqlParameter("@Semester", Semester.Trim()));
            paramName.Enqueue(new SqlParameter("@SubjectName", SubjectName.Trim()));
            paramName.Enqueue(new SqlParameter("@Comment", Comment.Trim()));
            paramName.Enqueue(new SqlParameter("@DateOfPost", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));


            List<DiscussionForum> userList = null;
            
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_DiscussionForum", "DiscussionForum", paramName);
            if (getDiscussion != null)
            {
                userList = new List<DiscussionForum>();
                foreach (DataRow dr in getDiscussion.Rows)
                {
                    DiscussionForum discussionForum = new DiscussionForum();
                    discussionForum.UserName = dr["UserName"].ToString();
                    discussionForum.CourseName = dr["CourseName"].ToString();
                    discussionForum.Semester = dr["Semester"].ToString();
                    discussionForum.SubjectName = dr["SubjectName"].ToString();
                    discussionForum.Comment = dr["Comment"].ToString();
                    discussionForum.AttachFileName = dr["AttachFileName"].ToString();
                    discussionForum.DateOfPost = dr["DateOfPost"].ToString();
                    if(!string.IsNullOrEmpty(dr["AttachFile"].ToString()))
                    {
                        byte[] bytes = (byte[])dr["AttachFile"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        discussionForum.AttachFile = "data:image/png;base64," + base64String;
                    }
                    userList.Add(discussionForum);
                }
            }
            return userList;
        }

        public IEnumerable<DiscussionForum> GetDiscussionForumByUserNameOnly(string CourseName, string Semester, string SubjectName)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@CourseName", CourseName.Trim()));
            paramName.Enqueue(new SqlParameter("@Semester", Semester.Trim()));
            paramName.Enqueue(new SqlParameter("@SubjectName", SubjectName.Trim()));
            List<DiscussionForum> userList = null;
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_GetDiscussionForumByUserNameCourseNameSemester", "GetDiscussionForumByUserNameCourseNameSemester", paramName);
            if (getDiscussion != null)
            {
                userList = new List<DiscussionForum>();
                foreach (DataRow dr in getDiscussion.Rows)
                {
                    DiscussionForum discussionForum = new DiscussionForum();
                    discussionForum.UserName = dr["UserName"].ToString();
                    discussionForum.CourseName = dr["CourseName"].ToString();
                    discussionForum.Semester = dr["Semester"].ToString();
                    discussionForum.SubjectName = dr["SubjectName"].ToString();
                    discussionForum.Comment = dr["Comment"].ToString();
                    discussionForum.AttachFileName = dr["AttachFileName"].ToString();
                    discussionForum.DateOfPost = dr["DateOfPost"].ToString();
                    if (!string.IsNullOrEmpty(dr["AttachFile"].ToString()))
                    {
                        byte[] bytes = (byte[])dr["AttachFile"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        discussionForum.AttachFile = "data:image/png;base64," + base64String;
                    }
                    userList.Add(discussionForum);
                }
            }
            return userList;
        }

    }
}
