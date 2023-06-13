<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="CollegeSocialNetwork.Profile.UpdateProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/datecss/pikaday.css" rel="stylesheet" />
    <%--<link href="../CSS/datecss/site.css" rel="stylesheet" />--%>
    <link href="../CSS/datecss/theme.css" rel="stylesheet" />
    <link href="../CSS/datecss/triangle.css" rel="stylesheet" />
    <script src="../JS/Login.js"></script>
    <script src="../JS/ValidateEmailAddress.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>--%>
    <script src="../Scripts/moment.min.js"></script>
    <script src="../JS/pikaday.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function ProfileUpdatedSuccessfully() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarLable.text('Profile Updated Successfully.');
        }

        function ProfileNoUpdatedSuccessfully() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarLable.text('Profile Not Updated Successfully.');
        }

        function PleaseSelectImage() {
            var progressbarDiv = $('#progressbar');
            var progressbarLable = $('#progressbar-label');
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarDiv.fadeIn(1000);
            progressbarDiv.fadeOut(3000);
            progressbarLable.text('Image Is Not Selected, Please Select Image.');
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
              <table  style="height:auto; width:100%;margin:0px; padding:0px; border-collapse:collapse; ">
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Update Profile</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>U. P.</b>
                      </td>

                      <td id="tdHeaderImage" colspan="10" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1080px 65px;">
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
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%; font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          First Name
                      </td>
                      <td style="width:50%; font-weight:bold; margin-top:0px; background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtFirstName" Width="250" onblur = "return validateUserFields(this,document.getElementById('txtUserFirstNameSpan'),true,'Please enter user first name.',numberNotAllow = true);" runat="server"></asp:TextBox>
                          <span id="txtUserFirstNameSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td rowspan="7" style="width:35%; padding-left:45px; text-align:start;" >
                          <asp:Image ID="userImage" Height="200" Width="200" runat="server" />
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%; font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Middle Name
                      </td>
                      <td style="width:50%; font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtMiddleName" onblur = "return stringContainsNumber(this,document.getElementById('txtUserMiddleNameSpan'));" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserMiddleNameSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
<%--                      <td style="width:35%;">

                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%; font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Last Name
                      </td>
                      <td style="width:50%; font-weight:bold;  background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtLastName" onblur = "validateUserFields(this,document.getElementById('txtUserLastNameSpan'),true,'Please enter user last name.',numberNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserLastNameSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <%--<td style="width:35%;">
                          
                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold;  background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Email Address
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtEmailAddress" onblur = "validateUserFields(this,document.getElementById('txtUserEmailAddressSpan'),true,'Please enter user email address.'); return ValidateEmail(this,document.getElementById('txtUserEmailAddressSpan'));" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserEmailAddressSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
<%--                      <td style="width:35%;">

                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Premises
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtPremises" onblur = "validateUserFields(this,document.getElementById('txtUserPremisesSpan'),true,'Please enter user premises.',numberNotAllow = flase);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserPremisesSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
<%--                      <td style="width:35%;">
                          
                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Date of birth
                      </td>
                      <td style="width:50%;background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtDateOfBirth" onblur = "validateUserFields(this,document.getElementById('txtUserDateOfBirthSpan'),false,'Please enter user date of birth.',false, false);" ReadOnly="true" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserDateOfBirthSpan" style="color:red; visibility:hidden;">*</span>
                          <script type="text/javascript">  
                              //var picker = new Pikaday(
                              //    {
                              //        field: document.getElementById('txtDateOfBirth'),
                              //        firstDay: 1,
                              //        format: 'mm/dd/yyyy',
                              //        minData: new Date('2000-01-01'),
                              //        maxData: new Date('2000-01-01'),
                              //        yearRange: new Date('2000-2020'),
                              //        numberOfMonths: 2,
                              //        theme: 'dark-theme'
                              //    });
                              var datepickerFrom = new Pikaday(
                                  {
                                      field: document.getElementById('txtDateOfBirth'),
                                      firstDay: 1,
                                      format: 'DD/MM/YYYY',
                                      minDate: new Date('1900-01-01'),
                                      maxDate: new Date('2040-12-31'),
                                      yearRange: [1950, 2004],
                                      numberOfMonths: 2,
                                  });

                              
                          </script>  
                      </td>
<%--                      <td style="width:35%;">
                          
                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Gender
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:DropDownList ID="ddlGender" runat="server">
                              <asp:ListItem Value="-1">Select Gender</asp:ListItem>
                              <asp:ListItem Value="1">Male</asp:ListItem>
                              <asp:ListItem Value="2">Female</asp:ListItem>
                              <asp:ListItem Value="3">Other</asp:ListItem>
                          </asp:DropDownList>
                          <span id="txtUserGenderSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
<%--                      <td style="width:35%;">
                          
                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Pin No
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtPinNo" onblur = "validateUserFields(this,document.getElementById('txtUserPinNoSpan'),true,'Please enter pin no.',numberNotAllow = false, charecterNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserPinNoSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td style="width:35%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          City
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtCity" onblur = "validateUserFields(this,document.getElementById('txtUserCitySpan'),true,'Please enter city.',numberNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserCitySpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td style="width:35%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          State
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtState" onblur = "validateUserFields(this,document.getElementById('txtUserStateSpan'),true,'Please enter state.',numberNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserStateSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td style="width:35%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Country
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtCoutry" onblur = "validateUserFields(this,document.getElementById('txtUserCountrySpan'),true,'Please enter country.',numberNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserCountrySpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td style="width:35%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Phone
                      </td>
                      <td style="width:50%;font-weight:bold; background-color:#ebfafa; color:#5353c6;border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:TextBox ID="txtPhone" onblur = "validateUserFields(this,document.getElementById('txtUserPhoneSpan'),true,'Please enter user phone no.',numberNotAllow = false, charecterNotAllow = true);" Width="250" runat="server"></asp:TextBox>
                          <span id="txtUserPhoneSpan" style="color:red; visibility:hidden;">*</span>
                      </td>
                      <td style="width:35%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;font-weight:bold; background-color:#d6f5f5; color:#5353c6; border-top-left-radius:20px;  border-bottom-left-radius:20px;">
                          Upload Image
                      </td>
                      <td style="width:50%;background-color:#d6f5f5; color:#5353c6; border-top-right-radius:20px;  border-bottom-right-radius:20px;">
                          <asp:FileUpload ID="fileUploadImage" runat="server" ForeColor="Red" />
                      </td>
                      <td style="width:35%;">
                          
                      </td>
                  </tr>
                  <tr>
                      <td style="width:5.5%;">

                      </td>
                      <td style="width:15%;">
                          <asp:Button ID="btSaveUserProfile" runat="server" Text="Save User Profile" OnClientClick="return checkUpdateUserProfile();" OnClick="btSaveUserProfile_Click" CssClass="button" />
                      </td>
                      <td style="width:50%;">
                          <asp:Button ID="btnBackToHome" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click" CssClass="button" />
                           <asp:Button ID="btnClear" runat="server" Text="Clear All" OnClick="btnClear_Click" CssClass="button" />                      
                      </td>

                      <td style="width:35%;">
                             <div id="progressbar" style="position:relative; height:30px; display:none;">
                                  <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:1%; top:20%;"></span>
                             </div>
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
