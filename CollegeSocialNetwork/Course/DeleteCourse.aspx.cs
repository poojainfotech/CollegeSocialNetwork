using CSNConnectionUtility;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.Course
{
    public partial class DeleteCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CourseNameList();
            }
        }

        protected void btnDeleteCourse_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex != 0)
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@CourseName", DropDownList1.SelectedValue.Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_DeleteCourse", "DeleteCourse", paramName);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        lblMsg.Text = "Course deleted successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteCourse('" + lblMsg.Text + "')", true);
                        DropDownList1.Items.Clear();
                        CourseNameList();
                        DropDownList1.SelectedIndex = -1;
                    }
                    else
                    {
                        lblMsg.Text = DropDownList1.SelectedValue.Trim() + " , " + "Course not found, not deleted successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteCourse('" + lblMsg.Text + "')", true);
                    }
                }
            }
            else
            {
                lblMsg.Text = "Please select course.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteCourse('" + lblMsg.Text + "')", true);
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void CourseNameList()
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewCourse", "ViewCourse", null);

            if (dt.Rows.Count > 0)
            {
                DropDownList1.Items.Clear();
                DropDownList1.Items.Add(new ListItem("Select Course","-1"));
                foreach (DataRow dr in dt.Rows)
                {
                    DropDownList1.Items.Add(new ListItem(dr["CourseName"].ToString(), dr["CourseName"].ToString()));
                }
            }
        }
    }
}