<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadStudyMaterial.aspx.cs" Inherits="CollegeSocialNetwork.UploadFile.UploadPDFfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function uploadStudyMaterial(msg) {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            progressbarDiv1.fadeIn(1000);
            progressbarDiv1.fadeOut(3000);
            progressbarDiv1.fadeIn(1000);
            progressbarLable1.text(msg);
            progressbarDiv1.fadeOut(3000);
        }

        function selectFileToUpload() {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            var myFileList = document.getElementById("fileUploadStudyMaterial");
            // loop through files property, using length to get number of files chosen
            for (var i = 0; i < myFileList.files.length; i++) {
                const fileExtentions1 = myFileList.files[i].name.split('.');
                if (fileExtentions1[1] != 'pdf') {
                    progressbarDiv1.fadeIn(1000);
                    progressbarDiv1.fadeOut(3000);
                    progressbarDiv1.fadeIn(1000);
                    progressbarLable1.text('Please select only pdf file.');
                    progressbarDiv1.fadeOut(3000);
                    myFileList.value = '';
                    return false;
                }
            }
        }

        function readURL() {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            var myFileList = document.getElementById("fileUploadStudyMaterial");
            // loop through files property, using length to get number of files chosen
            for (var i = 0; i < myFileList.files.length; i++) {
                const fileExtentions1 = myFileList.files[i].name.split('.');
                if (fileExtentions1[1] != 'pdf') {
                    progressbarDiv1.fadeIn(1000);
                    progressbarDiv1.fadeOut(3000);
                    progressbarDiv1.fadeIn(1000);
                    progressbarLable1.text('Please select only pdf file.');
                    progressbarDiv1.fadeOut(3000);
                    myFileList.value = '';
                    return false;
                }
            }
        }
    </script>
    <style>
        ::-webkit-file-upload-button {
                  background: black;
                  border:1px solid red;
                  color: red;
                  height:25px;
                  font-family:fantasy;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

        .dropDownList{
            background:black;
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px; font-weight:bold;">Upload Study Material</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>U. S. M.</b>
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
                      <td style="width:10%; height:20px;">                         
                         
                      </td>
                      <td style="width:10%;color:orangered;font-weight:bold; font-family:fantasy;">
                          Study Material
                      </td>
                      <td style="width:10%;">
                          <asp:FileUpload ID="fileUploadStudyMaterial" runat="server" onchange="readURL();" ForeColor="Red" />                  
                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td style="width:10%;">

                      </td>
                      <td  colspan="4" style="width:10%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:10%;">

                      </td>

                      <td style="width:10%;">
                          <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button" />                       
                      </td>
                      <td  colspan="8" style="width:10%;">
                          <asp:Button ID="btnUploadPDFfile" ForeColor="#ff6666" runat="server" Text="Upload File" OnClientClick="return selectFileToUpload();" OnClick="btnUploadPDFfile_Click" CssClass="button" />                       
                      </td>
                  </tr>
                  <tr>
                      <td colspan="1" style="width:10%; height:40px;">                         

                      </td>
                      <td colspan="8" style="width:10%;">                         
                          <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>       
                          <div id="progressbar" style="position:relative; height:30px; display:none; ">
                            <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy;  top:20%; "></span>
                          </div>
                      </td>
                      <td colspan="1" style="width:10%; height:40px;">                         

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
        </div>
    </form>
</body>
</html>
