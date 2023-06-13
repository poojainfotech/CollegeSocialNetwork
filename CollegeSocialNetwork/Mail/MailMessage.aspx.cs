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

namespace CollegeSocialNetwork.Mail
{
    public partial class MailMessage : System.Web.UI.Page
    {
        DataBaseUtility dataBaseUtility;
        public DataTable ViewMail = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["UserName"] != null && Request.QueryString["Name"] != string.Empty)
            {
                Queue paramName = new Queue();
                paramName.Enqueue(new SqlParameter("@UserName", Request.QueryString["UserName"].Trim()));
                paramName.Enqueue(new SqlParameter("@MailID", Request.QueryString["MailID"].Trim()));

                dataBaseUtility = new DataBaseUtility();
                DataTable getMail = dataBaseUtility.GetDataSet("sp_GetEmailDetailsByID", "GetEmailDetailsByID", paramName);
                if (getMail != null)
                {
                    if (getMail.Columns.Count > 1)
                    {
                        ViewMail = getMail;
                    }
                }
            }
        }
    }
}