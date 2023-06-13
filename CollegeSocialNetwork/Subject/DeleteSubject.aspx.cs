using CSNConnectionUtility;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.Subject
{
    public partial class DeleteSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CourseNameList();
            }
        }

        protected void btnDeleteSubject_Click(object sender, EventArgs e)
        {
            if (ddListCourse.SelectedValue != "-1" && ddListOfSubject.SelectedValue != "-1")
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@SubjectID", ddListOfSubject.SelectedValue.Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_DeleteSubject", "DeleteSubject", paramName);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        lblMsg.Text = "Subject " + ddListOfSubject.SelectedItem.Text + " of course " + ddListCourse.SelectedItem.Text + "  deleted successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RecordsFound('" + lblMsg.Text + "')", true);
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                    else
                    {
                        lblMsg.Text = ddListOfSubject.SelectedItem.Text + " , " + " subject not found, not deleted successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RecordsNotFound('" + lblMsg.Text + "')", true);
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                }
            }
            else
            {
                lblMsg.Text = "Input field is not valid. <br /> Please select course and subject name.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "InputFieldIsNotValid('"+ lblMsg.Text +"')", true);
                
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

            ddListOfSubject.Enabled = false;
            ddListOfSubject.Items.Add(new ListItem("Select Subject", "-1"));
            if (dt.Rows.Count > 0)
            {
                ddListCourse.Items.Clear();
                ddListCourse.Items.Add(new ListItem("Select Course", "-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    ddListCourse.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseName"].ToString()));
                    lblMsg.Text = "";
                    lblMsg.Visible = false;
                }
            }
        }

        public void SubjectNameList(string courseId)
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@CourseID", courseId.Trim()));
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewSubject", "ViewSubject", paramName);
            if (dt.Rows.Count > 0)
            {
                if(dt.Rows[0]["Status"].ToString() == "Success")
                {
                    ddListOfSubject.Items.Clear();
                    ddListOfSubject.Enabled = true;
                    ddListOfSubject.Items.Add(new ListItem("Select Subject", "-1"));
                    foreach (DataRow dr in dt.Rows)
                    {
                        ddListOfSubject.Items.Add(new ListItem(dr["SubjectName"].ToString(), dr["SubjectID"].ToString()));
                    }
                    lblMsg.Text = "";
                    lblMsg.Visible = false;
                }
                else
                {
                    lblMsg.Text = "Subject not found for selected course " + ddListCourse.SelectedValue.Trim() + ".";
                    lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                    lblMsg.Visible = true;
                }
            }
            else
            {
                ddListOfSubject.Items.Clear();
                ddListOfSubject.Items.Add(new ListItem("Select Subject", "-1"));
                ddListOfSubject.Enabled = false;
                lblMsg.Text = "";
                lblMsg.Visible = false;
            }
        }

        protected void ddListCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddListCourse.SelectedValue != "-1")
            {
                SubjectNameList(ddListCourse.SelectedValue.Trim());
            }
            else
            {
                ddListOfSubject.Items.Clear();
                ddListOfSubject.Enabled = false;
                ddListOfSubject.Items.Add(new ListItem("Select Subject", "-1"));
                lblMsg.Text = "Input field is not valid. <br /> Please select course and subject name.";
                lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                lblMsg.Visible = true;
            }
        }
    }
}