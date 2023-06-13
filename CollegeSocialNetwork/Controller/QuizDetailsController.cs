using CollegeSocialNetwork.Model;
using CSNConnectionUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CollegeSocialNetwork.Controller
{
    public class QuizDetailsController : ApiController
    {
        public IEnumerable<QuizInformation> Get()
        {
            List<QuizInformation> quizList = new List<QuizInformation>();
            
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            DataTable dt = dataBaseUtility.GetDataSet("sp_ViewQuiz", "ViewQuiz", null);
            
            foreach (DataRow dr in dt.Rows)
            {
                QuizInformation quizInformation = new QuizInformation();
                quizInformation.QuizID = dr["QuizID"].ToString().Trim();
                quizInformation.QuizOption1 = dr["QuizOption1"].ToString().Trim();
                quizInformation.QuizOption2 = dr["QuizOption2"].ToString().Trim();
                quizInformation.QuizOption3 = dr["QuizOption3"].ToString().Trim();
                quizInformation.QuizOption4 = dr["QuizOption4"].ToString().Trim();
                quizInformation.QuizText = dr["QuizText"].ToString().Trim();
                quizInformation.QuizAnswerOption = dr["QuizAnswerOption"].ToString().Trim();
                quizList.Add(quizInformation);
            }
            return quizList;
        }
    }
}
