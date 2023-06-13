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

namespace CollegeSocialNetwork.Profile
{
    public partial class UserSocialCommentHistory : System.Web.UI.Page
    {
        public DataTable ViewUserSocialCommentHistory = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["functiOnCommentHistoryNo"] != null)
            {
                DataBaseUtility dataBaseUtility = new DataBaseUtility();
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@UserProfileID", Request.QueryString["functiOnCommentHistoryNo"].Trim()));
                DataTable dt = dataBaseUtility.GetDataSet("sp_UserSocialCommentHistory", "UserSocialCommentHistory", paramName);

                if (dt.Rows.Count > 0)
                {
                    this.ViewUserSocialCommentHistory = dt;
                }
            }
        }
    }
}