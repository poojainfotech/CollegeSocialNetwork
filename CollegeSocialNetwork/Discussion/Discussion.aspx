<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Discussion.aspx.cs" Inherits="CollegeSocialNetwork.Discussion.Discussion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function postComment() {
            var discussionReplyPanal = $('#tblDiscussionReply');
            discussionReplyPanal.empty();
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/DiscussionForum/GetDiscussionForumByUserNameOnly',
                data: {
                    CourseName: document.getElementById('ddlCourse').value,
                    Semester: document.getElementById('ddlSemester').value,
                    SubjectName: document.getElementById('idSubjectName').innerHTML
                },
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data) {
                    if (data.length == 0) {
                        discussionReplyPanal.empty();
                        document.getElementById('tblDiscussionReply').style.visibility = 'hidden';
                    }
                    else {
                        var count = 2;
                        var bgColur = '';
                        $.each(data, function (index, val) {
                            if (count % 2 == 0) {
                                bgColur = 'background-color:#b3ffb3;';
                            }
                            else {
                                bgColur = 'background-color:#e6ffe6;';
                            }
                            count = count + 1;
                            var chat = '<tr>' +
                                '<td style="' + bgColur + 'width:100px; color:#f062a2;   text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                    val.UserName +
                                '</td>' +
                                '<td style="' + bgColur + 'width:400px; color:#5c5255;  text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                    val.Comment +
                                '</td>' +
                                '<td style="' + bgColur + 'width:100px; color:#595758;  text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                val.DateOfPost.substring(6, 8) + '/' + val.DateOfPost.substring(4, 6) + '/' + val.DateOfPost.substring(0, 4) + '&nbsp;&nbsp;' + val.DateOfPost.substring(8, 10) + ':' + val.DateOfPost.substring(10, 12)
                                '</td>' +
                                '</tr>'
                            discussionReplyPanal.append(chat);
                            document.getElementById('tblDiscussionReply').style.visibility = 'visible';
                        });
                    }
                },
                error: function (xhr, status, error) {
                    discussionReplyPanal.empty();
                    discussionReplyPanal.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
            document.getElementById('txtComment').value = '';
        }

        function btnPostComment_Click() {
            var discussionReplyPanal = $('#tblDiscussionReply');
            //discussionReplyPanal.empty();
            if (document.getElementById('txtComment').value == '') {
                alert('Please enter comment to post.');
            } else {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                $.ajax({
                    type: 'GET',
                    url: rootUrl + '/api/DiscussionForum/GetDiscussionForum',
                    data: {
                        userName: document.getElementById('hiddenUserName').value,
                        CourseName: document.getElementById('ddlCourse').value,
                        Semester: document.getElementById('ddlSemester').value,
                        SubjectName: document.getElementById('idSubjectName').innerHTML,
                        Comment: document.getElementById('txtComment').value
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        if (data.length == 0) {
                            discussionReplyPanal.empty();
                            document.getElementById('tblDiscussionReply').style.visibility = 'hidden';
                        }
                        else {
                            var count = 2;
                            var bgColur = '';
                            $.each(data, function (index, val) {
                                if (count % 2 == 0) {
                                    bgColur = 'background-color:#b3ffb3;';
                                }
                                else {
                                    bgColur = 'background-color:#e6ffe6;';
                                }
                                count = count + 1;
                                var chat = '<tr>' +
                                    '<td style="' + bgColur + 'width:100px; color:#f062a2;   text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                    val.UserName +
                                    '</td>' +
                                    '<td style="' + bgColur + 'width:400px; color:#5c5255; text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                    val.Comment +
                                    '</td>' +
                                    '<td style="' + bgColur + 'width:100px; color:#595758; text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">' +
                                    val.DateOfPost.substring(6, 8) + '/' + val.DateOfPost.substring(4, 6) + '/' + val.DateOfPost.substring(0, 4) + '&nbsp;&nbsp;' + val.DateOfPost.substring(8, 10) + ':' + val.DateOfPost.substring(10, 12)
                                '</td>' +
                                    '</tr>'
                                discussionReplyPanal.append(chat);
                                document.getElementById('tblDiscussionReply').style.visibility = 'visible';
                            });
                        }
                        postComment();
                    },
                    error: function (xhr, status, error) {
                        discussionReplyPanal.empty();
                        discussionReplyPanal.append("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                    }
                });
            }
            document.getElementById('txtComment').value = '';
        }

        function setDiscussionPanal(element) {
            /*console.log(element.innerHTML);*/
            
            var discussionPanal = $('#divDiscussionPanal');
            discussionPanal.empty();
            var htmlElement =
                '<table style="height:auto; width:100%; margin-top:-0.5px; border:1px solid red;" >' +
                '<tr>' +
                '<td colspan ="6" style="width:10%; height:15px; font-weight:300; background-color:#d8f2bd; color:#ff6666; text-align:left;  font-weight:bold; font-family:fantasy;">Subject Name : ' + '<span id="idSubjectName">' + element.innerHTML + '</span>' + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="6" style="width:10%; height:20px; font-weight:300; background-color:#d8f2bd;  color:#ff6666; text-align:left; font-weight:bold; font-family:fantasy;">' +
                'Discussion Reply' +
                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan ="6" style="width:10%; height:225px; overflow:auto;">' +
                '<div style="height:225px; overflow:auto; ">' +
                '<div id="divDiscussionReply" style="height:auto; overflow:auto; ">' +

                '<table id="tblDiscussionReply" style="visibility:hidden;" >' +

                '</table>' +

                '</div>' +
                '</div>' +

                '</td>' +
                '</tr>' +
                '<tr>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '<td style="width:10%;"></td>' +
                '</tr>' +
                '<tr>' +
                '<td colspan="2" style="width:10%; height:20px;font-weight:300; background-color:#d8f2bd; color:#ff6666; font-weight:bold; font-family:fantasy;">' +
                'Comment' +
                '</td>' +
                '<td colspan="4" style="width:10%; height:20px; font-weight:300; background-color:#d8f2bd;">' +
                '<textarea id="txtComment" cols="50" rows="1"></textarea>' +
                '</td>' +
                '</tr>' +

                '<tr>' +
                '<td colspan="2" style="width:10%; height:20px;">' +
                '<input id="btnPostComment" OnClick="btnPostComment_Click();" style="color:#ff6666;" type="button"  value="Post Comment" class="buttonChat" />' +
                '</td>' +
                '<td colspan="2" style="width:10%;">' +
                '<input id="btnClearComment" OnClick="btnClearComment_Click();" style="color:#ff6666;" type="button"  value="Clear Comment"  class="buttonChat" />' +
                '</td>' +
                
                //'<td colspan="2" style="width:10%;">Attach File</td>' +
                //'<td colspan="2" style="width:200px;">' +
                //'<input type="file" id="myFile" name="filename">'
                //'</td>' +
                '</tr>' +
                '</table>';
            discussionPanal.append(htmlElement);
            //document.getElementById('btnLoadDiscussionChat').disabled = false;
            postComment();
        }

        function btnClearComment_Click() {
            document.getElementById('txtComment').value = '';
        }

        function CourseDiscussion(msg) {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            progressbarDiv1.fadeIn(1000);
            progressbarDiv1.fadeOut(3000);
            progressbarDiv1.fadeIn(1000);
            progressbarLable1.text(msg);
            progressbarDiv1.fadeOut(3000);
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

        #boxes-list::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #d6f5f5;
        }

        #boxes-list::-webkit-scrollbar
        {
            width: 12px;
            background-color: #F5F5F5!important;
        }

        #boxes-list::-webkit-scrollbar-thumb
        {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3)!important;
            /*background-color: #FFCC00!important;*/
            background-color: #9999ff!important;
        }


        #divDiscussionPanal::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #FFCC00;
        }

        #divDiscussionPanal::-webkit-scrollbar
        {
            width: 12px;
            background-color: #F5F5F5!important;
        }

        #divDiscussionPanal::-webkit-scrollbar-thumb
        {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3)!important;
            /*background-color: #FFCC00!important;*/
            background-color: #9999ff!important;
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px; font-weight:bold;">Discussion Forum</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>D. F.</b>
                      </td>
                      <td id="tdHeaderImage" colspan="9" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1057px 65px;">
                        <div>
                            <script>
                                let image = document.getElementById('tdHeaderImage');
                                let images = ['SocialImage/11.jfif', 'SocialImage/12.jfif', 'SocialImage/13.jfif', 'SocialImage/14.jfif', 'SocialImage/15.jfif'];
                                //let images = ['SocialImage/headerImage1.png', 'SocialImage/headerImage2.png', 'SocialImage/headerImage3.jpg', 'SocialImage/headerImage4.jpg', 'SocialImage/headerImage5.jpg'];
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
                      <td colspan="10" style=" height:1px; " >
                      </td>
                  </tr>
                  <tr>
                      <td colspan="5" style="width:10%;">                         
                          <div style="width:100%; height:auto;  overflow:auto;">                         
                              <table style="width:100%;">
                                  <tr>
                                      <td style="width:10%;"></td>
                                      <td style="width:10%;"></td>
                                      <td colspan="8" style="width:10%;">
                                          <b style="color:darkorange; text-align:left; font-family:fantasy; font-size:15px;">Select Course</b>                
                                          <asp:DropDownList ID="ddlCourse" runat="server"  CssClass="dropDownList">
                                              <asp:ListItem Selected="True" Value="-1" Text="Select Course"></asp:ListItem>
                                          </asp:DropDownList>
                                          <b style="color:darkorange; text-align:left; font-family:fantasy; font-size:15px;">Select Semester</b>
                                          <asp:DropDownList ID="ddlSemester" runat="server" CssClass="dropDownList" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged" AutoPostBack="true" >
                                              <asp:ListItem Selected="True" Value="-1" Text="Select Semester"></asp:ListItem>
                                              <asp:ListItem Value="Sem_1">Semester 1</asp:ListItem>
                                              <asp:ListItem Value="Sem_2">Semester 2</asp:ListItem>
                                              <asp:ListItem Value="Sem_3">Semester 3</asp:ListItem>
                                              <asp:ListItem Value="Sem_4">Semester 4</asp:ListItem>
                                              <asp:ListItem Value="Sem_5">Semester 5</asp:ListItem>
                                              <asp:ListItem Value="Sem_6">Semester 6</asp:ListItem>
                                          </asp:DropDownList>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td colspan="10" style=" height:25px; text-align:center;">
                                            <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>                         
                                            <div id="progressbar" style="position:relative; height:25px; display:none; ">
                                              <span id="progressbar-label" style="position:absolute; color:#00aaff; font-family:fantasy; left:20%; top:20%; "></span>
                                            </div>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="10">
                                          <div style="width:100%; height:255px; overflow:auto;">                         
                                              <table style="width:100%; margin-top:5px;">
                                                   <% if (ViewCoursesSubject != null && ViewCoursesSubject.Rows.Count > 0) %>
                                                   <% { %>
                                                   <%    for (int i = 0; i < ViewCoursesSubject.Rows.Count ;i++) %>
                                                   <%    { %>
                                                   <%      if (i%2 == 0)%>
                                                   <%      {%>
                                                             <tr>
                                                               <td colspan="2" style="width:10%">
                                                               </td>
                                                               <td colspan="2"  style="background-color:#99e699; color:#ff6666; font-weight:bold; text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">                                   
                                                                   <%:ViewCoursesSubject.Rows[i]["CourseName"] %>
                                                               </td>
                                                               <td colspan="6" style="background-color:#99e699; color:#ff6666; font-weight:bold; text-align:left; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">
                                                                   <a href="#" style="color:#ff6666; font-weight:bold;" onclick="setDiscussionPanal(this);"><%:ViewCoursesSubject.Rows[i]["SubjectName"] %></a>
                                                               </td>
                                                             </tr>
                                                  
                                                   <%      }%>
                                                   <%      else %>
                                                   <%      {%>
                                                             <tr>
                                                               <td colspan="2" style="width:10%">
                                                               </td>
                                                               <td colspan="2"  style="background-color:#c2f0c2; color:#ff6666; text-align:left; font-weight:bold; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">                                   
                                                                   <%:ViewCoursesSubject.Rows[i]["CourseName"] %>
                                                               </td>
                                                               <td colspan="6" style="background-color:#c2f0c2; color:#ff6666; text-align:left; font-weight:bold; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">
                                                                   <a href="#" style="color:#ff6666; font-weight:bold;" onclick="setDiscussionPanal(this);"><%:ViewCoursesSubject.Rows[i]["SubjectName"] %></a>
                                                               </td>
                                                             </tr>                                                                                                    
                                                   <%      }%>
                                                   <%    }%>
                                                   <% } %>
                                                  <tr>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                      <td style="width:10%">
                                                      </td>
                                                  </tr>
                                              </table>
                                          </div>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td colspan="3" style="width:10%;">
                                          <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button"  />                       
                                      </td>
                                      <td style="width:10%;">
                                          <%--<input id="btnLoadDiscussionChat" style="color:#ff6666;" onclick="postComment();" type="button" disabled="disabled" value="Load Discussion Chat" class ="button" />--%>
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                      <td style="width:10%">
                                      </td>
                                  </tr>
                              </table>
                          </div>
                      </td>
                      <td colspan="5" style="width:10%;">                         
                          <div id="divDiscussionPanal" style="width:100%; height:345px; overflow:auto;">                         

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
          </div>
            <asp:HiddenField ID="hiddenUserName" runat="server" />
        </div>
    </form>
</body>
</html>
