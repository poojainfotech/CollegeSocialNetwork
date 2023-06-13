using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollegeSocialNetwork.Controller
{
    public class UserMailsDetails
    {

        public string MailID { get; set; }
        public string RecipientEmailAddress { get; set; }
        public string SenderEmailAddress { get; set; }
        public string MailSubject { get; set; }
        public string MailMessageBody { get; set; }
        public string MailTime { get; set; }
        public string Status { get; set; }
    }
}