<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CollegeSocialNetwork.ForgotPassword.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../JS/Login.js"></script>
    <script type="text/javascript">
        function SendMailForPasswordChange(userName, recipientMailAddress, senderEmailAddress, subject, maiMessageBody) {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            progressbarDiv1.fadeIn(1000);            
            progressbarLable1.text('In Progress...');
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/UserMails/GetSendUsersMail',
                data: {
                    UserName: userName,
                    RecipientEmailAddress: recipientMailAddress,
                    SenderEmailAddress: senderEmailAddress,
                    MailSubject: subject,
                    MailMessageBody: maiMessageBody
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    var check = false;
                    $.each(data, function (index, val) {
                        if (val.Status == 'Success') {
                            check = true;
                        }
                    });
                    if (check) {
                        //alert('Password changed successfully, plz check you mail.');
                        //progressbarDiv1.fadeIn(1000);
                        progressbarDiv1.fadeOut(10000);
                        progressbarLable1.text('Password changed successfully, plz check your mail.');
                    }
                    else {
                        //alert('Password not changed successfully.');
                        //progressbarDiv1.fadeIn(1000);
                        progressbarDiv1.fadeOut(10000);
                        progressbarLable1.text('Password not changed successfully.');
                    }
                },
                error: function (xhr, status, error) {

                    alert("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        }
    </script>
    <style>
        body
        {
            background:url(../images/loginImages/loginImage6.jpg) no-repeat center center fixed;
            background-size:100% 100%;
            height:100%;
            position:absolute;
            width:100%;
        }
    </style>
</head>
<body id="bodyImage" style="padding:0; margin:0;">
    <form id="form1" runat="server">
        <div style="height:208px;">
            <div style="width:98%; padding-left:1%; margin-top:60px; padding-right:1%;  color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                <marquee>
                    <b id="tdCSN" style="margin-left:2%;">COLLEGE SOCIAL NETWORK</b>
                </marquee>
            </div>
            <div id="progressbar" style="position:relative; height:30px; margin-top:100px; display:none;">
               <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;"></span>
            </div>
        </div>
        <div style="height:161px;">
            <table style="margin:0px 0px 0px 60%; border-collapse:collapse;">
                <tr>
                    <td style="width:300px;">
                        <span style="font-weight:200; color:white;"><b>User Name</b></span>
                    </td>
                </tr>
                <tr>
                    <td style="width:500px;">
                        <div>
                            <table>
                                <tr>
                                    <td><asp:TextBox ID="txtUserName" runat="server" MaxLength="10" Width="300" onblur = "validateUserFields(this,document.getElementById('txtUserNameSpan'),true,'Please enter user name.');" ></asp:TextBox></td>
                                    <td style="width:400px; font-size:15px;"><span id="txtUserNameSpan" style="color:red; visibility:hidden;">*</span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="">
                        <div>
                            <table>
                                <tr>
                                    <td style="text-align:left; padding-left:2px;">
                                         <span style=" margin-left:-1px; color:white;">
                                           <asp:Button ID="PasswordChangedButton"  OnClick="PasswordChangedButton_Click" OnClientClick="return checkUserDetails();" runat="server" Width="130" Text="Change Password" />
                                         </span>
                                    </td>
                                    <td style="text-align:right; width:173px; " >
                                         <span style=" margin-left:-1px; color:white;">
                                           <asp:Button ID="btnBackToLoginPage" OnClick="btnBackToLoginPage_Click" runat="server" Width="130" Text="Back To User Login" />
                                         </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblPasswordResetLink" Visible ="false" ForeColor="White" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <script>
                let image = document.getElementById('bodyImage');
                let images = ['loginImage3.jpg', 'loginImage4.jpg', 'loginImage5.jpg', 'loginImage6.jpg', 'loginImage7.jpg'];
                let count = 0;
                setInterval(function () {
                    image.style.backgroundImage = 'url(../images/loginImages/' + images[count] + ')';
                    image.style.opacity = 10000;
                    count++;
                    if (count == 5) {
                        count = 0;
                    }
                }, 3000);
                


                let elementCSN = ['tdCSN'];
                let countElementCSN = 0;
                let varColor5 = '#e60099';
                let varColor6 = '#006699'
                setInterval(function () {
                    if (countElementCSN == 0) {
                        document.getElementById(elementCSN[0]).style.color = varColor5;
                    }
                    else {
                        document.getElementById(elementCSN[0]).style.color = varColor6;
                    }

                    countElementCSN++;
                    if (countElementCSN == 2) {
                        countElementCSN = 0;
                    }
                }, 2000);
            </script>
            <asp:HiddenField ID="hiddenUserName" runat="server" />
            <asp:HiddenField ID="hiddenSenderEmailAddress" runat="server" />
        </div>
    </form>
</body>
</html>
