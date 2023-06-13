using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.UploadFile
{
    public partial class ViewStudyMaterial : System.Web.UI.Page
    {
        public DataTable ViewPDFfile = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            DataSet dt = dataBaseUtility.GetDataSet("sp_ViewPDFfile", "ViewPDFfile");
            if (dt.Tables[0].Rows.Count > 0)
            {
                this.ViewPDFfile = dt.Tables[0];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.HeaderRow.HorizontalAlign = HorizontalAlign.Left;
            }
        }

        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            if (Session["ActiveUserInformation"] != null)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    activeUserInformation.UserName.ToString().Trim();
                    activeUserInformation.UserEmailAddress.ToString().Trim();

                    if (activeUserInformation.UserRole.ToString() == "1")
                    {
                        Response.Redirect("~/AdminUser/AdminHomePage.aspx");
                    }
                    else if (activeUserInformation.UserRole.ToString() == "2")
                    {
                        Response.Redirect("~/Faculty/Faculty.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Student/Student.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login/CSNLogin.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@ID", GridView1.SelectedRow.Cells[1].Text));
            //SqlDataReader dr = dataBaseUtility.RunStoredProcedureForDataReader(paramName, "sp_ViewPDFfileById");
            DataTable dataTable = dataBaseUtility.GetDataSet("sp_ViewPDFfileById", "ViewPDFfileById", paramName);
            if (dataTable.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = dataTable.Rows[0]["FileType"].ToString();
                Response.AddHeader("content-disposition", "attachment;filename=" + dataTable.Rows[0]["PDFFileName"].ToString()); // to open file prompt Box open or Save file  
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite((byte[])dataTable.Rows[0]["FileData"]);
                Response.End();
            }
        }
    }
}