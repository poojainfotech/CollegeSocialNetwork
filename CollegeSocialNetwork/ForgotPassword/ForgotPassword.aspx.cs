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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordChangedButton_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text != "")
            {
                if (SpecialCharacterUtility.validateSpecialCharecter(txtUserName.Text, "[^a-zA-Z0-9_.@]"))
                {
                    DataBaseUtility dataBaseUtility = new DataBaseUtility();
                    Queue paramName = new Queue();
                    string randPassword = PasswordUtility.CreateRandomPassword().Trim();
                    paramName.Enqueue(new SqlParameter("@Name", txtUserName.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@Password", randPassword.Trim()));
                    //int result = dataBaseUtility.InsertDataInTable("sp_UsersResetPassword", paramName);
                    DataSet ds = dataBaseUtility.GetDataSet("sp_UsersResetPassword", paramName);
                    String senderEmailAddress = "";
                    String recipientEmailAddress = "";

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        senderEmailAddress = "bscitpoojabscit @gmail.com";
                        recipientEmailAddress = ds.Tables[0].Rows[0]["EmailAddress"].ToString();

                        //lblPasswordResetLink.Visible = true;
                        //lblPasswordResetLink.Text = "Password reset successfully. <br/> New Password : " + randPassword.Trim();
                        //lblPasswordResetLink.Text = "Password changed successfully, plz check you mail.";
                        //Password changed successfully, plz check you mail.
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SendMailForPasswordChange('" + txtUserName.Text.Trim() + "','" + recipientEmailAddress + "','" + senderEmailAddress + "','Change Password Request','Password reset successfully. New Password : " + randPassword.Trim() + "')", true);
                    }
                    else
                    {
                        lblPasswordResetLink.Visible = true;
                        lblPasswordResetLink.Text = "Unable to reset password, invalid user name.";
                    }
                }
                else
                {
                    lblPasswordResetLink.Visible = true;
                    lblPasswordResetLink.Text = "Special characters not allow.";
                }
            }
            else
            {
                if (txtUserName.Text == "")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "return myFunction(invalidUser = 'txtUserName')", true);
                }
             
                txtUserName.Text = "";
                lblPasswordResetLink.Visible = true;
                lblPasswordResetLink.Text = "Please ented user credentials.";
            }
        }

        protected void btnBackToLoginPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login/CSNLogin.aspx");
        }
    }
}