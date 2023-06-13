using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeSocialNetwork.Error
{
    public partial class SessionExpire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBacktoLoginPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login/CSNLogin.aspx");
        }
    }
}