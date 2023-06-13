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

namespace CollegeSocialNetwork.Quiz
{
    public partial class AddQuiz : System.Web.UI.Page
    {
        private DataBaseUtility dataBaseUtility;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminUser/AdminHomePage.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {            
            //if (txtQuiz.Text != "" && txtOption1.Text != "" && txtOption2.Text != "" && txtOption3.Text != "" && txtOption4.Text != "" && ddlQuizOption.SelectedValue != "-1")
            //{
            //    DataBaseUtility dataBaseUtility = new DataBaseUtility();
            //    Queue paramName = new Queue();
            //    paramName.Enqueue(new SqlParameter("@QuizText", txtQuiz.Text.Trim()));
            //    paramName.Enqueue(new SqlParameter("@QuizOption1", txtOption1.Text.Trim()));
            //    paramName.Enqueue(new SqlParameter("@QuizOption2", txtOption2.Text.Trim()));
            //    paramName.Enqueue(new SqlParameter("@QuizOption3", txtOption3.Text.Trim()));
            //    paramName.Enqueue(new SqlParameter("@QuizOption4", txtOption4.Text.Trim()));
            //    paramName.Enqueue(new SqlParameter("@QuizAnswerOption", ddlQuizOption.SelectedValue.Trim()));
            //    DataTable dt = dataBaseUtility.GetDataSet("sp_AddQuiz", "AddQuiz", paramName);

            //    if (dt.Rows.Count > 0)
            //    {
            //        if (dt.Rows[0]["Status"].ToString() == "Success")
            //        {
            //            lblMsg.Text = "Quiz added successfully.";
            //            lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            //            lblMsg.Visible = true;
            //        }
            //        else if (dt.Rows[0]["Status"].ToString() == "Found")
            //        {
            //            lblMsg.Text = "Quiz already exists. <br />" + "Quiz not added successfully.";
            //            lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            //            lblMsg.Visible = true;
            //        }
            //        else
            //        {
            //            lblMsg.Text = "Quiz not added successfully.";
            //            lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            //            lblMsg.Visible = true;
            //        }
            //    }
            //    else
            //    {
            //        lblMsg.Text = "Quiz not added successfully.";
            //        lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            //        lblMsg.Visible = true;
            //    }
            //}
            //else
            //{
            //    lblMsg.Text = "Input field is not valid. <br /> Please inter quiz and it's options.";
            //    lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            //    lblMsg.Visible = true;
            //}
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
            lblMsg.Visible = false;
        }

        protected void btnUploadQuiz_Click(object sender, EventArgs e)
        {
            
            lblMsg.Visible = true;
            DataTable dataTable = null;
            string UserName = "";
            string filePath = fileUploadQuiz.PostedFile.FileName; // getting the file path of uploaded file  
            string filename = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename); // getting the file extension of uploaded file  
            string type = String.Empty;
            if (!fileUploadQuiz.HasFile)
            {
                lblMsg.Text = "Please Select File"; //if file uploader has no file selected  
                lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                lblMsg.Visible = true;
            }
            else
            if (fileUploadQuiz.HasFile)
            {
                try
                {
                    switch (ext) // this switch code validate the files which allow to upload only PDF file   
                    {
                        case ".txt":
                            type = "application/txt";
                            break;
                    }
                    if (type != String.Empty)
                    {
                        if (Session["ActiveUserInformation"] != null)
                        {
                            ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                            if (activeUserInformation != null)
                            {
                                UserName = activeUserInformation.UserName.ToString().Trim();
                            }
                        }
                        List<string> myValues = new List<string>();
                        string line;
                        StreamReader file = new StreamReader(fileUploadQuiz.PostedFile.InputStream);
                        
                        String StatusOfFileLoad = "failed";
                        while ((line = file.ReadLine()) != null)
                        {
                            string[] fields = line.Split('|');
                            string valNM = "";
                            if(fields.Length == 6)
                            {
                                for(int i = 0; i < fields.Length; i++)
                                {
                                    string[] fieldsValues = fields[i].Split(':');
                                    valNM = fieldsValues[1].ToString();
                                }
                                dataBaseUtility = new DataBaseUtility();
                                Queue paramName = new Queue();
                                paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
                                paramName.Enqueue(new SqlParameter("@QuizText", fields[0].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@QuizOption1", fields[1].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@QuizOption2", fields[2].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@QuizOption3", fields[3].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@QuizOption4", fields[4].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@QuizAnswerOption", fields[5].Split(':')[1].ToString()));
                                paramName.Enqueue(new SqlParameter("@UploadedDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                                dataTable = dataBaseUtility.GetDataSet("sp_AddQuiz", "AddQuiz", paramName);
                                StatusOfFileLoad = "Success";
                            }
                        }

                        if(StatusOfFileLoad == "Success")
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fileUploadStatus(true);", true);
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "fileUploadStatus(false);", true);
                        }
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Please select txt file only with proper question formate."; // if file is other than speified extension   
                        lblMsg.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error: " + ex.Message.ToString();
                }
            }
        }
    }
}