<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="CollegeSocialNetwork.Faculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  rel="stylesheet"  type="text/css" href="../CSS/mainmenues.css"/>
    <script src="../JS/LogOff.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    
    <script type="text/javascript">  
        $(document).ready(function () {
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            var ulEmployees = $('#tblUserDetails');
            $.ajax({
                type: 'GET',
                url: rootUrl + '/api/hello',
                dataType: 'json',
                data: {
                    Name: document.getElementById('hiddenUserName').value
                },
                success: function (data) {            
                    ulEmployees.empty();
                    $.each(data, function (index, val) {
                        //var fullName = val.Name + ' - ' + val.Role + '<br />';
                        var fullName = '<tr><td style="color:#8cd98c;font-weight:bold;">' + val.Name.toUpperCase() +
                            '</td><td rowspan="2" >' +
                            '<img alt="No Image" style="color:#b3d1ff;" height="60" width="80" src="' + val.UserImage + '" />' +
                            '</td></tr><tr><td>' +
                            '<a href="../Profile/UserProfile.aspx?UserName=' + val.Name + '" style="color:#003d99;font-weight:bold;" target="_blank" >View Profile</a>' +
                            '</td></tr>'
                        ulEmployees.append(fullName)
                    });
                },
                error: function (xhr, status, error) {
                    ulEmployees.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                }
            });
        });
    </script>  
    <style>
        ::-webkit-scrollbar {
          width: 10px;
          background-color: #ccf2ff!important;
        }

        /* Track */
        ::-webkit-scrollbar-track {
          background-color: #ccf2ff;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
          background:#00ace6;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
          background:#00ace6;
        }
    </style>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID='ScriptManager1' runat='server' EnablePageMethods='true' />  
        <div>
          <div style="height:auto; color:white; width:90%; margin:auto;">
            <div style="height:100px;width:100%;background-image:url(../images/HomeImage/headerImage1.png);background-repeat:no-repeat;background-size:100% 100px;">
            </div>
            <div style="width:98%; padding-left:1%; padding-right:1%;  color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                <marquee>
                    <b id="tdCSN" style="margin-left:2%;">COLLEGE SOCIAL NETWORK</b>
                </marquee>
            </div>
            <div class="nav" style="width:100%;">
                <ul class="main-menu" style="width:auto;">
                    <li><a href="#" style="color:#e6e600; text-decoration:none;" >DASHBOARD</a></li>
                    <li>MONITOR
                        <ul class="sub-menu">
                            <li><a href="../Student/ViewStudents.aspx" style="color:white; text-decoration:none;" >View Students</a></li>
                            <li><a href="../Student/TimelineRecords.aspx" style="color:white; text-decoration:none;" >Timeline Records</a></li>
                            <li><a href="../Mail/Mail.aspx" style="color:white; text-decoration:none;" >Mail Center</a></li>
                        </ul>
                    </li>
                    <li><a href="../Discussion/Discussion.aspx" style="color:white; text-decoration:none;" >DISCUSSION</a></li>
                    <li style="width:160px">STUDY&nbsp;MATERIAL
                        <ul class="sub-menu">
                            <li><a href="../UploadFile/UploadStudyMaterial.aspx" style="color:white; text-decoration:none;" >Upload Study Material</a></li>
                            <li><a href="../UploadFile/ViewStudyMaterial.aspx" style="color:white; text-decoration:none;" >View Study Material</a></li>
                        </ul>
                    </li>
                    <li>QUIZ
                        <ul class="sub-menu">
                            <li><a href="../Quiz/AddQuiz.aspx" style="color:white; text-decoration:none;" >Upload Quiz</a></li>
                            <li><a href="../Quiz/ViewQuiz.aspx" style="color:white; text-decoration:none;" >View Quiz</a></li>
                            <li><a href="../Quiz/DeleteQuiz.aspx" style="color:white; text-decoration:none;" >Delete Quiz</a></li>
                            <li><a href="../Quiz/ViewQuizResult.aspx" style="color:white; text-decoration:none;" >View Result</a></li>
                        </ul>
                    </li>
                    <li>PROFILE
                            <ul class="sub-menu">
                            <li><a href="../Profile/UpdateProfile.aspx" style="color:white; text-decoration:none;" >Update Profile</a></li>
                            <li><a href="../ForgotPassword/ChangePassword.aspx" style="color:white; text-decoration:none;" >Change Password</a></li>
                            <li><a href="../Profile/SocialActivities.aspx" style="color:white; text-decoration:none;" >Social Activities</a></li>
                        </ul>
                    </li>
                    <li>SETTING
                        <ul class="sub-menu">
                            <li><a href="../Subject/AddSubject.aspx" style="color:white; text-decoration:none;" >Add Subject</a></li>
                            <li><a href="../Subject/ViewSubject.aspx" style="color:white; text-decoration:none;" >View Subject</a></li>
                            <li><a href="../Subject/DeleteSubject.aspx" style="color:white; text-decoration:none;" >Delete Subject</a></li>
                            <li><a href="../Course/AddCourse.aspx" style="color:white; text-decoration:none;" >Add Course</a></li>
                            <li><a href="../Course/ViewCourse.aspx" style="color:white; text-decoration:none;" >View Course</a></li>
                            <li><a href="../Course/DeleteCourse.aspx" style="color:white; text-decoration:none;" >Delete Course</a></li>
                        </ul>
                    </li>
                    <li><a href="#" id="logout" onclick='return logout(this)' style="color:white; text-decoration:none;" >LOGOUT</a></li>
                </ul>
            </div>
          </div>   

          <div style="height:370px; color:white;  width:90%; margin:auto;">
              <table style="width:100%; height:370px; border-collapse:collapse;">
                  <tr>
                      <td style="width:25%;">
                          <div style="width:100%; overflow:auto; height:100%;">
                              <div style="margin:10px; color:orangered; font-size:20px;">
                                 <b style="color:#007399;"><asp:Label ID="lblCurrentUser" runat="server"></asp:Label></b>
                                  <div id="divUserDetails" style="overflow:auto; height:300px;">
                                       <table id="tblUserDetails" style="font-size:14px;">
                                                                     
                                       </table>                         
                                  </div>
                              </div>
                          </div>
                      </td>
                      <td style="width:75%;">
                         <table style="width:100%; margin-top:-150px;">
                          <% if (ViewReceivedMail != null && ViewReceivedMail.Rows.Count > 0) %>
                          <% { %>
                          <%    for (int i = 0; i < ViewReceivedMail.Rows.Count ;i++) %>
                          <%    { %>
                                      <tr style="width:100%;">
                                        <td></td>
                                        <td style="padding-top:15px; border-top-left-radius: 10px;border-top-right-radius: 10px; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; padding-left:10px;">                                   
                                            <marquee behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
                                                       <a href="../Mail/Mail.aspx" style="text-decoration:from-font;font-weight:700;"><span style="width:10%;color:#ff4d4d;">You have recived </span><b style="width:10%;color:#ff4d4d;"><%:ViewReceivedMail.Rows.Count %></b><span style="width:10%;color:#ff4d4d;"> mail. </span></a>
                                            </marquee>
                                        </td>
                                      </tr>
                          <%    } %>
                          <% } %>
                          <tr>
                              <td colspan="2" style="color:#5c85d6; text-align:justify;padding:5px; font-weight:700; ">
                                  <span style="margin-left:35%; color:#003d99;">Welcome to the Dashboard.</span>
                                  <br />
                                  <br />
                                  The core function of College social network system is to facilitate and encourage knowledgesharing and knowledge 
                                  creation on College. Specifically, the core functions of College socialnetwork system are to support online 
                                  communication, sharing and collaboration in learning,teaching and research activities of College users. Knowledge 
                                  sharing and knowledge creationare closely related with and continuously influenced by each other. Because college 
                                  socialnetwork system provides direct support to knowledge sharing and indirect support toknowledge creationCollege 
                                  members such as students, faculty members are among the most active users of Internetservices, especially emerging 
                                  services including social networking services. As this socialnetworking site is confined to the college College 
                                  activities, it will increase the likelihood ofusage by the faculty members. This is the major advantage of this 
                                  project as it will promote thestudents and faculty alike to strengthen their educational communications and 
                                  collaborations.

                              </td>
                          </tr>
                         </table>

                      </td>
                  </tr>
              </table>
          </div>
          <div style="height:250px; color:white; background-color:#80d4ff;  width:90%; margin:auto;">
                  <table style="height:30px; background-color:#80d4ff; color:white; width:100%; margin:auto; ">
                  <tr>
                      <td style="width:5%;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                         <a href="#" style="color:white;" >About</a>
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                       
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                         
                          
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style=" text-align:right; width:70%;">
                          <asp:Label ID="lblCurrentDateTime" runat="server" Visible="false" Text=""></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                      </td>
                      <td colspan="7" style=" width:5%; color:#0059b3; text-align:justify;padding:5px; font-weight:700; ">
                              Patkar-Varde College is well-known in the western suburbs of Mumbai. Since its establishment in 1964, it has constantly worked at increasing the number of courses it offers students and bettering its infrastructure. The College has grown steadily over the last four decades and we have never turned away from challenges. In keeping with the spirit of learning and growing through criticism, we have set up high standards, working continuously towards advanced goals
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                       <a href="#" style="color:white;" >Contact</a>
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                       
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                         
                          
                      </td>
                      <td style="width:5%; text-decoration:underline;">
                      </td>
                      <td style=" text-align:right; width:70%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                      </td>
                      <td colspan="7" style=" width:5%; color:#0059b3; text-align:justify;padding:5px; font-weight:700; ">
                          <table>
                              <tr>
                                  <td>
                                     Email
                                  </td>
                                  <td>:
                                      collegeSoccialNetwork@gmail.com
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      Phone. No.
                                  </td>
                                  <td>: 
                                      +91-22-2872 3731 / 2872 1875(Office)
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      Addres
                                  </td>
                                  <td>:
                                      S. V. Road, Goregaon (West),Mumbai - 400062.
                                      +91-22-2872 3731 / 2872 1875(Office)
                                      
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                      &nbsp;&nbsp;info@patkarvardecollege.edu.in
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
              </table>
            <script>
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
