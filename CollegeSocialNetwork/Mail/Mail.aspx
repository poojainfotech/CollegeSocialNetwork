<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="CollegeSocialNetwork.Mail.Mail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function btnInboxMail() {
            document.getElementById("btnSave").style.display = 'none';
            var tblMailItemContainer = $('#tblMailItem');
            tblMailItemContainer.empty();

            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/UserMails/GetRecipientEmailDetails',
                data: {
                    UserName: document.getElementById('hiddenUserName').value,
                    RecipientEmailAddress: document.getElementById('hiddenSenderEmailAddress').value,
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.length == 0) {
                        tblMailItemContainer.empty();
                        chat = '<tr>' +
                            '<td colspan="10" style="width:10%;color:#c2d6d6;text-align:center;font-weight:bold; height:250px;">You have not recieve any mail.</td>' +
                            '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                    else {
                        var count = 2;
                        var chat = '';
                        $.each(data, function (index, val) {
                            if (count % 2 == 0) {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            else {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            count = count + 1;
                            chat = chat + '<tr>' +
                            '<td colspan="10" style="width:10%; height:10px;"></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:2%;' + bgColur1 + 'border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"></td>' +
                            '<td colspan="6" style="' + bgColur2 + 'width:10%; padding-left:20px;font-weight: bold; text-decoration: underline; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"><a href="#" onclick="return popitup(' + "'MailMessage.aspx?UserName=" + document.getElementById('hiddenUserName').value + '&MailID=' + val.MailID + "'" + ');" style="' + bgColur3 + '">' + val.MailSubject + '</a></td>' +
                            '<td colspan="2" style="' + bgColur2 + 'width:10%;' + bgColur4 + ' padding-left:20px; font-weight: bold; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">' +
                             val.MailTime.substring(6, 8) + '/' + val.MailTime.substring(4, 6) + '/' + val.MailTime.substring(0, 4) + '&nbsp;&nbsp;' + val.MailTime.substring(8, 10) + ':' + val.MailTime.substring(10, 12)
                            '</td>' +
                                '</tr>' +
                            '<tr>' +
                            '<td colspan="10" style="width:10%; height:5px;"></td>' +
                            '</tr>' 
                        });
                        chat = chat + '<tr>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:2%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '<td style="width:10%;"></td>' +
                        '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                },
                error: function (xhr, status, error) {
                    tblMailItemContainer.empty();
                    tblMailItemContainer.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        }

        function btnSentMail() {
            document.getElementById("btnSave").style.display = 'none';
            var tblMailItemContainer = $('#tblMailItem');
            tblMailItemContainer.empty();

            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/UserMails/GetSenderEmailDetails',
                data: {
                    UserName: document.getElementById('hiddenUserName').value,
                    SenderEmailAddress: document.getElementById('hiddenSenderEmailAddress').value,
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.length == 0) {
                        tblMailItemContainer.empty();
                        chat = '<tr>' +
                               '<td colspan="10" style="width:10%;color:#c2d6d6;text-align:center;font-weight:bold; height:250px;">You have not send any mail.</td>' +
                               '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                    else {
                        var count = 2;
                        var chat = '';
                        $.each(data, function (index, val) {
                            if (count % 2 == 0) {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            else {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            count = count + 1;
                            chat = chat + '<tr>' +
                                '<td colspan="10" style="width:10%; height:10px;"></td>' +
                                '</tr>' +
                                '<tr>' +
                                '<td style="width:10%;"></td>' +
                                '<td style="width:2%;' + bgColur1 + 'border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"></td>' +
                                '<td colspan="6" style="' + bgColur2 + 'width:10%; padding-left:20px;font-weight: bold; text-decoration: underline; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"><a href="#" onclick="return popitup(' + "'MailMessage.aspx?UserName=" + document.getElementById('hiddenUserName').value + '&MailID=' + val.MailID + "'" + ');" style="' + bgColur3 + '">' + val.MailSubject + '</a></td>' +
                                '<td colspan="2" style="' + bgColur2 + 'width:10%;' + bgColur4 + ' padding-left:20px; font-weight: bold; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">' +
                                val.MailTime.substring(6, 8) + '/' + val.MailTime.substring(4, 6) + '/' + val.MailTime.substring(0, 4) + '&nbsp;&nbsp;' + val.MailTime.substring(8, 10) + ':' + val.MailTime.substring(10, 12)
                                '</td>' +
                                '</tr>' +
                                '<tr>' +
                                '<td colspan="10" style="width:10%; height:5px;"></td>' +
                                '</tr>'
                        });
                        chat = chat + '<tr>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:2%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                },
                error: function (xhr, status, error) {
                    tblMailItemContainer.empty();
                    tblMailItemContainer.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        }

        function btnAllMail() {
            document.getElementById("btnSave").style.display = 'none';

            var tblMailItemContainer = $('#tblMailItem');
            tblMailItemContainer.empty();

            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            $.ajax({
                type: 'GET',

                url: rootUrl + '/api/UserMails/GetUserAllEmailDetails',
                data: {
                    UserName: document.getElementById('hiddenUserName').value
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.length == 0) {
                        tblMailItemContainer.empty();
                        chat = '<tr>' +
                            '<td colspan="10" style="width:10%;color:#c2d6d6;text-align:center;font-weight:bold; height:250px;">You have not any mail.</td>' +
                            '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                    else {
                        var count = 2;
                        var chat = '';
                        $.each(data, function (index, val) {
                            if (count % 2 == 0) {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            else {
                                bgColur1 = 'background-color:chartreuse;';
                                bgColur2 = 'background-color:#e6faff;';
                                bgColur3 = 'color:darkgray;';
                                bgColur4 = 'color:#c2d6d6;';
                            }
                            count = count + 1;
                            chat = chat + '<tr>' +
                                '<td colspan="10" style="width:10%; height:10px;"></td>' +
                                '</tr>' +
                                '<tr>' +
                                '<td style="width:10%;"></td>' +
                                '<td style="width:2%;' + bgColur1 + 'border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"></td>' +
                                '<td colspan="6" style="' + bgColur2 + 'width:10%; padding-left:20px;font-weight: bold; text-decoration: underline; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;"><a href="#" onclick="return popitup(' + "'MailMessage.aspx?UserName=" + document.getElementById('hiddenUserName').value + '&MailID=' + val.MailID + "'" + ');" style="' + bgColur3 + '">' + val.MailSubject + '</a></td>' +
                                '<td colspan="2" style="' + bgColur2 + 'width:10%;' + bgColur4 + ' padding-left:20px; font-weight: bold; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">' +
                                val.MailTime.substring(6, 8) + '/' + val.MailTime.substring(4, 6) + '/' + val.MailTime.substring(0, 4) + '&nbsp;&nbsp;' + val.MailTime.substring(8, 10) + ':' + val.MailTime.substring(10, 12)
                            '</td>' +
                                '</tr>' +
                                '<tr>' +
                                '<td colspan="10" style="width:10%; height:5px;"></td>' +
                                '</tr>'
                        });
                        chat = chat + '<tr>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:2%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '<td style="width:10%;"></td>' +
                            '</tr>'
                        tblMailItemContainer.append(chat);
                    }
                },
                error: function (xhr, status, error) {
                    tblMailItemContainer.empty();
                    tblMailItemContainer.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        }

        function btnComposeMail() {
            document.getElementById("btnSave").style.display = 'none';
            var tblMailItemContainer = $('#tblMailItem');
            tblMailItemContainer.empty();
            var chat = '<tr>' +
                '<td colspan="10" style="width:10%; color:#ff9999; height:10px; padding-bottom:10px; font-weight:bold;text-shadow: 1px 1px #c2f0c2;">New Message</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="1" style="width:10%; color:#ff9999;font-weight:bold; height:10px;text-shadow: 1px 1px #c2f0c2;">Recipient</td>' +
                '<td colspan="9" style="background-color:#e6faff;width:10%; padding-left:0px;font-weight: bold; text-decoration: underline; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">' +
                '<input id="txtRecipientEmailAddress" spellcheck="True" style="border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border:0.5px solid #ff9999; width:1062px; color:deepskyblue; " type="text" />' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="10" style="width:10%; height:5px;"></td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="1" style="width:10%; color:#ff9999;font-weight:bold; height:10px;text-shadow: 1px 1px #c2f0c2;">Subject</td>' +
                '<td colspan="9" style="background-color:#e6faff;width:10%; padding-left:0px;font-weight: bold; text-decoration: underline; border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">' +
                '<input id="txtSubject" spellcheck="True" style="border-top-right-radius:10px;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; border:0.5px solid #ff9999; width:1062px;color:deepskyblue;" type="text" />' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="10" style="width:10%; height:5px;"></td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="10" style="width:10%; color:#ff9999;font-weight:bold; height:10px;text-shadow: 1px 1px #c2f0c2;">Message Body</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="10" style="width:10%; color:aquamarine; height:10px;">' +

                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="10" style="width:10%; color:aquamarine; height:auto; height:70px;">' +
                '<textarea id="maiMessageBody" cols="152" rows="8" spellcheck="True" style="border-color:#ff9999; font-weight:bold; color:deepskyblue;" maxlength="500"></textarea>' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:2%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '</tr>'
            tblMailItemContainer.append(chat);
            document.getElementById("btnSave").style.display = 'block';
        }

        function btnSaveMail() {
            if (document.getElementById("txtRecipientEmailAddress").value == '') {
                alert('Please enter Recipient email address.');
            }
            else if (document.getElementById("txtSubject").value == '') {
                alert('Please enter mail Subject.');
            }
            else if (document.getElementById("maiMessageBody").value == '') {
                alert('Please enter message body.');
            }
            else {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                $.ajax({
                    type: 'GET',
                    url: rootUrl + '/api/UserMails/GetSendUsersMail',
                    data: {
                        UserName: document.getElementById("hiddenUserName").value,
                        RecipientEmailAddress: document.getElementById("txtRecipientEmailAddress").value,
                        SenderEmailAddress: document.getElementById("hiddenSenderEmailAddress").value,
                        MailSubject: document.getElementById("txtSubject").value,
                        MailMessageBody: document.getElementById("maiMessageBody").value
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
                            document.getElementById("txtRecipientEmailAddress").value = '';
                            document.getElementById("txtSubject").value = '';
                            document.getElementById("maiMessageBody").value = '';
                            alert('Message send successfully');
                        }
                        else {
                            alert('Message not send successfully');
                        }
                    },
                    error: function (xhr, status, error) {

                        alert("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                    }
                });
            }
            document.getElementById("btnSave").style.display = 'block';
        }

        function popitup(url) {
            newwindow = window.open(url, 'name', 'height=400,width=850');
            if (window.focus) { newwindow.focus() }
            return false;
        }
    </script>  
    <style>
        /* width */
        ::-webkit-scrollbar {
          width: 10px;
          background-color: #F5F5F5!important;
        }

        /* Track */
        ::-webkit-scrollbar-track {
          background-color: #d6f5f5;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
          background:#adebeb;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
          background:#adebeb;
        }


        ::-webkit-file-upload-button {
                  background: black;
                  border:1px solid red;
                  color: #ff6666;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

        .dropDownList{
            background:#c2f0c2;
                  border:1px solid red;
                  color: #ff6666;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

        .button {
                  background: #c2f0c2;
                  border:1px solid red;
                  color: #ff6666;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

        .buttonChat {
            /*background-color:#d8f2bd;  color:#5db005;*/
                  background: #c2f0c2;
                  border:1px solid red;
                  color: red;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }
        

        .ddlSemesterClass
        {
            border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;
        }
    </style>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server" style="margin:0px; padding:0px;">
        <div style="margin:0px; padding:0px;">
            <div style="height:auto; width:90%; margin:auto; padding:0px;">
                <asp:ScriptManager ID='ScriptManager1' runat='server' EnablePageMethods='true' />  
              <table style="height:auto; width:100%;margin:0px; padding:0px; border-collapse:collapse;">
                  <tr>
                      <td colspan="10" style="height:30px; width:100%;background-color:#8A0808; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:100% 30px;"">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style=" padding-left:2%; padding-right:2%; width:98%; height:50px; color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                          <marquee>
                              <b id="tdCSN" style="margin-left:2%;">COLLEGE SOCIAL NETWORK</b>
                          </marquee>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:10%;">                         
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px; font-weight:bold;">Mail Service</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>M. S.</b>
                      </td>
                      <td id="tdHeaderImage" colspan="9" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1057px 65px;">
                        <div>
                            <script>
                                let image = document.getElementById('tdHeaderImage');
                                let images = ['SocialImage/11.jfif', 'SocialImage/12.jfif', 'SocialImage/13.jfif', 'SocialImage/14.jfif', 'SocialImage/15.jfif'];
                                let count = 0;
                                setInterval(function () {
                                    image.style.backgroundImage = 'url(../Profile/' + images[count] + ')';
                                    image.style.opacity = 10000;
                                    count++;
                                    if (count == 5) {
                                        count = 0;
                                    }
                                }, 2000);
                            </script>
                        </div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style=" height:50px; " >
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" >
                          <div style="height:330px; width:100%; overflow:auto;">
                               <table id="tblUserDetails" style="width:100%;  margin:auto; font-family:Verdana; font-size:14px; " >
                                    <tr>
                                        <td colspan="1" style="width:5%;color:orangered; text-align:left; font-family:fantasy; font-size:20px;">
                                            <input id="btnInbox" style="color:#ff6666;" onclick="btnInboxMail();" type="button" value="Inbox" class="button" />
                                        </td>
                                        <td colspan="1" style="width:5%;color:orangered; text-align:left; font-family:fantasy; font-size:20px;">
                                            <input id="btnSent"  style="color:#ff6666;" onclick="btnSentMail();" type="button" value="Sent"  class="button" />
                                        </td>
                                        <td colspan="1" style="width:5%;color:orangered; text-align:left; font-family:fantasy; font-size:20px;">
                                            <input id="btnTrace"  style="color:#ff6666;" onclick="btnAllMail();" type="button" value="All Mail"  class="button" />
                                        </td>
                                        <td colspan="1" style="width:5%;color:orangered; text-align:left; font-family:fantasy; font-size:20px;">
                                            <input id="btnCompose"  style="color:#ff6666;" onclick="btnComposeMail();" type="button" value="Compose"  class="button" />
                                        </td>
                                        <td colspan="9" style="width:10%;height:12px;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" style="width:5%;">
                                          <div id="divMailItem" style="width:100%; height:260px; overflow:auto;">
                                              <table id="tblMailItem" style="width:100%;height:auto;margin:0px; padding:0px; border-spacing:0px;">
                                                  
                                              </table>
                                          </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="width:10%;">
                                            <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button" />                       
                                        </td>
                                        <td colspan="2" style="width:5%;">
                                            <input id="btnSave"  style="color:#ff6666; display:none;" onclick="btnSaveMail();" type="button" value="Send" class="button" />
                                        </td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                    </tr>
                                    <tr>
                                        <td style="width:5%;"></td>
                                        <td style="width:5%;"></td>
                                        <td style="width:5%;"></td>
                                        <td style="width:5%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                        <td style="width:10%;"></td>
                                    </tr>
                               </table>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:10%;">                         
                         
                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">
                          
                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                  </tr>
              </table>
                    <script>
                        let elementlogo = ['logo'];
                        let countElementlogo = 0;
                        let varColor3 = '#d9d9d9';
                        let varBGColor3 = '#6699cc';
                        let varColor4 = '#f2f2f2'
                        let varBGColor4 = '#3973ac'
                        setInterval(function () {
                            if (countElementlogo == 0) {
                                document.getElementById(elementlogo[0]).style.color = varColor3;
                                document.getElementById(elementlogo[0]).style.backgroundColor = varBGColor3;
                            }
                            else {
                                document.getElementById(elementlogo[0]).style.color = varColor4;
                                document.getElementById(elementlogo[0]).style.backgroundColor = varBGColor4;
                            }

                            countElementlogo++;
                            if (countElementlogo == 2) {
                                countElementlogo = 0;
                            }

                        }, 2000);

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
        </div>
    </form>
</body>
</html>
