<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSocialCommentHistory.aspx.cs" Inherits="CollegeSocialNetwork.Profile.UserSocialCommentHistory" %>

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
    <style>
/* width */
        ::-webkit-scrollbar {
          width: 10px;
          background-color: #F5F5F5!important;
        }

        /* Track */
        ::-webkit-scrollbar-track {
          background-color: #ffb3b3;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
          background:#ff8080;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
          background:#ff8080;
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
                      <td colspan="10" style="padding-left:2%; padding-right:2%; width:98%; height:50px; color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                          <marquee>
                              <b id="tdCSN" style="margin-left:2%;">COLLEGE SOCIAL NETWORK</b>
                          </marquee>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:10%;">                         
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">User Social Comment History</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>C. H.</b>
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
                      <td colspan="10">
                          <div  id="boxes-list" style="width:95.2%; height:300px; overflow:auto;">
                            <table style=" width:92.0%; margin-left:7.5%; border-collapse:collapse; ">
                              <% if (ViewUserSocialCommentHistory != null && ViewUserSocialCommentHistory.Rows.Count > 0) %>
                              <% { %>
                              <%    for (int i = 0; i < ViewUserSocialCommentHistory.Rows.Count ;i++) %>
                              <%    { %>
                              <%        int rowNumber = i % 2; %>
                              <%        if (rowNumber == 0) %>
                              <%        { %>
                                            <tr style=" background-color:#99ddff;">    
                                                <td style="text-align:right; font-family:fantasy; color:#b36b00;">                         
                                                    <%:i+1 %>&nbsp;&nbsp;
                                                </td>
                                                <td colspan="4" style="color:#0044cc; font-weight:bold; font-family:fantasy;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["UserName"] %>
                                                </td>
                                                <td colspan="5" style="">
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#99ddff;">    
                                                <td colspan="1" style="text-align:right;">                         
                                                 
                                                </td>
                                                <td colspan="4" style="color:#666699; font-weight:bold;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["Comment"] %>
                                                </td>
                                                <td colspan="5" style="text-align:right;">                         
                                                    
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#99ddff;">    
                                                <td colspan="1" style="text-align:right;">                         
                                                 
                                                </td>
                                                <td colspan="4" style=" font-weight:bold; color:#ff1a66;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["CommentDateTime"] %>
                                                </td>
                                                <td colspan="5" style="text-align:right;">                         
                                                    
                                                </td>
                                            </tr>
                              <%        }%>
                              <%        else%>
                              <%        { %>
                                            <tr style=" background-color:#cceeff;">    
                                                <td colspan="5" style="text-align:right;">                         
                                                    
                                                </td>
                                                <td style="text-align:right; font-family:fantasy; color:#ff9900;">                         
                                                    <%:i+1 %>&nbsp;&nbsp;
                                                </td>
                                                <td colspan="4" style="color:#0044cc; font-weight:bold; font-family:fantasy;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["UserName"] %>
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#cceeff;">    
                                                <td colspan="5" style="text-align:right;">                         
                                                    
                                                </td>
                                                <td colspan="1" style="text-align:right;">                         
                                                 
                                                </td>
                                                <td colspan="4" style="color:#ff6633; font-weight:bold;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["Comment"] %>
                                                </td>
                                            </tr>
                                            <tr style=" background-color:#cceeff;">    
                                                <td colspan="5" style="text-align:right;">                         
                                                    
                                                </td>
                                                <td colspan="1" style="text-align:right; ">                         
                                                 
                                                </td>
                                                <td colspan="4" style="color:#53c653; font-weight:bold;">
                                                    <%:ViewUserSocialCommentHistory.Rows[i]["CommentDateTime"] %>
                                                </td>
                                            </tr>
                              <%        }%>
                                 <% } %>
                              <% } %>
                              <% else %>
                              <% { %>
                                      <tr style=" background-color:darkgray;">                                        
                                        <td colspan="10" style=" text-align:center;">
                                           No Comment History.
                                        </td>
                                     </tr>

                              <% } %>
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
                            </table>
                          </div>
                      </td>
                  </tr>

                  <tr>
                      <td style="width:7%; height:10px;">                         
                         
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
                      <td colspan="10" style="width:10%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width:10%;">                         

                      </td>
                      <td colspan="8" style="width:10%;">                         
                          <asp:Label ID="lblMsg" runat="server" Text="" Visible="false"></asp:Label>                         
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
