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

namespace CollegeSocialNetwork.ForgotPassword
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if(txtUserName.Text != "" &&  txtewPassword.Text != "")
            {
                //sp_UpdateUserPassword
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@UserName", txtUserName.Text.Trim()));
                paramName.Enqueue(new SqlParameter("@Password", txtewPassword.Text.Trim()));

                DataTable dt = dataBaseUtility.GetDataSet("sp_UpdateUserPassword", "UpdateUserPassword", paramName);

                if (dt.Rows.Count > 0)
                {
                    if(dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Passwordchangesuccessfully('txtUserName');", true);
                        //lblMsg.Text = "Password change successfully.";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                    else if(dt.Rows[0]["Status"].ToString() == "NotFound")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Usernotfound('txtUserName');", true);
                        //lblMsg.Text = txtUserName.Text.Trim() + " User not found";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Passwordnotchangesuccessfully();", true);
                        //lblMsg.Text = "Password not change successfully.";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                }
                else
                {
                    txtUserName.Text = "";
                    txtewPassword.Text = "";
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Inputfieldisnotvalid();", true);
                //lblMsg.Text = "Input field is not valid.";
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
    }
}