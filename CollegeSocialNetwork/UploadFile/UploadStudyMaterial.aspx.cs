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

namespace CollegeSocialNetwork.UploadFile
{
    public partial class UploadPDFfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnUploadPDFfile_Click(object sender, EventArgs e)
        {
            string filePath = fileUploadStudyMaterial.PostedFile.FileName; // getting the file path of uploaded file  
            string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
            string type = String.Empty;
            if (!fileUploadStudyMaterial.HasFile)
            {
                lblMsg.Text = "Please Select File"; //if file uploader has no file selected  
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
            }
            else
            if (fileUploadStudyMaterial.HasFile)
            {
                try
                {
                    switch (ext) // this switch code validate the files which allow to upload only PDF file   
                    {
                        case ".pdf":
                            type = "application/pdf";
                            break;
                    }
                    if (type != String.Empty)
                    {
                        
                        Stream fs = fileUploadStudyMaterial.PostedFile.InputStream;
                        BinaryReader br = new BinaryReader(fs); //reads the binary files  
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length); //counting the file length into bytes  
                        DataBaseUtility dataBaseUtility = new DataBaseUtility();
                        Queue paramName = new Queue();
                        paramName.Enqueue(new SqlParameter("@PDFfileName", filename1));
                        paramName.Enqueue(new SqlParameter("@FileType", type));
                        paramName.Enqueue(new SqlParameter("@FileData", bytes));

                        if (Session["ActiveUserInformation"] != null)
                        {
                            ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                            if (activeUserInformation != null)
                            {
                                paramName.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
                            }
                        }
                        paramName.Enqueue(new SqlParameter("@UploadedDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                        DataTable dt = dataBaseUtility.GetDataSet("sp_UploadPDFfile", "UploadPDFfile", paramName);

                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0]["Status"].ToString() == "Success")
                            {
                                lblMsg.Text = "File Uploaded Successfully";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                            }
                            else if (dt.Rows[0]["Status"].ToString() == "Found")
                            {
                                lblMsg.Text = "File already exists. " + "File not uploaded successfully.";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                            }
                            else
                            {
                                lblMsg.Text = "File not uploaded successfully.";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                            }
                        }
                        else
                        {
                            lblMsg.Text = "File not uploaded successfully.";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Select Only PDF Files "; // if file is other than speified extension   
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error: " + ex.Message.ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "uploadStudyMaterial('" + lblMsg.Text + "')", true);
                }
            }
        }
    }
}