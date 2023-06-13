<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="CollegeSocialNetwork.Profile.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/datecss/pikaday.css" rel="stylesheet" />
    <link href="../CSS/datecss/theme.css" rel="stylesheet" />
    <link href="../CSS/datecss/triangle.css" rel="stylesheet" />
    <script src="../JS/Login.js"></script>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script src="../JS/ValidateEmailAddress.js"></script>
    <script src="../Scripts/moment.min.js"></script>
    <script src="../JS/pikaday.js"></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script type="text/javascript">

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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Add User</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>A. U.</b>
                      </td>

                      <td id="tdHeaderImage" colspan="9" style="width:10%; object-fit:contain; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:1037px 65px;">
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
                      <td style="width:15%; background-color:#e5ffcc; font-weight:bold; color:#3973ac; ">
                          User Type
                      </td>
                      <td style="width:35%;  background-color:#e5ffcc;">
                          <asp:DropDownList ID="ddlTypeOfUser" runat="server"  AutoPostBack="false"   onblur="return diableEnableInputField();" onChange="return diableEnableInputField();">
                              <asp:ListItem Value="-1">Select User</asp:ListItem>
                              <asp:ListItem Value="Faculty">Faculty</asp:ListItem>
                              <asp:ListItem Value="Student">Student</asp:ListItem>
                          </asp:DropDownList>
                          <span id="ddlTypeOfUserSpanMandatory" style="color:red;">*</span>
                          <span id="ddlTypeOfUserSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                          <asp:HiddenField ID="hiddenFieldForTypeOfUser" runat="server" Value="N" />
                      </td>
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                          College Code
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:DropDownList ID="ddlTypeColledgeCode"  Enabled="false"  AutoPostBack="false"  runat="server">
                              <asp:ListItem Value="-1">Select Colledge</asp:ListItem>
                              <asp:ListItem Value="CSNPTK">CSNPTK</asp:ListItem>
                          </asp:DropDownList>
                          <span id="ddlTypeColledgeCodeSpanMandatory" style="color:red;">*</span>
                          <span id="ddlTypeColledgeCodeSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%;  background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                          User Name
                      </td>
                      <td style="width:35%;  background-color:#f2ffe6;">
                          <asp:TextBox ID="txtUserName" Enabled="false" AutoPostBack="false" Width="180" onblur = "return validateUserFields(this,document.getElementById('txtUserNameSpan'),true,'Please enter user name.',numberNotAllow = true);" runat="server"></asp:TextBox>
                          <span id="txtUserNameSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserNameSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%;  background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                          Upload User Image
                      </td>
                      <td style="width:35%;  background-color:#f2ffe6;">
                          <asp:FileUpload ID="fileUploadImage"  runat="server" Enabled="false" ForeColor="Orange" />
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                          User Password
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtUserPassword" Enabled="false"  TextMode="Password"  AutoPostBack="false"  Width="180" onblur = "return validateUserFields(this,document.getElementById('txtUserPasswordSpan'),false,'Please enter user password.',false,false);" runat="server"></asp:TextBox>
                          <span id="txtUserPasswordSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserPasswordSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                          User Confirm Pasword
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtUserConfirmPassword" Enabled="false" TextMode="Password" Width="180"  AutoPostBack="false"  onblur = "return validateUserFields(this,document.getElementById('txtUserConfirmPasswordSpan'),false,'Please enter confirm pasword.',false,false,true,document.getElementById('txtUserPassword'),document.getElementById('txtUserConfirmPassword'));" runat="server"></asp:TextBox>
                          <span id="txtUserConfirmPasswordSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserConfirmPasswordSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr id="parentName">
                      <td style="width:15%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                          Parent Name
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtUserParentName" Enabled="false" AutoPostBack="false"  Width="180" onblur = "return validateUserFields(this,document.getElementById('txtUserParentNameSpan'),true,'Please enter parent Name.',true);" runat="server"></asp:TextBox>
                          <span id="txtUserParentNameSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserParentNameSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#f2ffe6;">
                          
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          
                      </td>
                  </tr>
                  <tr id="parentPassword">
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                          Parent Pasword
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtUserParentPassword" Enabled="false"  TextMode="Password"   AutoPostBack="false"  Width="180" onblur = "return validateUserFields(this,document.getElementById('txtUserParentPasswordSpan'),false,'Please enter parent Pasword.',false,false);" runat="server"></asp:TextBox>
                          <span id="txtUserParentPasswordSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserParentPasswordSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                          Parent Confirm Pasword
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtUserParentConfirmPassword" Enabled="false"  TextMode="Password"   AutoPostBack="false"  Width="180" onblur = "return validateUserFields(this,document.getElementById('txtUserParentConfirmPasswordSpan'),false,'Please enter confirm pasword.',false,false,true,document.getElementById('txtUserParentPassword'),document.getElementById('txtUserParentConfirmPassword'));" runat="server"></asp:TextBox>
                          <span id="txtUserParentConfirmPasswordSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserParentConfirmPasswordSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                          User First Name
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtFirstName" Width="180" Enabled="false"   AutoPostBack="false"  onblur = "return validateUserFields(this,document.getElementById('txtUserFirstNameSpan'),true,'Please enter user first name.',numberNotAllow = true);" runat="server"></asp:TextBox>
                          <span id="txtUserFirstNameSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserFirstNameSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>                       
                      </td>
                      <td style="width:16%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                       User Middle Name
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtMiddleName"  Enabled="false"  AutoPostBack="false"  onblur = "return stringContainsNumber(this,document.getElementById('txtUserMiddleNameSpan'));" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserMiddleNameSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                       User  Last Name
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtLastName" Enabled="false" AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserLastNameSpan'),true,'Please enter user last name.',numberNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserLastNameSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserLastNameSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                       Add Course
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                       <asp:DropDownList ID="ddlStudentCourse"  Enabled="false" runat="server">
                              <asp:ListItem Value="-1">Select Course</asp:ListItem>
                              <asp:ListItem Value="1">BSc IT</asp:ListItem>
                              <asp:ListItem Value="2">BSc CS</asp:ListItem>
                              <asp:ListItem Value="3">BSc Math</asp:ListItem>
                              <asp:ListItem Value="3">Mass Media</asp:ListItem>
                          </asp:DropDownList>
                          <span id="txtStudentCourseSpanMandatory" style="color:red;">*</span>
                          <span id="txtStudentCourseSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                        Email Address
                      </td>
                      <td style="width:35%;  background-color:#f2ffe6;" colspan="2">
                          <asp:TextBox ID="txtEmailAddress" Enabled="false"  AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserEmailAddressSpan'),true,'Please enter user email address.'); return ValidateEmail(this,document.getElementById('txtUserEmailAddressSpan'));" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserEmailAddressSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserEmailAddressSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                       
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                        Premises
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtPremises" Enabled="false" AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserPremisesSpan'),true,'Please enter user premises.',false, false);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserPremisesSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserPremisesSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                        Date of birth
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtDateOfBirth" Enabled="false"   AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserDateOfBirthSpan'),false,'Please enter date of birth.',false, false);" ReadOnly="true" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserDateOfBirthSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserDateOfBirthSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                          <script type="text/javascript">  

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
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                       Gender
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:DropDownList ID="ddlGender"  AutoPostBack="false" Enabled="false" runat="server">
                              <asp:ListItem Value="-1">Select Gender</asp:ListItem>
                              <asp:ListItem Value="1">Male</asp:ListItem>
                              <asp:ListItem Value="2">Female</asp:ListItem>
                              <asp:ListItem Value="3">Other</asp:ListItem>
                          </asp:DropDownList>
                          <span id="txtUserGenderSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserGenderSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                       Pin No
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtPinNo" Enabled="false"  MaxLength="6"  AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserPinNoSpan'),true,'Please enter pin no.',numberNotAllow = false, charecterNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserPinNoSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserPinNoSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                       City
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtCity" Enabled="false" AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserCitySpan'),true,'Please enter city.',numberNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserCitySpanMandatory" style="color:red;">*</span>
                          <span id="txtUserCitySpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#e5ffcc;font-weight:bold; color:#3973ac; ">
                       State
                      </td>
                      <td style="width:35%; background-color:#e5ffcc;">
                          <asp:TextBox ID="txtState" Enabled="false"  AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserStateSpan'),true,'Please enter state.',numberNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserStateSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserStateSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                          Country
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtCoutry" Enabled="false"  AutoPostBack="false" onblur = "validateUserFields(this,document.getElementById('txtUserCountrySpan'),true,'Please enter country.',numberNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserCountrySpanMandatory" style="color:red;">*</span>
                          <span id="txtUserCountrySpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                      <td style="width:16%; background-color:#f2ffe6;font-weight:bold; color:#3973ac; ">
                       Phone
                      </td>
                      <td style="width:35%; background-color:#f2ffe6;">
                          <asp:TextBox ID="txtPhone" Enabled="false" MaxLength="10"  AutoPostBack="false"  onblur = "validateUserFields(this,document.getElementById('txtUserPhoneSpan'),true,'Please enter user phone no.',numberNotAllow = false, charecterNotAllow = true);" Width="180" runat="server"></asp:TextBox>
                          <span id="txtUserPhoneSpanMandatory" style="color:red;">*</span>
                          <span id="txtUserPhoneSpan" style="color:red; visibility:hidden; font-size:12px;">*</span>
                      </td>
                  </tr>
                  <tr>
                      <td style="width:15%;">
                           <%--<asp:Button ID="btAddUser" runat="server" Text="Save User Profile" OnClientClick="return checkUpdateUserProfile(); return SelectTypeOfUser();" OnClick="btAddUser_Click"/>--%>
                          <asp:Button ID="btAddUser" runat="server" Text="Save User Profile" OnClientClick="return SelectTypeOfUser();" OnClick="btAddUser_Click" CssClass="button"/>
                      </td>
                      <td style="width:35%;">
                           <asp:Button ID="btnBackToHome" runat="server" Text="Back To Home" OnClick="btnBackToHome_Click"  CssClass="button"/>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:Button ID="btnClear" runat="server" Text="Clear All" OnClick="btnClear_Click"  CssClass="button"/>  
                      </td>
                      <td style="width:16%;">
                         
                      </td>
                      <td style="width:35%;">                 
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" style=" height:50px; " >
                         <div id="progressbar" style="position:relative; height:30px; display:none;">
                            <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;"></span>
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
