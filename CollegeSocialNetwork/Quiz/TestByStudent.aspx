<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestByStudent.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.TestByStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">  
        function saveValue(QuestionNumber, element, num) {
            let sliceFirst = document.getElementById('HiddenQuestionAnswerDetails').value.slice(0, document.getElementById('HiddenQuestionAnswerDetails').value.indexOf(QuestionNumber + ":"));
            let sliceSecound = '';
            if (QuestionNumber < 10) {
                sliceSecound = document.getElementById('HiddenQuestionAnswerDetails').value.slice(document.getElementById('HiddenQuestionAnswerDetails').value.indexOf(QuestionNumber + ":") + 3, document.getElementById('HiddenQuestionAnswerDetails').value.length);
            }
            else {
                sliceSecound = document.getElementById('HiddenQuestionAnswerDetails').value.slice(document.getElementById('HiddenQuestionAnswerDetails').value.indexOf(QuestionNumber + ":") + 4, document.getElementById('HiddenQuestionAnswerDetails').value.length);
            }
            
            //alert(sliceSecound);
            let elementIds = '';
            if (element.id.substring(8, 9) == 'A' || element.id.substring(8, 9) == 'B' || element.id.substring(8, 9) == 'C' || element.id.substring(8, 9) == 'D') {
                elementIds = ['CheckboxA', 'CheckboxB', 'CheckboxC', 'CheckboxD'];
            }
            else {
                elementIds = ['CheckboxE', 'CheckboxF', 'CheckboxG', 'CheckboxH'];
            }

            //Set the selected option
            for (var i = 0; i < elementIds.length; i++) {
                if (elementIds[i] + num == element.id) {
                    document.getElementById(elementIds[i] + num).checked = true;
                    document.getElementById('HiddenQuestionAnswerDetails').value = sliceFirst + QuestionNumber + ':' + i + sliceSecound
                }
                else {
                    document.getElementById(elementIds[i] + num).checked = false;
                }
            }
            //alert(document.getElementById('HiddenQuestionAnswerDetails').value);
        }

        function save() {
            $(document).ready(function () {
                    var progressbarLable = $('#progressbar-label');
                    var formData = new FormData();
                    formData.append('txtChat', document.getElementById('txtChat').value);
                    formData.append('hiddenUserName', document.getElementById('hiddenUserName').value);
                    progressbarDiv.fadeIn(1000);
                    progressbarDiv.fadeOut(2000);
                    progressbarLable.text('');
                    progressbarDiv.fadeIn(1000);
                    progressbarDiv.fadeOut(2000);
                    //formData.append(uploadImagefile[j].name + '/image', uploadImagefile[j]);
                    $.ajax({
                        url: 'GenericsHandlers/UploadHandler.ashx',
                        method: 'post',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function () {
                            progressbarLable.text('Test Completed.');
                            progressbarDiv.fadeOut(3000);
                            getUserProfileData();
                        },
                        error: function (err) {
                            alert(err.statusText)

                        }
                    });
                    progressbarLable.text('Process in progress ...');
                    progressbarDiv.fadeIn(3000);
            });
        }

        function testByStudentUser(msg) {
            var progressbarDiv1 = $('#progressbar');
            var progressbarLable1 = $('#progressbar-label');
            progressbarDiv1.fadeIn(1000);
            progressbarDiv1.fadeOut(3000);
            progressbarDiv1.fadeIn(1000);
            progressbarLable1.text(msg);
            progressbarDiv1.fadeOut(3000);
            return false;
        }

        function checkSlidePrevious() {
            if (document.getElementById('HiddenSlideCount').value == '1') {
                return false;
            }
            else {
                document.getElementById('HiddenSlideCount').value = parseInt(document.getElementById('HiddenSlideCount').value) - 1;
            }
        }

        function checkSlideNext() {
            if (document.getElementById('HiddenSlideCount').value == '5') {
                return false;
            }
            else {
                document.getElementById('HiddenSlideCount').value = parseInt(document.getElementById('HiddenSlideCount').value) + 1;
            }
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Attempt Test</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>A. T.</b>
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
                      <td colspan="10" style="width:10%;">                         
                          
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:10%;">                         

                      </td>
                      <td colspan="8" style="width:10%;">                         
                          <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>     
                          <div id="progressbar" style="position:relative; height:25px; display:none; ">
                              <span id="progressbar-label" style="position:absolute; color:#00aaff; font-family:fantasy; left:20%; top:20%; "></span>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10">
                          <div  id="boxes-list" style="width:100%; height:384px; overflow:auto;">
                            <table style=" width:87.8%; margin-left:8.3%; font-size:13.5px; border-collapse:collapse; ">
                              <%  string[] statusOfSelectedQuestionSet = HiddenQuestionAnswerDetails.Value.Split('|'); %>
                              <%  string[] questionAnswerCollection = new string[2];%>
                              <% if (ViewQuizData != null && ViewQuizData.Rows.Count > 0) %>
                              <% { %>
                              <%    for (int i = 0; i < ViewQuizData.Rows.Count ;i++) %>
                              <%    { %>
                                          <%  for (int j = 0; j < statusOfSelectedQuestionSet.Length; j++) %>
                                          <%  { %>
                                          <%    questionAnswerCollection = statusOfSelectedQuestionSet[j].Split(':'); %>
                                          <%    if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString()) %>
                                          <%    { %>
                                          <%     break; %>           
                                          <%    } %>
                                          <%  } %>
                                  <%    int rowNumber = i % 2; %>
                                  <%    if (rowNumber == 0) %>
                                  <%    { %>
                                            <tr style=" background-color:#99ddff; font-weight:bold;">    
                                                <td colspan="1" style="width:10%; text-align:right;">                         
                                                    <%:ViewQuizData.Rows[i]["QuizID"] %>&nbsp;&nbsp;
                                                </td>
                                                <td colspan="8" style="width:10%; font-weight:bold;">
                                                    <%:ViewQuizData.Rows[i]["QuizText"] %>
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#99ddff; font-weight:bold;">    
                                                <td style="width:10%;">
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "0") %>
                                                    <%  { %>
                                                           <input id="CheckboxA<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" />   <span id="spanA<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption1"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxA<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" />   <span id="spanA<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption1"] %> </span>
                                                    <%  } %>
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "1") %>
                                                    <%  { %>
                                                           <input id="CheckboxB<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanB<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption2"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxB<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanB<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption2"] %> </span>
                                                    <%  } %>
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "2") %>
                                                    <%  { %>
                                                           <input id="CheckboxC<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanC<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption3"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxC<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanC<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption3"] %> </span>
                                                    <%  } %>
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "3") %>
                                                    <%  { %>
                                                           <input id="CheckboxD<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanD<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption4"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxD<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanD<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption4"] %> </span>
                                                    <%  } %>
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
                                  <%    }%>
                                  <%    else%>
                                  <%    { %>
                                            <tr style=" background-color:#cceeff;">    
                                                <td colspan="1" style="width:10%; font-weight:bold; text-align:right;">                         
                                                    <%:ViewQuizData.Rows[i]["QuizID"] %>&nbsp;&nbsp;
                                                </td>
                                                <td colspan="8" style="width:10%; font-weight:bold;">
                                                    <%:ViewQuizData.Rows[i]["QuizText"] %>
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#cceeff; font-weight:bold;">    

                                                <td style="width:10%;">
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "0") %>
                                                    <%  { %>
                                                           <input id="CheckboxE<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanE<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption1"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxE<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanE<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption1"] %> </span>
                                                    <%  } %>
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "1") %>
                                                    <%  { %>
                                                           <input id="CheckboxF<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanF<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption2"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxF<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanF<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption2"] %> </span>
                                                    <%  } %>
                                                    
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "2") %>
                                                    <%  { %>
                                                           <input id="CheckboxG<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanG<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption3"] %> </span>
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxG<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanG<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption3"] %> </span>
                                                    <%  } %>
                                                    
                                                </td>
                                                <td style="width:10%;">
                                                    <%  if (questionAnswerCollection[0] == ViewQuizData.Rows[i]["QuizID"].ToString() && questionAnswerCollection[1] == "3") %>
                                                    <%  { %>
                                                           <input id="CheckboxH<%:i+1 %>" checked="checked" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanH<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption4"] %> </span>                                                    
                                                    <%  } %>
                                                    <%  else %>
                                                    <%  { %>
                                                           <input id="CheckboxH<%:i+1 %>" onclick="saveValue('<%:ViewQuizData.Rows[i]["QuizID"] %>',this,<%:i+1 %>)" type="checkbox" /> <span id="spanH<%:i+1 %>" style=" color:#003399;"> <%:ViewQuizData.Rows[i]["QuizOption4"] %> </span>                                                                                                        
                                                    <%  } %>
                                                    
                                                </td>
                                                <td style="width:10%;">
                                                    <input id="Hidden<%:i+1 %>" type="hidden" />
                                                </td>
                                                <td style="width:10%;">

                                                </td>
                                                <td style="width:10%;">

                                                </td>
                                                <td style="width:10%;">

                                                </td>
                                            </tr>                              
                                  <%    }%>
                                 <% } %>
                              <% } %>
                              <% else %>
                              <% { %>
                                      <tr style=" background-color:darkgray;">
                                        <td colspan="1" style="text-align:right;">
                      
                                        </td>
                                        <td colspan="9" style="padding-left:3px;">
                                           Quiz not added.
                                        </td>
                                     </tr>

                              <% } %>
                            </table>
                          </div>
                      </td>
                  </tr>

                  <tr>
                      <td style="width:7%; height:10px;">                         
                         <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" class="button" OnClick="btnBackToHome_Click" />                       
                      </td>
                      <td style="width:10%; text-align:right;">
                          <asp:Button ID="btnPrevious" ForeColor="#ff6666" runat="server" Text="<< Previous" class="button"  OnClientClick="return checkSlidePrevious();" OnClick="btnPrevious_Click" />                       
                      </td>
                      <td style="width:10%; text-align:right;">
                          <asp:Button ID="btnNext" ForeColor="#ff6666" runat="server" Text="Next >>" class="button"  OnClientClick="return checkSlideNext();" OnClick="btnNext_Click" />                            
                      </td>
                      <td style="width:10%; text-align:right;">
                          <asp:Button ID="btnSubmit" ForeColor="#ff6666" runat="server" Text="Save" class="button" OnClick="btnSave_Click" />  
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
            <asp:HiddenField ID="hiddenPreviousCount" runat="server" />
            <asp:HiddenField ID="HiddenNextCount" runat="server" />
            <asp:HiddenField ID="HiddenSlideCount" runat="server" Value="1" />
            <asp:HiddenField ID="HiddenQuestionAnswerDetails" runat="server" Value="1:N|2:N|3:N|4:N|5:N|6:N|7:N|8:N|9:N|10:N|11:N|12:N|13:N|14:N|15:N|16:N|17:N|18:N|19:N|20:N|21:N|22:N|23:N|24:N|25:N|26:N|27:N|28:N|29:N|30:N|31:N|32:N|33:N|34:N|35:N|36:N|37:N|38:N|39:N|40:N|41:N|42:N|43:N|44:N|45:N|46:N|47:N|48:N|49:N|50:N" />
        </div>
    </form>
</body>
</html>
