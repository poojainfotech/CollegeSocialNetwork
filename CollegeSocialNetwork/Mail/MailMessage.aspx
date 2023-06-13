﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailMessage.aspx.cs" Inherits="CollegeSocialNetwork.Mail.MailMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function closePopupWindow() {
            window.close();
        }
    </script>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server">
        <div>
            <div style="height:auto; width:90%; margin:auto;">
              <table style="height:100px; color:white; width:100%;">
                  <tr style="height:30px; background-color:#8A0808;"">
                      <td colspan="10" style="width:3%; text-decoration:underline;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:100%; color:orangered; text-align:left; font-family:fantasy; font-size:50px; height:94px;">
                          <b style="margin-left:5%;">COLLEGE SOCIAL NETWORK</b>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <div style="height:270px; width:100%;">
                               <table id="tblUserDetails" style="width:100%;  margin:auto; font-family:Verdana; font-size:14px; " >
                                    <tr>
                                        <td colspan="10" style="width:5%;">
                                          <div id="divMailItem" style="width:100%; height:auto; overflow:auto;">
                                              <table id="tblMailItem" style="width:100%;height:auto;margin:0px; padding:0px; border-spacing:0px;">
                                                  <% if (ViewMail.Rows.Count > 0) %>                                   
                                                  <% { %>                                   
                                                     <tr>
                                                        <td style="width:10%;"></td>
                                                        <td colspan="2" style="width:10%; color:#4d4dff; font-weight:bold;">Send By</td>
                                                        <td colspan="6" style="width:10%; color:#8080ff;"></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td colspan="2" style="width:10%;"></td>
                                                        <td colspan="7" style="width:10%; color:#8080ff;"><%:ViewMail.Rows[0]["SenderEmailAddress"].ToString() %></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td style="width:10%;"></td>
                                                        <td colspan="2" style="width:10%; color:#4d4dff; font-weight:bold;">Message Subject</td>
                                                        <td colspan="6" style="width:10%; color:#8080ff;"></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td colspan="2" style="width:10%;"></td>
                                                        <td colspan="7" style="width:10%; color:#8080ff;"><%:ViewMail.Rows[0]["MailSubject"].ToString() %></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td style="width:10%;"></td>
                                                        <td colspan="4"  style="width:10%; color:#4d4dff; font-weight:bold;">Message Body</td>
                                                        <td colspan="4" style="width:10%; color:#8080ff;"></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td colspan="2" style="width:10%;"></td>
                                                        <td colspan="7" style="width:10%; color:#8080ff;"><%:ViewMail.Rows[0]["MailMessageBody"].ToString() %></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td style="width:10%;"></td>
                                                        <td colspan="4" style="width:10%; color:#4d4dff; font-weight:bold;">Time of Mail</td>
                                                        <td colspan="4" style="width:10%; color:#8080ff;"></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                     <tr>
                                                        <td colspan="2" style="width:10%;"></td>
                                                        <td colspan="7" style="width:10%; color:#8080ff;"><%:ViewMail.Rows[0]["MailTime"].ToString() %></td>
                                                        <td style="width:10%;"></td>
                                                     </tr>
                                                  <% } %>                                   
                                                  <% else  %>                                   
                                                  <% { %>                                   
                                                 <tr>
                                                    <td style="width:10%;"></td>
                                                    <td colspan="8" style="width:10%;">No Mail found.</td>
                                                    <td style="width:10%;"></td>
                                                  </tr>

                                                  <% } %>        
                                                  <tr style="height:100px;">
                                                    <td style="width:10%;"></td>
                                                    <td style="width:10%;">
                                                        <input id="btnClose" type="button" style="color:#ff6666" onclick="closePopupWindow();" value="Close" />
                                                    </td>
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
                                        <td colspan="2" style="width:10%;">

                                        </td>
                                        <td colspan="1" style="width:10%;">
                                            
                                        </td>
                                        <td colspan="2" style="width:5%;">
           
                                        </td>
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
              </table>
              <asp:HiddenField ID="hiddenUserName" runat="server" />
              <asp:HiddenField ID="hiddenSenderEmailAddress" runat="server" />
          </div>
        </div>
    </form>
</body>
</html>
