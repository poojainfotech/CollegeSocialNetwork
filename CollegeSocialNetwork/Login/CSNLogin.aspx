<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSNLogin.aspx.cs" 
    Inherits="CollegeSocialNetwork.CSNLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../CSS/fullclip.min.js"></script>
    <script src="../JS/Login.js"></script>
    <style>
        #bodyImage
        {
            background:url(../images/loginImages/loginImage6.jpg) no-repeat center center fixed;
            background-size:100% 100%;
            height:609px;
            position:absolute;
            width:100%;
            background-color:aquamarine;
        }

    </style>
</head>
<body style="padding:0; margin:0; background-color:#00bfff;">
    <form runat="server">
        <div id="bodyImage">
        <div style="height:208px;">
            <div style="width:98%; padding-left:1%; margin-top:60px; padding-right:1%;  color:orangered; text-align:left; font-family:fantasy; font-size:50px;">
                <marquee>
                    <b id="tdCSN" style="margin-left:2%;">COLLEGE SOCIAL NETWORK</b>
                </marquee>
            </div>
        </div>
        <div style="height:161px;">
            <table style="margin:0px 0px 0px 60%; border-collapse:collapse;">
                <tr>
                    <td style="width:300px;">
                        <span style="font-weight:200; color:white;"><b>User Name</b></span>
                    </td>
                </tr>
                <tr>
                    <td style="width:500px;">
                        <div>
                            <table>
                                <tr>
                                    <td><asp:TextBox ID="txtUserName" runat="server" MaxLength="10" Width="300" onblur = "validateUserFields(this,document.getElementById('txtUserNameSpan'),true,'Please enter user name.');" ></asp:TextBox></td>
                                    <td style="width:400px; font-size:15px;"><span id="txtUserNameSpan" style="color:red; visibility:hidden;">*</span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="font-weight:200; color:white;"><b>Password</b></span>
                    </td>                    
                </tr>
                <tr>
                    <td style="width:300px;">
                        <div>
                            <table>
                                <tr>
                                    <td><asp:TextBox ID="txtUserPassword" runat="server" MaxLength="10" TextMode="Password" Width="300" onblur = "validateUserFields(this,document.getElementById('txtUserPasswordSpan'),false,'Please enter user password.');"></asp:TextBox></td>
                                    <td style="width:400px; font-size:15px;"><span id="txtUserPasswordSpan" style="color:red; visibility:hidden;">*</span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="font-weight:200; color:white;"><b>College Code</b></span>
                    </td>
                </tr>
                <tr>
                    <td style="width:300px;">
                        <div>
                            <table>
                                <tr>
                                    <td><asp:TextBox ID="txtUserCollegeCode" runat="server" Width="300" MaxLength="10" onblur = "validateUserFields(this,document.getElementById('txtUserCollegeCodeSpan'),true,'Please enter college code.');"></asp:TextBox></td>
                                    <td style="width:400px; font-size:15px;"><span id="txtUserCollegeCodeSpan" style="color:red; visibility:hidden;">*</span></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="">
                        <div>
                            <table>
                                <tr>
                                    <td style="width:153px;text-align:left; padding-left:2px;">
                                         <span style=" margin-left:-1px; color:white;">
                                           <asp:Button ID="logInButton" OnClick="logInButton_Click" OnClientClick="return checkUserDetails();" runat="server" Width="100" Text="Log In" />
                                         </span>
                                    </td>
                                    <td style="width:147px; text-align:right;">
                                         <span style="margin-right:-1px; text-decoration:underline;">                          
                                            <a style="color:white;" href="../ForgotPassword/ForgotPassword.aspx" >Forgot Password</a>
                                         </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblUserLoginDetails" Visible ="false" ForeColor="White" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <script>
                //let image = document.getElementById('bodyImage');
                //let images = ['loginImage3.jpg', 'loginImage4.jpg', 'loginImage5.jpg', 'loginImage6.jpg', 'loginImage7.jpg'];
                //let count = 0;
                //setInterval(function () {
                //    image.style.backgroundImage = 'url(../images/loginImages/' + images[count] + ')';
                //    image.style.opacity = 100000;
                //    count++;
                //    if (count == 5) {
                //        count = 0;
                //    }
                //}, 3000);


                var images = ['loginImage3.jpg', 'loginImage4.jpg', 'loginImage5.jpg', 'loginImage6.jpg', 'loginImage7.jpg'];
                $(function () {
                    var i = 0;
                    $("#bodyImage").css("background-image", 'url(../images/loginImages/' + images[i] + ")");
                    setInterval(function () {
                        i++;
                        if (i == images.length) {
                            i = 0;
                        }
                        $("#bodyImage").fadeOut(500, function () {
                            $(this).css("background-image", 'url(../images/loginImages/' + images[i] + ")");
                            $(this).fadeIn(4000);
                        });
                    }, 7000);
                });

                

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
