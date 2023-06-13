using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.AdminUser
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        public DataTable ViewReceivedMail = null;

        DataBaseUtility dataBaseUtility = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy HH:mm:ss");

            if (Session["ActiveUserInformation"] != null)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    hiddenUserName.Value = activeUserInformation.UserName.ToString().Trim();
                    hiddenSenderEmailAddress.Value = activeUserInformation.UserEmailAddress.ToString().Trim();
                }
            }
            else
            {
                Response.Redirect("~/Login/CSNLogin.aspx");
            }

            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", hiddenUserName.Value.Trim()));
            //paramName.Enqueue(new SqlParameter("@RecipientEmailAddress", hiddenSenderEmailAddress.Value.Trim()));
            
            dataBaseUtility = new DataBaseUtility();
            DataTable getMail = dataBaseUtility.GetDataSet("sp_GetRecipientEmailDetails", "GetRecipientEmailDetails", paramName);
            if (getMail != null)
            {
                if (getMail.Columns.Count > 1)
                {
                    ViewReceivedMail = getMail;
                }
            }
        }

        [WebMethod]
        public static bool SessionExpire()
        {
            UserInfoInSession userInfoInSession = new UserInfoInSession();
            UserDetails userDetails = new UserDetails();
            return userInfoInSession.DeActivateUser(userDetails.GetUserName.ToString().Trim(), userDetails.GetUserRole.ToString().Trim());
        }

        [WebMethod]
        public static string GetActiveUser()
        {
            DataBaseUtility dataBaseUtility = new DataBaseUtility();
            string numberOfUser = dataBaseUtility.GetNumberOfActiveUser("sp_GetAllActivateUser", null).ToString();
            return numberOfUser;
        }
    }
}