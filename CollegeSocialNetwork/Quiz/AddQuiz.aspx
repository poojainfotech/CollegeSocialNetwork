<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuiz.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.AddQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function closeWin() {
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            window.location.href = rootUrl + '/AdminUser/AdminHomePage.aspx';
        }

        function helpWin() {
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            newwindow = window.open(rootUrl + '/Quiz/QuizFormateHelp.aspx', 'name', 'height=500,width=850');
            if (window.focus) { newwindow.focus() }
            return false;
        }

        function changeColoronmousemove(elementItem) {
            document.getElementById(elementItem.id).style.backgroundColor = '#ffebe6';
            document.getElementById(elementItem.id).style.color = 'red';
            $('#' + elementItem.id).fadeIn(250);
        }

        function changeColoronmouseout(elementItem) {
            document.getElementById(elementItem.id).style.backgroundColor = 'aquamarine';
            document.getElementById(elementItem.id).style.color = '#00b300';
        }

        function fileUploadStatus(statusOfFileUpload) {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            if (statusOfFileUpload) {
                progressbarDiv.fadeIn(1000);
                progressbarLable.text('Uploading Process Started.');
                progressbarDiv.fadeOut(3000);

                progressbarDiv.fadeIn(1000);
                progressbarLable.text('Uploading Process completed.');
                progressbarDiv.fadeOut(3000);
            }
            else {
                progressbarDiv.fadeIn(1000);
                progressbarLable.text('Uploading Process not completed.');
                progressbarDiv.fadeOut(3000);
            }
        }

        function fileFormate() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarDiv.fadeIn(1000);
            progressbarLable.text('Uploaded file is not in correct formate, some question is invalid, please check and upload again.');
            progressbarDiv.fadeOut(3000);
        }

        function recordInfile() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarLable.text('Only 50 questions are allow, please check and upload again.');
        }

        function readURL() {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            var myFileList = document.getElementById("fileUploadQuiz");
            // loop through files property, using length to get number of files chosen
            for (var i = 0; i < myFileList.files.length; i++) {
                const fileExtentions1 = myFileList.files[i].name.split('.');
                if (fileExtentions1[1] != 'txt') {
                    progressbarDiv1.fadeIn(1000);
                    progressbarLable1.text('Please select txt file only with proper question formate.');
                    progressbarDiv1.fadeOut(3000);

                    progressbarDiv1.fadeIn(1000);
                    progressbarLable1.text('Please select txt file only with proper question formate.');
                    progressbarDiv1.fadeOut(3000);
                    myFileList.value = '';
                    return false;
                }
            }
        }

        function selectFileToUpload() {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            var myFileList = document.getElementById("fileUploadQuiz");
            // loop through files property, using length to get number of files chosen
            if (myFileList.value == '') {
                progressbarDiv1.fadeIn(1000);
                progressbarDiv1.fadeOut(3000);
                progressbarDiv1.fadeIn(1000);
                progressbarLable1.text('Please select txt file only with proper question formate.');
                progressbarDiv1.fadeOut(3000);
                myFileList.value = '';
                return false;
            }
        }
    </script>

    <style>
        .bg-imgs img 
        {
          position: absolute;
          z-index: -1;
          height: 5%;
          opacity: 0%;
          transition-delay: 5s;
          transition: opacity 5s;
        }

        ::-webkit-file-upload-button {
                  background: black;
                  border:1px solid red;
                  color: red;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
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
        .cssTextarea{
            background: #b3d9ff;
                  border:1px solid #4da6ff;
                  color: #000080;
                  height:25px;
                  font-weight:bold;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
                  
        }


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
    </style>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server" style="margin:0px; padding:0px;">
        <div style="margin:0px; padding:0px;">
            <div style="height:auto; width:90%; margin:auto; padding:0px;">
              <table style="height:auto; width:100%;margin:0px; padding:0px;">
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Upload Quiz</b>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:5%;">                         

                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:50px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>U. Q.</b>
                      </td>

                      <td id="tdHeaderImage" colspan="8" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1007px 65px;">
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
                      <td style="height:50px; width:4%; background: lightblue;border-radius: 50%;font-size:10px; background-image:url(../images/UserImage/User1.jpg);background-repeat:no-repeat;background-size:65px 65px; border-color:aquamarine;cursor:pointer;">                         

                      </td>
                  </tr>

                  <tr>
                      <td id="tdClose" onclick="closeWin();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer; text-decoration:underline; ">                         
                          <b>Back</b>
                      </td>
                      
                      <td colspan="9" style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td id="tdHelp" onclick="helpWin();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer;text-decoration:underline;">                         
                          <b>Help</b>
                      </td>
                      
                      <td colspan="9" style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td  colspan="10" style="width:5%; height:50px; ">
                       
                      </td>
                  </tr>
                  <tr>
                      <td  colspan="2" style="width:5%;">
                          
                      </td>
                      <td style="width:10%; color:orange; font-weight:bold;  font-family:fantasy;">
                          Select Quiz File :
                      </td>
                      <td colspan="2" style="width:10%;">
                          <asp:FileUpload ID="fileUploadQuiz" onchange="readURL();" ForeColor="#ffcc99"  Font-Bold="true" runat="server" />
                      </td>
                      <td style="width:5%; color:orange; font-weight:bold; font-family:fantasy;">

                      </td>
                      <td colspan="4" style="width:10%;">

                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:5%;">
                          
                      </td>
                      <td colspan="4" style="width:10%;">
                          <asp:Button ID="btnUploadQuiz" runat="server" Text="Upload Quiz" OnClientClick="return selectFileToUpload();"  OnClick="btnUploadQuiz_Click" class="button" />
                      </td>
                      <td colspan="2" style="width:10%;">
                          
                      </td>
                      <td style="width:10%;">
                          
                      </td>
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">
                          <asp:Button ID="btnBackToHome" ForeColor="#ff6666" class="button" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" />                           
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
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td  colspan="10" style="width:5%; height:50px; ">
                          <div style="width:100%;">
                              <div id="progressbar" style="position:relative; height:30px; display:none;">
                                  <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;">Uploading quiz...</span>
                              </div>
                              <div id="lblMsgDetails" style="position:relative; height:30px;">
                                  <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>                         
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
              <asp:HiddenField ID="hiddenUserName" runat="server" />
              <asp:HiddenField ID="hiddenSenderEmailAddress" runat="server" />
        </div>
    </form>
</body>
</html>
