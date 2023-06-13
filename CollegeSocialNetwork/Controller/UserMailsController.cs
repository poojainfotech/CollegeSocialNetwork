using CollegeSocialNetwork.Model;
using CSNConnectionUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;

namespace CollegeSocialNetwork.Controller
{
    public class UserMailsController : ApiController
    {
        private DataBaseUtility dataBaseUtility;
        public IEnumerable<StatusMessage> GetSendUsersMail(string UserName, string RecipientEmailAddress, string SenderEmailAddress, string MailSubject, string MailMessageBody)
        {

            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
            paramName.Enqueue(new SqlParameter("@RecipientEmailAddress", RecipientEmailAddress.Trim()));
            paramName.Enqueue(new SqlParameter("@SenderEmailAddress", SenderEmailAddress.Trim()));
            paramName.Enqueue(new SqlParameter("@MailSubject", MailSubject.Trim()));
            paramName.Enqueue(new SqlParameter("@MailMessageBody", MailMessageBody.Trim()));
            //paramName.Enqueue(new SqlParameter("AttachedDocument", Comment.Trim()));
            paramName.Enqueue(new SqlParameter("@MailTime", DateTime.Now.ToString("yyyyMMddHHmmss").Trim()));
            List<StatusMessage> mailStatus = new List<StatusMessage>();
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_Mail", "Mail", paramName);
            if (getDiscussion != null)
            {
                if (getDiscussion.Rows[0]["Status"].ToString() == "Success")
                {
                    StatusMessage statusMessage = new StatusMessage();
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        statusMessage.Status = "Success";
                        mailStatus.Add(statusMessage);
                    }

                    string sendMail = ConfigurationManager.AppSettings["SendEmail"];
                    if(sendMail.ToString() == "true")
                    {
                        string smtpAddress = "smtp.gmail.com";
                        int portNumber = 587;
                        bool enableSSL = true;
                        //bscitpoojabscit@gmail.com
                        //pawan!@#$%^_19011984
                        //string emailFrom = SenderEmailAddress.Trim();

                        string emailFrom = "bscitpoojamailservices@gmail.com";
                        //string password = "mqgtpzcrponhsent";
                        //string password = "bscitpoojamailservices@123";
                        string password = "ghtblxfquiaiuipf";
                        //string emailTo = RecipientEmailAddress.Trim();
                        string emailTo = "poojayadavinfotech@gmail.com";
                        //string subject = "Hello";
                        //string body = "Hello, I'm just writing this to say Hi!";

                        try
                        {
                            using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress(emailFrom);
                                mail.To.Add(emailTo);
                                mail.Subject = MailSubject.Trim();
                                mail.Body = MailMessageBody.Trim();
                                mail.IsBodyHtml = true;
                                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                                {
                                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                                    smtp.UseDefaultCredentials = false;
                                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                                    smtp.EnableSsl = enableSSL;
                                    smtp.Send(mail);
                                }
                            }
                        }
                        catch(Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                    }
                }
                else
                {
                    StatusMessage statusMessage = new StatusMessage();
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        statusMessage.Status = "Error";
                        mailStatus.Add(statusMessage);
                    }
                }
            }
            return mailStatus;
        }
        public IEnumerable<UserMailsDetails> GetRecipientEmailDetails(string UserName, string RecipientEmailAddress)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
            //paramName.Enqueue(new SqlParameter("@RecipientEmailAddress", RecipientEmailAddress.Trim()));

            List<UserMailsDetails> userMailsDetailsList = new List<UserMailsDetails>();
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_GetRecipientEmailDetails", "GetRecipientEmailDetails", paramName);
            if (getDiscussion != null)
            {
                if(getDiscussion.Rows[0]["Status"].ToString() == "Success")
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        UserMailsDetails userMailsDetails = new UserMailsDetails();
                        userMailsDetails.MailID = dr["MailID"].ToString();
                        userMailsDetails.RecipientEmailAddress = dr["RecipientEmailAddress"].ToString();
                        userMailsDetails.SenderEmailAddress = dr["SenderEmailAddress"].ToString();
                        userMailsDetails.MailSubject = dr["MailSubject"].ToString();
                        userMailsDetails.MailMessageBody = dr["MailMessageBody"].ToString();
                        userMailsDetails.MailTime = dr["MailTime"].ToString();
                        userMailsDetails.Status = dr["Status"].ToString();
                        userMailsDetailsList.Add(userMailsDetails);
                    }
                }
                else
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        //UserMailsDetails userMailsDetails = new UserMailsDetails();
                        //userMailsDetails.Status = dr["Status"].ToString();
                        //userMailsDetailsList.Add(userMailsDetails);
                    }
                }
            }
            return userMailsDetailsList;
        }

        public IEnumerable<UserMailsDetails> GetSenderEmailDetails(string UserName, string SenderEmailAddress)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));
            //paramName.Enqueue(new SqlParameter("@SenderEmailAddress", SenderEmailAddress.Trim()));

            List<UserMailsDetails> userMailsDetailsList = new List<UserMailsDetails>();
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_GetSenderEmailDetails", "GetSenderEmailDetails", paramName);
            if (getDiscussion != null)
            {
                if (getDiscussion.Rows[0]["Status"].ToString() == "Success")
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        UserMailsDetails userMailsDetails = new UserMailsDetails();
                        userMailsDetails.MailID = dr["MailID"].ToString();
                        userMailsDetails.RecipientEmailAddress = dr["RecipientEmailAddress"].ToString();
                        userMailsDetails.SenderEmailAddress = dr["SenderEmailAddress"].ToString();
                        userMailsDetails.MailSubject = dr["MailSubject"].ToString();
                        userMailsDetails.MailMessageBody = dr["MailMessageBody"].ToString();
                        userMailsDetails.MailTime = dr["MailTime"].ToString();
                        userMailsDetails.Status = dr["Status"].ToString();
                        userMailsDetailsList.Add(userMailsDetails);
                    }
                }
                else
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        //UserMailsDetails userMailsDetails = new UserMailsDetails();
                        //userMailsDetails.Status = dr["Status"].ToString();
                        //userMailsDetailsList.Add(userMailsDetails);
                    }
                }
            }
            return userMailsDetailsList;
        }

        public IEnumerable<UserMailsDetails> GetUserAllEmailDetails(string UserName)
        {
            Queue paramName = new Queue();
            paramName.Enqueue(new SqlParameter("@UserName", UserName.Trim()));

            List<UserMailsDetails> userMailsDetailsList = new List<UserMailsDetails>();
            dataBaseUtility = new DataBaseUtility();
            DataTable getDiscussion = dataBaseUtility.GetDataSet("sp_GetUserAllEmailDetails", "GetUserAllEmailDetails", paramName);
            if (getDiscussion != null)
            {
                if (getDiscussion.Rows[0]["Status"].ToString() == "Success")
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        UserMailsDetails userMailsDetails = new UserMailsDetails();
                        userMailsDetails.MailID = dr["MailID"].ToString();
                        userMailsDetails.RecipientEmailAddress = dr["RecipientEmailAddress"].ToString();
                        userMailsDetails.SenderEmailAddress = dr["SenderEmailAddress"].ToString();
                        userMailsDetails.MailSubject = dr["MailSubject"].ToString();
                        userMailsDetails.MailMessageBody = dr["MailMessageBody"].ToString();
                        userMailsDetails.MailTime = dr["MailTime"].ToString();
                        userMailsDetails.Status = dr["Status"].ToString();
                        userMailsDetailsList.Add(userMailsDetails);
                    }
                }
                else
                {
                    foreach (DataRow dr in getDiscussion.Rows)
                    {
                        //UserMailsDetails userMailsDetails = new UserMailsDetails();
                        //userMailsDetails.Status = dr["Status"].ToString();
                        //userMailsDetailsList.Add(userMailsDetails);
                    }
                }
            }
            return userMailsDetailsList;
        }
    }
}

