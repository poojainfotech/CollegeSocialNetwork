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

namespace CollegeSocialNetwork.Subject
{
    public partial class ViewSubject : System.Web.UI.Page
    {
        public DataTable ViewCourses = null;
        public DataTable ViewSubjects = null;
        public DataTable SemesterList = null;
        public void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CourseNameList();
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

        protected void ddlSelectCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSelectSemester.SelectedIndex = 0;
        }

        protected void ddlSelectSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlSelectCourse.SelectedValue != "-1" && ddlSelectSemester.SelectedValue != "-1")
            {
                lblMsg.Text = "";
                lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                lblMsg.Visible = false;

                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@CourseName", ddlSelectCourse.SelectedValue.Trim()));
                paramName.Enqueue(new SqlParameter("@Semester", ddlSelectSemester.SelectedValue.Trim()));
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                DataSet dataSet = dataBaseUtility.GetDataSet("sp_ViewCourseSubject", "ViewCourseSubject", paramName, true);

                if(dataSet.Tables[0].Rows.Count > 0 && dataSet.Tables[1].Rows.Count > 0 && dataSet.Tables[2].Rows.Count > 0)
                {
                    if (dataSet.Tables[0].Rows[0]["Status"].ToString() != "SubjectNotFound")
                    {
                        if (dataSet.Tables[0].Rows.Count > 0)
                        {
                            this.ViewCourses = dataSet.Tables[0];
                        }

                        if (dataSet.Tables[2].Rows.Count > 0)
                        {
                            this.SemesterList = dataSet.Tables[1];
                        }

                        if (dataSet.Tables[1].Rows.Count > 0)
                        {
                            this.ViewSubjects = dataSet.Tables[2];
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RecordsNotFound()", true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RecordsNotFound()", true);
                }

                

                
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "InputfieldIsNotvalid()", true);
                //lblMsg.Text = "Input field is not valid. <br /> Please select course name and semester.";
                //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                //lblMsg.Visible = true;
            }
        }


        public void CourseNameList()
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewCourse", "ViewCourse", null);
            ddlSelectCourse.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                ddlSelectCourse.Items.Add(new ListItem("Select Course", "-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    ddlSelectCourse.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseName"].ToString()));
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlSelectCourse.SelectedIndex = 0;
            ddlSelectSemester.SelectedIndex = 0;
            lblMsg.Text = "";
            lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            lblMsg.Visible = false;
        }
    }
}