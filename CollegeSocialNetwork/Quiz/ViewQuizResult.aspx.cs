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
    public partial class TestResult : System.Web.UI.Page
    {
        public DataTable ViewResultData = null;
        DataBaseUtility dataBaseUtility = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    HiddenFieldUserName.Value = activeUserInformation.UserName.ToString().Trim();
                    dataBaseUtility = new DataBaseUtility();
                    Queue paramName = new Queue();
                    paramName.Enqueue(new SqlParameter("@UserName", activeUserInformation.UserName.ToString().Trim()));
                    DataTable dt = dataBaseUtility.GetDataSet("sp_TestReportCards", "TestReportCards", paramName);
                    DataTable newDataTable = new DataTable();
                    newDataTable.Columns.Add(new DataColumn("FirstName", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("UserParentFirstName", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("UserParentLastName", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("CourseName", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("AcadamicYear", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("Subject", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("Mark", typeof(string)));
                    newDataTable.Columns.Add(new DataColumn("Grade", typeof(string)));
                    int correctQuestionCount = 0;
                    if (dt.Rows.Count > 0)
                    {
                        string answerOption = "";
                        foreach(DataRow dr in dt.Rows)
                        {

                            switch(dr["QuizAnswerOptionSelectedByUser"].ToString())
                            {
                                case "0" :
                                    answerOption = "A";
                                    break;
                                case "1":
                                    answerOption = "B";
                                    break;
                                case "2":
                                    answerOption = "C";
                                    break;
                                case "3":
                                    answerOption = "D";
                                    break;
                                default:
                                    answerOption = "N";
                                    break;

                            }
                            
                            if (dr["QuizAnswerOption"].ToString() == answerOption)
                            {
                                correctQuestionCount++;
                                answerOption = "";
                            }
                        }

                        int percentComplete = (int)Math.Round((double)(100 * correctQuestionCount) / 50);

                        string grade = percentComplete > 90 ? "A++" : percentComplete > 80 ? "B++" : percentComplete > 70 ? "B" : percentComplete > 60 ? "C" : percentComplete > 60?"D":"F";

                        DataRow newrow = newDataTable.NewRow();

                        newrow["FirstName"] = dt.Rows[0]["FirstName"].ToString();
                        newrow["UserParentFirstName"] = dt.Rows[0]["UserParentFirstName"].ToString();
                        newrow["UserParentLastName"] = dt.Rows[0]["UserParentLastName"].ToString();
                        newrow["CourseName"] = dt.Rows[0]["CourseName"].ToString();
                        newrow["AcadamicYear"] = dt.Rows[0]["AcademicYear"].ToString();
                        newrow["Subject"] = dt.Rows[0]["SubjectName"].ToString();
                        newrow["Mark"] = percentComplete.ToString();
                        newrow["Grade"] = grade;
                        newDataTable.Rows.Add(newrow);
                            
                        this.ViewResultData = newDataTable;
                    }
                }
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