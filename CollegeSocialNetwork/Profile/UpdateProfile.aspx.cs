using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.Profile
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetUserInformatio();
            }
        }

        private void ClearAll()
        {
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
            ddlGender.SelectedIndex = 0;
            fileUploadImage = null;
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
        }

        protected void btSaveUserProfile_Click(object sender, EventArgs e)
        {            
            if (txtFirstName.Text != "" && txtLastName.Text != "" &&
                txtEmailAddress.Text != "" && txtPremises.Text != "" &&
                ddlGender.SelectedValue != "-1" && txtPinNo.Text != "" && txtCity.Text != "" &&
                txtState.Text != "" && txtCoutry.Text != "" && txtPinNo.Text != "" && !string.IsNullOrEmpty(fileUploadImage.FileName)

                )
            {
                 
                if (SpecialCharacterUtility.validateSpecialCharecter(txtFirstName.Text, "[^a-zA-Z0-9_.@ ]") &&
                    SpecialCharacterUtility.validateSpecialCharecter(txtMiddleName.Text, "[^a-zA-Z0-9_.@ ]")
                   )
                {
                    DataBaseUtility dataBaseUtility = new DataBaseUtility();
                    Queue paramName = new Queue();
                    if(Session["ActiveUserInformation"] != null)
                    {
                        ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                        if(activeUserInformation != null)
                        {
                            paramName.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
                        }
                    }
                    
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
                    paramName.Enqueue(new SqlParameter("@City", txtCity.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@PinNo", txtPinNo.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@StateID", txtState.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@Country", txtCoutry.Text.Trim()));
                    paramName.Enqueue(new SqlParameter("@PhoneNumber", txtPinNo.Text.Trim()));

                    paramName.Enqueue(new SqlParameter("@FileName", Path.GetFileName(fileUploadImage.PostedFile.FileName)));
                    paramName.Enqueue(new SqlParameter("@ContentType", fileUploadImage.PostedFile.ContentType));

                    byte[] bytes;
                    using (BinaryReader br = new BinaryReader(fileUploadImage.PostedFile.InputStream))
                    {
                        bytes = br.ReadBytes(fileUploadImage.PostedFile.ContentLength);
                    }
                    paramName.Enqueue(new SqlParameter("@Data", bytes));


                    //Update the User Profile with address.
                    int success = dataBaseUtility.InsertDataInTable("sp_UpdateUsersProfile", paramName);
                    if(success > 0)
                    {
                        ActiveUserInformation activeUserInformation = null;
                        if (Session["ActiveUserInformation"] != null)
                        {
                            activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                            if (activeUserInformation != null)
                            {
                                activeUserInformation.UserEmailAddress = txtEmailAddress.Text.Trim();
                            }
                            Session["ActiveUserInformation"] = null;
                            Session["ActiveUserInformation"] = activeUserInformation;
                        }
                        GetUserInformatio();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ProfileUpdatedSuccessfully();", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ProfileNoUpdatedSuccessfully();", true);
                    }
                }
                else
                {
                    ClearAll();
                }
            }
            else
            {
                if(string.IsNullOrEmpty(fileUploadImage.FileName))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PleaseSelectImage();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ProfileNoUpdatedSuccessfully();", true);
                }
                
            }
        }

        private void GetUserInformatio()
        {
            DataTable dtUserProfile = null;
            DataTable dtUserAddress = null;
            DataTable dtUserImage = null;
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            ActiveUserInformation activeUserInformation = null;
            Queue paramName = new Queue();
            Queue paramNameUserImage = new Queue();
            if (Session["ActiveUserInformation"] != null)
            {
                activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    paramName.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
                    //paramName.Enqueue(new SqlParameter("@UserRole", activeUserInformation.UserRole.Trim()));
                    //paramName.Enqueue(new SqlParameter("@UserPassword", activeUserInformation.UserPassword.Trim()));
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "return myFunction(invalidUser = true)", true);
                Response.Redirect("../Error/SessionExpire.aspx");
            }
            
            dtUserProfile = dataBaseUtility.GetDataSet("sp_GetUserProfile", "GetUserProfile", paramName);
            if(dtUserProfile != null)
            {
                if (dtUserProfile.Rows.Count > 0)
                {
                    txtFirstName.Text = dtUserProfile.Rows[0]["FirstName"].ToString();
                    txtMiddleName.Text = dtUserProfile.Rows[0]["ModdleName"].ToString();
                    txtLastName.Text = dtUserProfile.Rows[0]["LastName"].ToString();
                    txtEmailAddress.Text = dtUserProfile.Rows[0]["EmailAddress"].ToString();
                    txtDateOfBirth.Text = GetAndSetDate.GetDateInDateFormate(dtUserProfile.Rows[0]["DOB"].ToString());
                }
            }

            paramName = new Queue();
            if (activeUserInformation != null)
            {
                paramName.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
            }

            dtUserAddress = dataBaseUtility.GetDataSet("sp_GetUserAddress", "GetUserAddress", paramName);
            if (dtUserAddress != null)
            {
                if (dtUserAddress.Rows.Count > 0)
                {
                    txtPremises.Text = dtUserAddress.Rows[0]["Premises"].ToString();
                    ddlGender.SelectedValue = dtUserAddress.Rows[0]["Gender"].ToString();
                    txtCity.Text = dtUserAddress.Rows[0]["City"].ToString();
                    txtPinNo.Text = dtUserAddress.Rows[0]["PinNo"].ToString();
                    txtState.Text = dtUserAddress.Rows[0]["StateID"].ToString();
                    txtCoutry.Text = dtUserAddress.Rows[0]["Country"].ToString();
                    txtPhone.Text = dtUserAddress.Rows[0]["PhoneNumber"].ToString();
                }
            }

            paramNameUserImage = new Queue();
            if (activeUserInformation != null)
            {
                paramNameUserImage.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
            }
            dtUserImage = dataBaseUtility.GetDataSet("sp_GetUsersImage", "GetUsersImage", paramNameUserImage);
            if (dtUserImage != null)
            {
                if (dtUserImage.Rows.Count > 0)
                {
                    byte[] bytes = (byte[])dtUserImage.Rows[0]["Data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    userImage.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }
    }
}





