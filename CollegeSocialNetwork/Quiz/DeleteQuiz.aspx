<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteQuiz.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.DeleteQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function countCheckedCheckbox() {
            document.getElementById('hdnIdToDelete').value = '';
            $("input[type='checkbox']").each(function () {
                var value = $(this).attr('value'); // grab value of original
                var ischecked = $(this).is(":checked"); //check if checked
                if (ischecked) {
                    document.getElementById('hdnIdToDelete').value = document.getElementById('hdnIdToDelete').value + ',' + value;
                }
            });
        }

        $(document).ready(function () {
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            var tdQuizDetails = $('#tblQuizDetails');
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/QuizDetails',
                dataType: 'json',
                success: function (data) {
                    if (data == '') {
                        tdQuizDetails.empty();
                        var quizDetails =
                        '<tr>' +
                            '<td style="width:1%; text-align:left;padding-left:50px;">' +
                               '<b>No Quiz added.</b>' +
                            '</td>' +
                            '</tr>'
                        tdQuizDetails.append(quizDetails)
                    }
                    else {
                        tdQuizDetails.empty();
                        var varBgColor = '';
                        var Count = 0;
                        $.each(data, function (index, val) {
                            Count = Count + 1;
                            if (Count % 2 == 0) {
                                varBgColor = '#e6f7ff';
                            }
                            else {
                                varBgColor = '#b3e6ff';
                            }

                            var quizDetails =
                                '<tr style="">' +
                                '<td style="width:1.18%; text-align:right;border-bottom-left-radius:19px;">' +
                                '</td>' +
                                '<td style="width:1%;background-color:' + varBgColor + ';border-bottom-left-radius:19px;">' +
                                '<input type="checkbox" id="' + val.QuizID + '" value="' + val.QuizID + '" />' +
                                '<b>Quiz Text : </b>' +
                                '</td>' +
                                '<td style="width:10%;background-color:' + varBgColor + ';border-top-right-radius:19px;">' +
                                val.QuizText +
                                '</td>'
                            '</tr>' +
                                '<tr>' +
                                '<td style="width:1.18%; height:50px;">' +
                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '<td style="width:10%;">' +

                                '</td>' +
                                '</tr>'
                            tdQuizDetails.append(quizDetails)
                        });
                    }
                },
                error: function (xhr, status, error) {
                    tdQuizDetails.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        });


        function deleteQuizSuccessfully() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
            progressbarLable.text('Quiz deleted successfully..');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
        }

        function deleteQuizFailed() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
            progressbarLable.text('Quiz not deleted successfully.');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
        }

        function deleteQuizNotSelected() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
            progressbarLable.text('Input field is not valid. Please select quiz for delete.');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(2000);
        }
    </script>  
    <style>
        #boxes-list::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #FFCC00;
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
        
        .button {
                  background: black;
                  border:1px solid red;
                  color: red;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

     </style>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server" style="margin:0px; padding:0px;">
        <div style="margin:0px; padding:0px;">
            <div style="height:auto; width:90%; margin:auto; padding:0px;">
              <table  style="height:auto; width:100%;margin:0px; padding:0px;">
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Delete Quiz</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>D. Q.</b>
                      </td>

                      <td id="tdHeaderImage" colspan="9" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1007px 65px;">
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
                      <td colspan="10" style="width:100%;">                         
                         <div  id="boxes-list" style="width:98.0%; height:300px; overflow:auto;">
                             <table  id="tblQuizDetails">
                                 
                             </table>
                         </div>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:10%; height:10px;">                         
                          <asp:HiddenField ID="hdnIdToDelete" runat="server" />  
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
                  <tr>
                      <td colspan="1" style="width:10%;">
                          <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" class="button" />                       
                      </td>
                      <td colspan="9" style="width:10%;">
                          <asp:Button ID="btnDelete" ForeColor="#ff6666" runat="server" Text="Delete" OnClientClick="countCheckedCheckbox()" OnClick="btnDelete_Click" class="button" />                       
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:10%; height:0px;">                         
                          <%--<asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>                         --%>
                          <div style="width:100%;">
                              <div id="progressbar" style="position:relative; height:25px; display:none;">
                                        <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;"></span>
                              </div>
                          </div>
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
        </div>
    </form>
</body>
</html>
