using CSNConnectionUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.Profile
{
    public partial class SocialActivities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ActiveUserInformation"] != null)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    hiddenUserName.Value = activeUserInformation.UserName.ToString().Trim();
                    hiddenSenderEmailAddress.Value = activeUserInformation.UserEmailAddress.ToString().Trim();
                }
            }
            else
            {
                Response.Redirect("~/Login/CSNLogin.aspx");
            }
        }

        [WebMethod]
        public static bool PdfFileFunction()
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            //Queue paramName = new Queue();
            //paramName.Enqueue(new SqlParameter("@ID", GridView1.SelectedRow.Cells[1].Text));
            ////SqlDataReader dr = dataBaseUtility.RunStoredProcedureForDataReader(paramName, "sp_ViewPDFfileById");
            //DataTable dataTable = dataBaseUtility.GetDataSet("sp_ViewPDFfileById", "ViewPDFfileById", paramName);
            //if (dataTable.Rows.Count > 0)
            //{
            //    Response.Clear();
            //    Response.Buffer = true;
            //    Response.ContentType = dataTable.Rows[0]["FileType"].ToString();
            //    Response.AddHeader("content-disposition", "attachment;filename=" + dataTable.Rows[0]["PDFFileName"].ToString()); // to open file prompt Box open or Save file  
            //    Response.Charset = "";
            //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //    Response.BinaryWrite((byte[])dataTable.Rows[0]["FileData"]);
            //    Response.End();
            //}
            return true;
        }
    }
}