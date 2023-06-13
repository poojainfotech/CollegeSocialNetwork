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

namespace CollegeSocialNetwork.Quiz
{
    public partial class DeleteQuiz : System.Web.UI.Page
    {
        public DataTable ViewQuizData = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataBaseUtility dataBaseUtility = new DataBaseUtility();
            //DataTable dt = dataBaseUtility.GetDataSet("sp_DeleteQuiz", "ViewQuiz", null);

            //if (dt.Rows.Count > 0)
            //{
            //    this.ViewQuizData = dt;
            //}
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hdnIdToDelete.Value) && !string.IsNullOrWhiteSpace(hdnIdToDelete.Value))
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@QuizID", hdnIdToDelete.Value.Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_DeleteQuiz", "DeleteQuiz", paramName);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "Success")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteQuizSuccessfully();", true);
                        //lblMsg.Text = "Quiz deleted successfully.";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteQuizFailed();", true);
                        //lblMsg.Text = "Quiz not deleted successfully.";
                        //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                        //lblMsg.Visible = true;
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "deleteQuizNotSelected();", true);
                //lblMsg.Text = "Input field is not valid. <br /> Please select quiz for delete.";
                //lblMsg.ForeColor = System.Drawing.Color.OrangeRed;
                //lblMsg.Visible = true;
            }
        }
    }
}