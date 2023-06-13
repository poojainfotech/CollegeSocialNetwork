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
    public class PdfFileFunctionController : ApiController
    {
        private DataBaseUtility dataBaseUtility;
        public IEnumerable<GetsUserProfileSocialActivity> GetUserProfileSocialActivityByID(string ID)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@ID", ID.Trim()));
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
                    getsUserProfileSocialActivity.FileType = "application/pdf";

                    //application/pdf
                    if (!string.IsNullOrEmpty(dr["FileData"].ToString()))
                    {
                        byte[] bytes = (byte[])dr["FileData"];
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        //getsUserProfileSocialActivity.FileData = "data://application/pdf;base64," + base64String;
                        getsUserProfileSocialActivity.FileData = base64String;
                    }
                    getsUserProfileSocialActivity.UploadedPdfFileDate = dr["UploadedPdfFileDate"].ToString();
                    getUserActivity.Add(getsUserProfileSocialActivity);
                }
            }
            return getUserActivity;
        }
    }
}
