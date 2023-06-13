using CSNConnectionUtility;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CollegeSocialNetwork
{
    //This class handle the login process
    public partial class CSNLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Use this lable variable to stored user login details.
            lblUserLoginDetails.Visible = false;
        }

        //Login functionality
        //User provide username, password and college code.
        //Below code examin the user name, password and college code agains database. If User present then user allow to land on dashboard page.
        protected void logInButton_Click(object sender, EventArgs e)
        {
            if(txtUserName.Text != "" || txtUserPassword.Text != "" || txtUserCollegeCode.Text != "")
            {
                //Stored the user information in session for furthor use.
                UserInfoInSession userInfoInSession = new UserInfoInSession();
                ActiveUserInformation activeUserInformation = userInfoInSession.GetUserInfoInSession(txtUserName.Text.Trim());
                Session["ActiveUserInformation"]  = activeUserInformation;

                //Check for Special Charecter
                if (SpecialCharacterUtility.validateSpecialCharecter(txtUserName.Text, "[^a-zA-Z0-9_.@]") &&
                    SpecialCharacterUtility.validateSpecialCharecter(txtUserCollegeCode.Text, "[^a-zA-Z0-9_.@]")
                   )
                {
                    //Create the databaseutility object whicch have functionality that handle dabase related work.
                    DataBaseUtility dataBaseUtility = new DataBaseUtility();
                    Queue paramName = new Queue();
                    paramName.Enqueue(new SqlParameter("@Name", txtUserName.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@Password", txtUserPassword.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@CollegeCode", txtUserCollegeCode.Text.Trim()));
                    DataSet ds = dataBaseUtility.GetDataSet("sp_GetUsersDetails", paramName);
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        //string aspNetSessionId = PasswordUtility.GetAspNetSessionId();
                        Queue adminUsersParamName = new Queue();
                        adminUsersParamName.Enqueue(new SqlParameter("@UserName", txtUserName.Text.Trim()));
                        adminUsersParamName.Enqueue(new SqlParameter("@UserRole", "Admin"));
                        adminUsersParamName.Enqueue(new SqlParameter("@LoginDateTime", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                        adminUsersParamName.Enqueue(new SqlParameter("@ActiveStatus", "Active"));
                        adminUsersParamName.Enqueue(new SqlParameter("@SessionID", PasswordUtility.GetAspNetSessionId()));

                        //Get the active user details.
                        if(dataBaseUtility.UserSession("sp_ActiveUser", adminUsersParamName) > 0)
                        {
                            if(ds.Tables[0].Rows[0]["RoleID"].ToString() == "1")
                            {
                                //If role is admin then redirect to the Admin dashboard page.
                                Response.Redirect("~/AdminUser/AdminHomePage.aspx");
                            }
                            else if(ds.Tables[0].Rows[0]["RoleID"].ToString() == "2")
                            {
                                //If role is admin then redirect to the faculty dashboard page.
                                Response.Redirect("~/Faculty/Faculty.aspx");
                            }
                            else
                            {
                                //If role is admin then redirect to the student dashboard page.
                                Response.Redirect("~/Student/Student.aspx");
                            }
                        }
                        else
                        {
                            //If user is invalid then throw a alert message.
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "functionInvalidUser(invalidUser = true)", true);
                        }
                    }
                    else
                    {
                        txtUserName.Text = "";
                        txtUserPassword.Text = "";
                        txtUserCollegeCode.Text = "";
                        //If user is invalid then throw a alert message.
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "functionInvalidUser(invalidUser = true)", true);
                    }
                }
                else
                {
                    lblUserLoginDetails.Visible = true;
                    lblUserLoginDetails.Text = "Special characters not allow.";
                }
            }
            else
            {
                if(txtUserName.Text == "")
                {
                    //If user name is not provided then throw a alert message.
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "return myFunction(invalidUser = 'txtUserName')", true);
                }
                else if(txtUserPassword.Text == "")
                {
                    //If user password is not provided then throw a alert message.
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "return myFunction(invalidUser = 'txtUserPassword')", true);
                }
                else
                {
                    if(txtUserCollegeCode.Text == "")
                    {
                        //If user college code is not provided then throw a alert message.
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "return myFunction(invalidUser = 'txtUserCollegeCode')", true);
                    }
                }
                txtUserName.Text = "";
                txtUserPassword.Text = "";
                txtUserCollegeCode.Text = "";
                lblUserLoginDetails.Visible = true;
                lblUserLoginDetails.Text = "Please ented user credentials.";
            }
        }
    }
}