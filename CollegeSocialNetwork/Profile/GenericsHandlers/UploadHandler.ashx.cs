using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace CollegeSocialNetwork.GenericsHandlers
{
    /// <summary>
    /// Summary description for UploadHandler
    /// </summary>
    public class UploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string txtChat = context.Request.Form["txtChat"];
            string userName = context.Request.Form["hiddenUserName"];
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", userName.ToString().Trim()));
            paramName.Enqueue(new SqlParameter("@Chat", txtChat.Trim()));
            paramName.Enqueue(new SqlParameter("@ChatDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
            //  @ImagesData varbinary(max) = NULL,
            //  @Likes nvarchar(10) = NULL,
            //  @LikeUserName nvarchar(100) = NULL,
            //  @LikeUserDateTime nvarchar(20) = NULL,
            //  @Comment nvarchar(1000) = NULL,
            //  @CommentDateTime nvarchar(20) = NULL
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                string[] AllFileKey = context.Request.Files.AllKeys;
                for (int i = 0; i < files.Count ;i++)
                {
                    System.Threading.Thread.Sleep(1000);
                    HttpPostedFile file = files[i];
                    //string fileName = context.Server.MapPath("~/Upload/UploadPdfFile/" + Path.GetFileName(file.FileName));
                    //file.SaveAs(fileName);                    
                    string[] KeyValuePair = AllFileKey[i].Split('/');
                    if (KeyValuePair[1].ToString().Trim() == "notImage")
                    {
                        paramName.Enqueue(new SqlParameter("@PDFfileName", file.FileName));
                        paramName.Enqueue(new SqlParameter("@FileType", file.ContentType));
                        paramName.Enqueue(new SqlParameter("@FileData", file.InputStream));
                        paramName.Enqueue(new SqlParameter("@UploadedPdfFileDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                    }
                    else
                    {
                        paramName.Enqueue(new SqlParameter("@ImagesfileName", file.FileName));
                        paramName.Enqueue(new SqlParameter("@ImagesFileType", file.ContentType));
                        paramName.Enqueue(new SqlParameter("@ImagesData", file.InputStream));
                        paramName.Enqueue(new SqlParameter("@UploadedImagesFileDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                    }
                }                
            }
            DataTable dt = dataBaseUtility.GetDataSet("sp_UserProfile", "UserProfile", paramName);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "Success")
                {
                    //lblMsg.Text = "File Uploaded Successfully";
                    //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                    //lblMsg.Visible = true;
                }
                else if (dt.Rows[0]["Status"].ToString() == "Found")
                {
                    //lblMsg.Text = "File already exists. <br />" + "File not uploaded successfully.";
                    //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                    //lblMsg.Visible = true;
                }
                else
                {
                    //lblMsg.Text = "File not uploaded successfully.";
                    //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                    //lblMsg.Visible = true;
                }
            }
            else
            {
                //lblMsg.Text = "File not uploaded successfully.";
                //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                //lblMsg.Visible = true;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}