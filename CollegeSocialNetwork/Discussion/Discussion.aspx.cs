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

namespace CollegeSocialNetwork.Discussion
{
    public partial class Discussion : System.Web.UI.Page
    {
        public DataTable ViewCoursesSubject = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CourseNameList();
            }
            if (Session["ActiveUserInformation"] != null)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    hiddenUserName.Value = activeUserInformation.UserName.ToString().Trim();
                }
            }
            else
            {
                hiddenUserName.Value = "";
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

        public void CourseNameList()
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewCourse", "ViewCourse", null);
            ddlCourse.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                ddlCourse.Items.Add(new ListItem("Select Course", "-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    ddlCourse.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseName"].ToString()));
                }
            }
        }

        protected void btnShowSubject_Click(object sender, EventArgs e)
        {
            getDataForDiscussion();
        }

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDataForDiscussion();
        }

        protected void getDataForDiscussion()
        {
            if (ddlCourse.SelectedValue != "-1" && ddlSemester.SelectedValue != "-1")
            {
                lblMsg.Text = "";
                lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                lblMsg.Visible = false;

                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@CourseName", ddlCourse.SelectedValue.Trim()));
                paramName.Enqueue(new SqlParameter("@Semester", ddlSemester.SelectedValue.Trim()));
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                DataTable dataTable = dataBaseUtility.GetDataSet("sp_ViewCourseSubjectForDiscussion", "ViewCourseSubject", paramName);

                if (dataTable.Rows.Count > 0)
                {
                    this.ViewCoursesSubject = dataTable;
                }
                else
                {
                    lblMsg.Text = "Course and subject not found.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "CourseDiscussion('" + lblMsg.Text + "')", true);
                }
            }
            else
            {
                lblMsg.Text = "Input field is not valid. Please select course and semester.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "CourseDiscussion('" + lblMsg.Text + "')", true);
            }
        }
    }
}