using CSNConnectionUtility;

namespace CollegeSocialNetwork
{
    public class UserDetails : System.Web.UI.Page
    {
        private string userName;
        private string userRole;

        public UserDetails()
        {
            if (Session["ActiveUserInformation"] != null)
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    this.userName = activeUserInformation.UserName.Trim();
                    this.userRole = activeUserInformation.UserRole.Trim();
                }
                else
                {
                    this.userName = "";
                    this.userRole = "";
                }
            }
        }

        public string GetUserName
        {
            get
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    this.userName = activeUserInformation.UserName.Trim();
                }
                else
                {
                    this.userName = "";
                }
                return this.userName;
            }
            set
            {

            }
        }

        public string GetUserRole
        {
            get
            {
                ActiveUserInformation activeUserInformation = (ActiveUserInformation)Session["ActiveUserInformation"];
                if (activeUserInformation != null)
                {
                    this.userRole = activeUserInformation.UserRole.Trim();
                }
                else
                {
                    this.userRole = "";
                }
                return this.userRole;
            }
            set
            {

            }
        }
    }
}