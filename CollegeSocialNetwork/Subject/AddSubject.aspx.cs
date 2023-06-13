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
    public partial class AddSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CourseNameList();
            }
        }

        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            if (txtSubjectName.Text != "" && ddListCourse.SelectedValue != "-1")
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@SubjectName", txtSubjectName.Text.Trim()));
                paramName.Enqueue(new SqlParameter("@CourseID", ddListCourse.SelectedValue.Trim()));
                paramName.Enqueue(new SqlParameter("@Semester", ddlSemester.SelectedValue.Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_AddSubject", "AddSubject", paramName);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "subjectAddedSuccessfully()", true);
                        //lblMsg.Text = "Subject added successfully.";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                    else if (dt.Rows[0]["Status"].ToString() == "Found")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "subjectNotAddedSuccessfully(document.getElementById('txtSubjectName').value,document.getElementById('ddListCourse').value)", true);
                        lblMsg.Text = txtSubjectName.Text.Trim() + " already Added in Course " + ddListCourse.SelectedValue.Trim()  + ". <br />" + "Subject not added successfully.";
                        lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        lblMsg.Visible = true;
                    }
                    else
                    {
                        lblMsg.Text = "Subject not added successfully.";
                        lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        lblMsg.Visible = true;
                    }
                }
                else
                {
                    txtSubjectName.Text = "";
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ViewUserProfileIputField()", true);
                //lblMsg.Text = "Input field is not valid. <br /> Please select course and inter subject name.";
                //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                //lblMsg.Visible = true;
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
            ddListCourse.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                ddListCourse.Items.Add(new ListItem("Select Course", "-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    ddListCourse.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseName"].ToString()));
                }
            }
        }
    }
}