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

namespace CollegeSocialNetwork.Course
{
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            if (txtCourseName.Text != "")
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@CourseName", txtCourseName.Text.Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_AddCourse", "AddCourse", paramName);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        lblMsg.Text = "Course added successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "courseAdded('" + lblMsg.Text + "')", true);
                        txtCourseName.Text = "";
                    }
                    else if (dt.Rows[0]["Status"].ToString() == "Found")
                    {
                        lblMsg.Text = txtCourseName.Text.Trim() + " already Added." + "Course not added successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "courseAdded('" + lblMsg.Text + "')", true);
                        txtCourseName.Text = "";
                    }
                    else
                    {
                        lblMsg.Text = "Course not added successfully.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "courseAdded('" + lblMsg.Text + "')", true);
                        txtCourseName.Text = "";
                    }
                }
                else
                {
                    txtCourseName.Text = "";
                }
            }
            else
            {
                lblMsg.Text = "Input field is not valid.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "courseAdded('" + lblMsg.Text + "')", true);
                txtCourseName.Text = "";
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
    }
}