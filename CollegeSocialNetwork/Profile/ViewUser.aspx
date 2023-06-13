<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="CollegeSocialNetwork.Profile.ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function ViewUserProfileIputField(userSearch) {
            $(document).ready(function () {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                var ulEmployees = $('#tblUserDetails');
                var progressbarDiv = $('#progressbar');
                var progressbarLable = $('#progressbar-label');
                if (document.getElementById('txtUserName').value == '') {
                    alert('Please enter user name.');
                } else {
                    $.ajax({
                        type: 'GET',
                        url: rootUrl + '/api/hello/GetUserProfileInfo',
                        data: { userName: document.getElementById('txtUserName').value },
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success: function (data) {
                            if (data.length == 0) {
                                ulEmployees.empty();
                                //document.getElementById('lblUserotFound').innerHTML = '<b>User Not Found</b>';
                                
                                progressbarDiv.fadeIn(1000);
                                progressbarDiv.fadeOut(3000);
                                progressbarDiv.fadeIn(1000);
                                progressbarDiv.fadeOut(3000);
                                progressbarLable.text('Oops!, User Not Found.');
                            }
                            else {
                                ulEmployees.empty();
                                //document.getElementById('lblUserotFound').innerHTML = '';
                                $.each(data, function (index, val) {
                                    progressbarDiv.fadeIn(1000);
                                    progressbarDiv.fadeOut(3000);
                                    progressbarDiv.fadeIn(1000);
                                    progressbarDiv.fadeOut(3000);
                                    progressbarLable.text('Greate! User Found.');

                                    var fullName = '<tr>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'User Type' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="UserName" style="color:#5c8a8a;">' + val.Role + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%;; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'College Code' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="CollegeCode" style="color:#5c8a8a;">' + val.CollegeCode + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'User Name' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="UserName" style="color:#5c8a8a;">' + val.UserName + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'Course' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="Course" style="color:#5c8a8a;">' + val.Course + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'User First Name' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="FirstName" style="color:#5c8a8a;">' + val.FirstName + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#99ddff;">' +
                                        '' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        '<label id="UserName"></label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'User Middle Name' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="ModdleName" style="color:#5c8a8a;">' + val.ModdleName + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'Pin No' +
                                        '</td>' +
                                        '<td style="width:35%;  background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="PinNo" style="color:#5c8a8a;">' + val.PinNo + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'User Last Name ' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="LastName" style="color:#5c8a8a;">' + val.LastName + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'Premises' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="Premises" style="color:#5c8a8a;">' + val.Premises + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%;;  background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'Gender' +
                                        '</td>' +
                                        '<td style="width:35%;  background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="Gender" style="color:#5c8a8a;">' + val.Gender + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'Email Address' +
                                        '</td>' +
                                        '<td style="width:35%;  background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="EmailAddress" style="color:#5c8a8a;">' + val.EmailAddress + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'Parent Name' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="ParentName" style="color:#5c8a8a;">' + val.ParentName + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'Date of birth' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="DOB"  style="color:#5c8a8a;">' + val.DOB + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'City' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="UserName"  style="color:#5c8a8a;">' + val.City + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#cceeff;color:#0077b3; font-weight:bold;">' +
                                        'State' +
                                        '</td>' +
                                        '<td style="width:35%;  background-color:#cceeff;">' +
                                        '<span style="background-color:#cceeff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="StateID"  style="color:#5c8a8a;">' + val.StateID + '</label>' +
                                        '</td>' +
                                        '</tr>' +
                                        '<tr>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'Country' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="Country"  style="color:#5c8a8a;">' + val.Country + '</label>' +
                                        '</td>' +
                                        '<td style="width:15%; background-color:#99ddff;color:#0077b3; font-weight:bold;">' +
                                        'Phone' +
                                        '</td>' +
                                        '<td style="width:35%; background-color:#99ddff;">' +
                                        '<span style="background-color:#99ddff;color:#0077b3; font-weight:bold;">:</span>&nbsp;&nbsp' +
                                        '<label id="PhoneNumber"  style="color:#5c8a8a;">' + val.PhoneNumber + '</label>' +
                                        '</td>' +
                                        '</tr>'
                                    ulEmployees.append(fullName);
                                });
                            }
                        },
                        error: function (xhr, status, error) {
                            ulEmployees.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                        }
                    });
                }
            });

        }
        function ClearData() {
            document.getElementById('tblUserDetails').innerHTML = '';
            document.getElementById('txtUserName').value = '';
            return false;
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">View User Profile</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>V. U. P.</b>
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
                      <td style="width:10%;"></td>
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
                  <tr>
                      <td colspan="1" style="width:13%;">
                          <asp:Button ID="Button2" ForeColor="#ff6666" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button" />                       
                      </td>
                      <td colspan="2" style="width:13%;">
                          <b style="color:#009900; text-align:left; font-family:fantasy; font-size:20px;">Enter User Name</b>
                      </td>
                      <td colspan="3" style="width:30%;">
                          <input id="txtUserName" alt="Please enter username" type="text" />
                          <input id="Button1" type="button" value="View User Profile" onclick="ViewUserProfileIputField(document.getElementById('tblUserInformatio'));" style="color:#FF6666;" class="button" />
                      </td>
                      <td colspan="3" style="width:30%;">
                          
                      </td>
                      <td colspan="1" id="lblUserotFound">
                      </td>
                  </tr>

                  <tr>
                      <td colspan="1" style="height:36px;">
                          <input id="btnClear" type="submit" value="Clear" onclick="return ClearData();" class="button"/>
                      </td>
                      <td colspan="9">
                          <div id="progressbar" style="position:relative; height:35px; display:none;">
                               <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;"></span>
                          </div>
                      </td>
                  </tr>

                  <tr>
                      <td></td>
                      <td colspan="9" rowspan="15">
                          <div style="width:100%; overflow:auto; height:315px;" >
                            <table id="tblUserDetails" style="width:100%;height:315px;  margin:auto; font-family:Verdana; font-size:14px; border-collapse:collapse;">
                                 
                            </table>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
                  </tr>
                  <tr>
                      <td></td>
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
