<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionExpire.aspx.cs" Inherits="CollegeSocialNetwork.Error.SessionExpire" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:auto;  width:90%; margin:auto;">
             <table style="height:100px;  width:90%; margin-left:5px;">
                  <tr>
                      <td style="width:100%; color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                          <b style="margin-left:5%;">COLLEGE SOCIAL NETWORK</b>
                      </td>
                  </tr>
                 <tr>
                     <td>
                         Your session has been expite, please login to continued.
                     </td>
                 </tr>
                 <tr>
                     <td>
                         <asp:Button ID="btnBacktoLoginPage" runat="server" Text="Back to login" OnClick="btnBacktoLoginPage_Click" />
                     </td>
                 </tr>
             </table>
        </div>
    </form>
</body>
</html>
