<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="CollegeSocialNetwork.Student.ViewStudents" %>

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
        
        /* width */
        ::-webkit-scrollbar {
          width: 10px;
          background-color: #ff9980!important;
        }

        /* Track */
        ::-webkit-scrollbar-track {
          background-color: #9fdf9f;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
          background:#ff9980;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
          background:#ff9980;
        }

        #boxes-list::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #ff9980;
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
                  background: #9fdf9f;
                  border:1px solid red;
                  color: #9fdf9f;
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px; font-weight:bold;">Student Details</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:3%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>S. D.</b>
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
                      <td colspan="10" style="height:5px; width:3%; " ></td>
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
                      <td colspan="10" style="width:10%;">
                          <div style="height:310px; color:white; width:100%; overflow:auto;">
                               <table id="tblUserDetails"  style="width:100%; margin:auto; font-family:Verdana; font-size:14px; " >
                                          <tr>
                                            <td colspan="16" style="width:100%; height:12px;">
                                            </td>
                                          </tr>
                                          <% if (ViewStudentData != null && ViewStudentData.Rows.Count > 0) %>
                                          <% { %>
                                          <tr style="background-color:#e0e0d1; font-size:13px;">
                                            <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">No.</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">User Name</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">First Name</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Last Name</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Email Address</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Mobile No.</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Premises</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Gender</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Pin No.</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">City</b>
                                            </td>
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">Country</b>
                                            </td>                                      
                                            <td style="width:3%;border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <b style=" white-space:nowrap; color:#ff9f80;">State</b>
                                            </td>
                                          </tr>
                                          <%    for (int i = 0; i < ViewStudentData.Rows.Count ;i++) %>
                                          <%    { %>
                                                     <% if (i % 2 == 0) %>
                                                     <% { %>
                                                    <tr style="background-color:#ebebe0; font-size:13px;">
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:i+1 %>&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["UserName"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["FirstName"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["LastName"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["EmailAddress"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["PhoneNumber"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["Premises"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["Gender"].ToString() == "1"?"Male":ViewStudentData.Rows[i]["Gender"].ToString() == "2"?"Female":"Other" %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["PinNo"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["City"] %></b>
                                                        </td>
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["Country"] %></b>
                                                        </td>                                      
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#99b3ff;"><%:ViewStudentData.Rows[i]["StateID"] %></b>
                                                        </td>
                                                    </tr>       
                                                     <% } %>
                                                     <% else %>
                                                     <% { %>
                                                     <tr style="background-color:#f5f5f0; font-size:13px;">
                                                        <td style="width:3%; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:i+1 %>&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["UserName"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["FirstName"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["LastName"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["EmailAddress"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["PhoneNumber"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["Premises"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["Gender"].ToString() == "1"?"Male":ViewStudentData.Rows[i]["Gender"].ToString() == "2"?"Female":"Other" %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["PinNo"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["City"] %></b>
                                                        </td>
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["Country"] %></b>
                                                        </td>                                      
                                                        <td style="width:3%;  border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                            <b style=" white-space:nowrap; color:#b3c6ff;"><%:ViewStudentData.Rows[i]["StateID"] %></b>
                                                        </td>
                                                    </tr>      
                                                     <% } %>
                                                   
                                             <% } %>
                                          <% } %>
                                          <% else %>
                                          <% { %>
                                               <tr>
                                                 <td colspan="1" style="width:5%;"></td>
                                                 <td colspan="14" style="width:20%;color:orangered;background-color:#f2ffe6; text-align:left; padding-left:3px;">
                                                    <b style=" white-space:nowrap; color:#99b3ff;">No record for student.</b>
                                                 </td>
                                                 <td colspan="1" style="width:5%;"></td>
                                              </tr>
                                          <% } %>                                    
                                          <tr>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
                                              <td></td>
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
                  <tr style="">
                        <td colspan="10" style="padding-left:1px;">
                            <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button" />                       
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
