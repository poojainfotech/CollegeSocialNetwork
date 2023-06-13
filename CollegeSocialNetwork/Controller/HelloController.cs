using CollegeSocialNetwork.Model;
using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CollegeSocialNetwork.Controller
{
    public class HelloController : ApiController
    {
        private DataBaseUtility dataBaseUtility;

        public IEnumerable<UserInformation> Get(string Name)
        {
            List<UserInformation> userList = null;
            
            dataBaseUtility = new DataBaseUtility();
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", Name.Trim()));
            DataTable getAllActivateUser = dataBaseUtility.GetDataSet("sp_GetAllActivateUser", "GetAllActivateUser", paramName);
            if (getAllActivateUser != null)
            {
                userList = new List<UserInformation>();
                foreach(DataRow dr in getAllActivateUser.Rows)
                {
                    UserInformation userInformation = new UserInformation();
                    userInformation.Role = dr["UserRole"].ToString();
                    userInformation.Name = dr["UserName"].ToString();
                    byte[] bytes = (byte[])dr["Data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    userInformation.UserImage = "data:image/png;base64," + base64String;
                    userList.Add(userInformation);
                }
            }
            return userList;
        }

        public IEnumerable<GetUserProfileInfo> GetUserProfileInfo(string userName)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", userName.Trim()));

            List<GetUserProfileInfo> userList = null;
            GetUserProfileInfo userInformation = new GetUserProfileInfo();
            dataBaseUtility = new DataBaseUtility();
            DataTable getActivateUser = dataBaseUtility.GetDataSet("sp_GetUsersProfile", "GetUsersProfile", paramName);
            if (getActivateUser != null)
            {
                userList = new List<GetUserProfileInfo>();
                foreach (DataRow dr in getActivateUser.Rows)
                {
                    userInformation.UserName = dr["UserName"].ToString();
                    if(dr["RoleID"].ToString() == "1")
                    {
                        userInformation.Role = "Admin";
                    }
                    else if(dr["RoleID"].ToString() == "2")
                    {
                        userInformation.Role = "Faculty";
                    }
                    else if (dr["RoleID"].ToString() == "3")
                    {
                        userInformation.Role = "Student";
                    }
                    else
                    {
                        userInformation.Role = "Parent";
                    }
                    
                    userInformation.CollegeCode = dr["CollegeCode"].ToString();
                    userInformation.FirstName = dr["FirstName"].ToString();
                    userInformation.ModdleName = dr["ModdleName"].ToString();
                    userInformation.LastName = dr["LastName"].ToString();
                    userInformation.EmailAddress = dr["EmailAddress"].ToString();
                    userInformation.DOB = dr["DOB"].ToString();
                    userInformation.PinNo = dr["PinNo"].ToString();
                    userInformation.Premises = dr["Premises"].ToString();
                    userInformation.ParentName = dr["ParentName"].ToString();
                    userInformation.City = dr["City"].ToString();
                    userInformation.Country = dr["Country"].ToString();
                    userInformation.StateID = dr["StateID"].ToString();
                    userInformation.PhoneNumber = dr["PhoneNumber"].ToString();
                    userInformation.Gender = dr["Gender"].ToString() == "1"?"Male": dr["Gender"].ToString() == "2"?"Female":"Other";
                    userInformation.Course = dr["Course"].ToString();
                    byte[] bytes = (byte[])dr["Data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    userInformation.UserImage = "data:image/png;base64," + base64String;
                    userList.Add(userInformation);
                }
            }
            return userList;
        }

    }
}
