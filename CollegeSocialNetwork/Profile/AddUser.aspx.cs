using CSNConnectionUtility;
using System;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace CollegeSocialNetwork.Profile
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //ResetInputFields();
            }
        }

        protected void btAddUser_Click(object sender, EventArgs e)
        {
            if(hiddenFieldForTypeOfUser.Value.ToString() != "N")
            {
                if (txtFirstName.Text != "" && txtLastName.Text != "" &&
                txtEmailAddress.Text != "" && txtPremises.Text != "" &&
                ddlGender.SelectedValue != "-1" && txtPinNo.Text != "" && txtCity.Text != "" &&
                txtState.Text != "" && txtCoutry.Text != "" && txtPinNo.Text != ""
               )
                {
                    if (SpecialCharacterUtility.validateSpecialCharecter(txtFirstName.Text, "[^a-zA-Z0-9_.@ ]") &&
                        SpecialCharacterUtility.validateSpecialCharecter(txtMiddleName.Text, "[^a-zA-Z0-9_.@ ]")
                       )
                    {
                        DataBaseUtility dataBaseUtility = new DataBaseUtility();
                        Queue paramName = new Queue();

                        paramName.Enqueue(new SqlParameter("@UserName", txtUserName.Text.ToString().Trim()));

                        if (ddlTypeOfUser.SelectedValue.ToString().Trim() == "Faculty")
                        {
                            paramName.Enqueue(new SqlParameter("@RoleID", "2"));
                        }
                        else if (ddlTypeOfUser.SelectedValue.ToString().Trim() == "Student")
                        {
                            paramName.Enqueue(new SqlParameter("@RoleID", "3"));
                        }
                        paramName.Enqueue(new SqlParameter("@AccountID", "1"));
                        paramName.Enqueue(new SqlParameter("@Password", txtUserPassword.Text.ToString().Trim()));
                        paramName.Enqueue(new SqlParameter("@FirstName", txtFirstName.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@ModdleName", txtMiddleName.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@LastName", txtLastName.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@EmailAddress", txtEmailAddress.Text.Trim()));

                        string userDob = "";
                        userDob = Request.Form["txtDateOfBirth"];
                        if (userDob != null)
                        {
                            userDob = GetAndSetDate.GetDateInStringFormate(userDob);
                        }

                        paramName.Enqueue(new SqlParameter("@DOB", userDob));
                        paramName.Enqueue(new SqlParameter("@UpdateDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));

                        //Address parameter
                        paramName.Enqueue(new SqlParameter("@Premises", txtPremises.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@Gender", ddlGender.SelectedValue.Trim()));
                        paramName.Enqueue(new SqlParameter("@CollegeCode", ddlTypeColledgeCode.SelectedValue.Trim()));

                        paramName.Enqueue(new SqlParameter("@City", txtCity.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@PinNo", txtPinNo.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@StateID", txtState.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@Country", txtCoutry.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@PhoneNumber", txtPhone.Text.Trim()));
                        paramName.Enqueue(new SqlParameter("@FileName", Path.GetFileName(fileUploadImage.PostedFile.FileName)));
                        paramName.Enqueue(new SqlParameter("@ContentType", fileUploadImage.PostedFile.ContentType));

                        byte[] bytes;
                        using (BinaryReader br = new BinaryReader(fileUploadImage.PostedFile.InputStream))
                        {
                            bytes = br.ReadBytes(fileUploadImage.PostedFile.ContentLength);
                        }
                        paramName.Enqueue(new SqlParameter("@Data", bytes));

                        //Update the User Profile with address.
                        int success = dataBaseUtility.InsertDataInTable("sp_AddUsersProfile", paramName);
                        if (success > 0)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "userAddedSuccessfully()", true);
                            ClearAll();
                            //ResetInputFields();
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "InvalidUserDetails()", true);
                        }
                    }
                    else
                    {
                        ClearAll();
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "myFunction(invalidUser = true)", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "SelectTypeOfUser()", true);
            }            
        }

        private void ClearAll()
        {
            txtUserName.Text = "";
            txtUserPassword.Text = "";
            txtUserConfirmPassword.Text = "";
            txtUserParentName.Text = "";
            txtUserParentPassword.Text = "";
            txtUserParentConfirmPassword.Text = "";
            txtFirstName.Text = "";
            txtMiddleName.Text = "";
            txtLastName.Text = "";
            txtEmailAddress.Text = "";
            txtPremises.Text = "";
            txtDateOfBirth.Text = "";
            txtPinNo.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtCoutry.Text = "";
            txtPhone.Text = "";
            ddlTypeColledgeCode.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            ddlStudentCourse.SelectedIndex = 0;
            ddlTypeOfUser.SelectedIndex = 0;
            ddlStudentCourse.SelectedIndex = 0;
        }

        private void ResetInputFields()
        {
            txtUserName.Enabled = true;
            txtUserPassword.Enabled = true;
            txtUserConfirmPassword.Enabled = true;
            txtUserParentName.Enabled = true;
            txtUserParentPassword.Enabled = true;
            txtUserParentConfirmPassword.Enabled = true;
            txtFirstName.Enabled = true;
            txtMiddleName.Enabled = true;
            txtLastName.Enabled = true;
            txtEmailAddress.Enabled = true;
            txtPremises.Enabled = true;
            txtDateOfBirth.Enabled = true;
            txtPinNo.Enabled = true;
            txtCity.Enabled = true;
            txtState.Enabled = true;
            txtCoutry.Enabled = true;
            txtPhone.Enabled = true;
            ddlGender.SelectedIndex = 0;
            ddlGender.Enabled = true;
            ddlTypeOfUser.SelectedIndex = 0;
            ddlTypeOfUser.Enabled = true;
            ddlStudentCourse.SelectedIndex = 0;
            ddlStudentCourse.Enabled = true;
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearAll();
            //ResetInputFields();
        }
    }
}