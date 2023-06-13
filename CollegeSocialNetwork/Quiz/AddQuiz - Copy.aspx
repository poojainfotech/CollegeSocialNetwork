<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuiz.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.AddQuiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
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
                progressbarLable1.text('Please select txt file only with proper question formate.');
                progressbarDiv1.fadeOut(3000);

                progressbarDiv1.fadeIn(1000);
                progressbarLable1.text('Please select txt file only with proper question formate.');
                progressbarDiv1.fadeOut(3000);
                myFileList.value = '';
                return false;
            }
        }

    </script>  
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server">
        <div>
            <div style="height:auto; width:90%; margin:auto;">
              <table style="height:auto; width:100%;">
                  <tr>
                      <td colspan="10" style="width:100%;height:30px;  background-color:#8A0808;  text-decoration:underline;">
                         <a href="../AdminUser/AdminHomePage.aspx" style="color:white; margin-left:10px;" >Home</a>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:100%; height:94px; color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                          <b style="margin-left:5%;">COLLEGE SOCIAL NETWORK</b>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:10%;">                         
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Upload Quiz</b>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:10%; height:40px;">                         
                          
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:10%;">                         
                          
                      </td>
                      <td style="width:10%; font-weight:bold; ">   
                          <asp:Button ID="btnUploadQuiz" runat="server" Text="Upload Quiz" OnClientClick="return selectFileToUpload();"  OnClick="btnUploadQuiz_Click" />
                      </td>
                      <td colspan="7" style="width:10%;">                         
                          <asp:FileUpload ID="fileUploadQuiz" onchange="readURL();" runat="server" />
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:10%; height:40px;">                         
                      </td>
                      <td colspan="8" style="width:10%; height:40px;">                         
                              <div id="lblMsgDetails" style="position:relative; height:30px;">
                                  <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>                         
                              </div>                        
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:10%;">                         

                      </td>
                      <td colspan="6" style="width:10%; height:40px;">                         
                          <div style="width:100%;">
                              <div id="progressbar" style="position:relative; height:30px; display:none;">
                                  <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;">Uploading...</span>
                               </div>

                           </div>
                          
                      </td>
                      <td colspan="2" style="width:10%;">                         

                      </td>
                  </tr>
                  <tr>
                      <td style="width:10%;">
                          <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" />                           
                      </td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                      <td style="width:10%;"></td>
                  </tr>
              </table>
          </div>
        </div>
    </form>
</body>
</html>
