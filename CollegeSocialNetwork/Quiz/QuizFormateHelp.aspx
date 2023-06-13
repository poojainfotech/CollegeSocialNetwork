<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuizFormateHelp.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.QuizFormateHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function closeWin() {
            window.close();
        }
    </script>
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Upload Help</b>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:5%;">                         

                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:50px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>Q. H.</b>
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
                      <td>                         

                      </td>
                  </tr>

                  <tr>
                      <td id="tdClose" onclick="closeWin();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer; text-decoration:underline; ">                         
                          <b>Close</b>
                      </td>
                      
                      <td colspan="9" style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td colspan="1" >

                      </td>
                      <td  colspan="9" style="width:5%; height:50px; font-weight:bold;">
                          <span style="font-family:Verdana; color:red;">You have to upload the question in txt file with given formate.</span>
                          <br />
                          <span style="font-family:fantasy; color:red;">Example : </span> QuizText:What is the name of subject.|Option1:CS|Option2:IOT|<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Option3:Asp .net|Option4:Java|SetAnswer:C|AcademicYear:2022|<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CourseName:BSCIT|SubjectName:CS                      




                          <br />
                          <span style="font-family:fantasy; color:red;">1 :</span> QuizText not more than 200 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">2 :</span> Option1 not more than 25 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">3 :</span> Option2 not more than 25 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">4 :</span> Option3 not more than 25 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">5 :</span> Option4 not more than 25 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">6 :</span> SetAnswer not more than 25 charater.

                          <br />
                          <span style="font-family:fantasy; color:red;">7 :</span> AcademicYear not more than 10 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">8 :</span> CourseName not more than 15 charater.
                          <br />
                          <span style="font-family:fantasy; color:red;">9 :</span> SubjectName not more than 25 charater.

                          <br />
                          <span style="font-family:fantasy; color:red;">7 :</span> Only 50 question allow at a time.
                          <br />
                          <br />
                          <br />
                          
                      </td>
                      
                  </tr>

                  <tr>
                      <td style="width:5%;">
                          
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
                      <td style="width:5%;">

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
