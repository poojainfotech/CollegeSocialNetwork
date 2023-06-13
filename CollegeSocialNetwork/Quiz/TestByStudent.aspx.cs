using CSNConnectionUtility;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CollegeSocialNetwork.Quiz
{
    public partial class TestByStudent : System.Web.UI.Page
    {
        public DataTable ViewQuizData = null;
        DataBaseUtility dataBaseUtility = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HiddenNextCount.Value = "10";
                hiddenPreviousCount.Value = "1";
                getQuestion();
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

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(hiddenPreviousCount.Value) >= 11)
            {
                HiddenNextCount.Value = (Convert.ToInt32(HiddenNextCount.Value) - 10).ToString();
                hiddenPreviousCount.Value = (Convert.ToInt32(hiddenPreviousCount.Value) - 10).ToString();
            }
            getQuestion();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(HiddenNextCount.Value) < 41)
            {
                HiddenNextCount.Value = (Convert.ToInt32(HiddenNextCount.Value) + 10).ToString();
                hiddenPreviousCount.Value = (Convert.ToInt32(hiddenPreviousCount.Value) + 10).ToString();
                dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@NextCount", HiddenNextCount.Value));
                paramName.Enqueue(new SqlParameter("@PreviousCount", hiddenPreviousCount.Value));
                DataTable dt = dataBaseUtility.GetDataSet("sp_ViewQuiz", "ViewQuiz", paramName);

                if (dt.Rows.Count > 0)
                {
                    this.ViewQuizData = dt;
                }
            }
            else
            {
                getQuestion();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
            if (HiddenQuestionAnswerDetails.Value != "1:N|2:N|3:N|4:N|5:N|6:N|7:N|8:N|9:N|10:N|11:N|12:N|13:N|14:N|15:N|16:N|17:N|18:N|19:N|20:N|21:N|22:N|23:N|24:N|25:N|26:N|27:N|28:N|29:N|30:N|31:N|32:N|33:N|34:N|35:N|36:N|37:N|38:N|39:N|40:N|41:N|42:N|43:N|44:N|45:N|46:N|47:N|48:N|49:N|50:N")
            {
                string[] questionAnswerCollection = HiddenQuestionAnswerDetails.Value.Split('|');
                dataBaseUtility = new DataBaseUtility();
                DataTable dtTableReset = dataBaseUtility.GetDataSet("sp_QuizQuestionAnswerCollectionReset", "QuizQuestionAnswerCollectionReset", null);
                for (int i = 0; i < questionAnswerCollection.Length - 1; i++)
                {
                    string[] questionAnswerSet = questionAnswerCollection[i].Split(':');
                    if (questionAnswerSet.Length > 0)
                    {
                        //dataBaseUtility = new DataBaseUtility();
                        Queue paramQuizQuestionAnswerCollection = new Queue();
                        paramQuizQuestionAnswerCollection.Enqueue(new SqlParameter("@QuizID", questionAnswerSet[0].ToString()));
                        paramQuizQuestionAnswerCollection.Enqueue(new SqlParameter("@QuizAnswerOption", questionAnswerSet[1].ToString()));
                        if (activeUserInformation != null)
                        {
                            paramQuizQuestionAnswerCollection.Enqueue(new SqlParameter("@QuizAttemptByUserName", activeUserInformation.UserName.ToString().Trim()));
                        }
                        paramQuizQuestionAnswerCollection.Enqueue(new SqlParameter("@QuizAttemptByUserDate", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
                        DataTable dtTable = dataBaseUtility.GetDataSet("sp_QuizQuestionAnswerCollection", "QuizQuestionAnswerCollection", paramQuizQuestionAnswerCollection);
                        if (dtTable.Rows.Count > 0)
                        {
                            if(activeUserInformation != null)
                            {
                                lblMsg.Text = "Test completed by " + activeUserInformation.UserName.ToString().Trim() + ". You can check your result.";
                            }
                            else
                            {
                                lblMsg.Text = "Test completed. You can check your result.";
                            }
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "testByStudentUser('" + lblMsg.Text + "')", true);
                        }
                    }
                }
                getQuestion();
            }
            else
            {
                getQuestion();
                lblMsg.Text = "You have not attempt any questionn.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "testByStudentUser('" + lblMsg.Text + "')", true);
                
            }
            
        }

        protected void getQuestion()
        {
            dataBaseUtility = new DataBaseUtility();
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@NextCount", HiddenNextCount.Value));
            paramName.Enqueue(new SqlParameter("@PreviousCount", hiddenPreviousCount.Value));
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewQuiz", "ViewQuiz", paramName);

            if (dt.Rows.Count > 0)
            {
                this.ViewQuizData = dt;
            }
        }
    }
}