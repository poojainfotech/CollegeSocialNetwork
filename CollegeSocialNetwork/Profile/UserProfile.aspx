<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CollegeSocialNetwork.Profile.UserProfile" %>

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

        function gotoyoutube() {
            window.open('https://www.youtube.com/', '_blank');
        }

        function gotofacebook() {
            window.open('https://www.facebook.com/', '_blank');
        }

        function gotoContact(url) {
            newwindow = window.open(url, 'name', 'height=400,width=850');
            if (window.focus) { newwindow.focus() }
            return false;
        }

        function changeColoronmousemove(elementItem) {
            document.getElementById(elementItem.id).style.backgroundColor = '#ffebe6';
            document.getElementById(elementItem.id).style.color = 'red';
            $('#' + elementItem.id).fadeIn(250);
        }

        function changeColoronmouseout(elementItem) {
            document.getElementById(elementItem.id).style.backgroundColor = 'aquamarine';
            document.getElementById(elementItem.id).style.color = '#00b300';
        }

        $(document).ready(function () {
            $('#btnUpload').click(function () {
                var userUploadPdfFile = $('#uploadPdfFile')[0].files;
                /*var uploadImagefile = $('#uploadImagefile')[0].files;*/
                var progressbarDiv = $('#progressbar');
                var progressbarLable = $('#progressbar-label');
                var formData = new FormData();
                formData.append('txtChat', document.getElementById('txtChat').value);
                formData.append('hiddenUserName', document.getElementById('hiddenUserName').value);

                /*if (userUploadPdfFile.length > 0 || uploadImagefile.length > 0 || document.getElementById('txtChat').value != '') {*/

                if (document.getElementById('txtChat').value != '') {
                    for (var i = 0; i < userUploadPdfFile.length; i++) {
                        const typeNameCollection = userUploadPdfFile[i].name.split('.');

                        if (typeNameCollection[1] == 'pdf' && typeNameCollection[1] == 'pptx' && typeNameCollection[1] == 'docx') {

                        }
                        else {
                            progressbarDiv.fadeIn(1000);
                            progressbarDiv.fadeOut(2000);
                            progressbarLable.text('Please select study material as pdf, pptx or docx file.');
                            progressbarDiv.fadeIn(1000);
                            progressbarDiv.fadeOut(2000);
                            return false;
                        }
                        formData.append(userUploadPdfFile[i].name + '/notImage', userUploadPdfFile[i]);
                    }

                    $.ajax({
                        url: 'GenericsHandlers/UploadHandler.ashx',
                        method: 'post',
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function () {
                            progressbarLable.text('Uploading Process completed.');
                            progressbarDiv.fadeOut(3000);
                            getUserProfileData();
                        },
                        error: function (err) {
                            alert(err.statusText)

                        }
                    });
                    progressbarLable.text('Process in progress ...');
                    progressbarDiv.fadeIn(3000);
                }
                else {
                    progressbarDiv.fadeIn(1000);
                    progressbarDiv.fadeOut(2000);
                    progressbarLable.text('Please provide message or pdf file or image to upload...');
                    progressbarDiv.fadeIn(1000);
                    progressbarDiv.fadeOut(2000);
                }
                $('#uploadPdfFile').val('');
                $('#txtChat').val('');
            });
        });

        function getUserProfileData() {
            $(document).ready(function () {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                var userInformation = $('#tblItemUploadedByUser');
                var fullName = '';
                $.ajax({
                    type: 'GET',
                    url: rootUrl + '/api/GetUserProfile/GetUserProfileSocialActivity',
                    data: {
                        UserName: document.getElementById('hiddenUserName').value
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data) {
                        userInformation.empty();
                        if (data.length == 0) {
                            fullName = fullName +
                                '<tr>' +
                                '<td colspan="9" style="width:5%;color:#40bf40;font-family:fantasy; font-weight:bold; border-top:0.5px solid #00ffbf; border-left:0.5px solid #00ffbf; background-color:#e6fff9;text-align:center;">' +
                                'No Activity Found.' +                         
                                '</td>' +
                                '</tr>'
                        }
                        else {
                            $.each(data, function (index, val) {
                                fullName = fullName +
                                    '<tr>' +
                                    '<td style="width:5%;"></td>' +
                                    '<td colspan="2" style="width:5%;color:#40bf40;font-family:fantasy; font-weight:bold; border-top:0.5px solid #00ffbf; border-left:0.5px solid #00ffbf; background-color:#e6fff9;">' +
                                    val.ChatDate.substring(6, 8) + '/' + val.ChatDate.substring(4, 6) + '/' + val.ChatDate.substring(0, 4) + '&nbsp;&nbsp;' + val.ChatDate.substring(8, 10) + ':' + val.ChatDate.substring(10, 12) +
                                    '</td>' +
                                    '<td colspan="5" style="width:5%;  border-top:0.5px solid #00ffbf; border-right:0.5px solid #00ffbf;color:#006699;font-weight:bold; background-color:#e6fff9;">' + val.Chat + '</td>' +
                                    '<td style="width:5%;"></td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td style="width:5%;"></td>' +
                                    '<td colspan="2"  style="width:5%;  border-left:0.5px solid #00ffbf; background-color:#e6fff9;" >'

                                if (val.ImagesData != null) {
                                    fullName = fullName +
                                        '<img alt="No Image" height="80" width="160" src="' + val.ImagesData + '" />'
                                }
                                fullName = fullName +
                                    '</td>' +
                                    '<td colspan="5"  style="width:5%; height:80px;  border-right:0.5px solid #00ffbf; background-color:#e6fff9;" >'

                                if (val.PDFfileName != null) {
                                    fullName = fullName +
                                        '<div style="margin-top:-20px;color:#e60099;font-weight:bold;">' +
                                        '<a href="#"  onclick="downloadPdfFile(' + val.ID + ');" >' + val.PDFfileName + '</a>' +
                                        '<div>'
                                }

                                fullName = fullName +
                                    '</td>' +
                                    '<td style="width:5%;">' +
                                    '</td>' +
                                    '</tr > ' +
                                    '</tr > ' +

                                    '<tr>' +
                                    '<td>' +

                                    '</td>' +
                                    '<td colspan="1"  style="width:2%; height:10px; border-left:0.5px solid #00ffbf;border-bottom:0.5px solid #00ffbf; background-color:#e6fff9;" >'
                                if (val.Likes == '' || val.Likes == '1') {
                                    fullName = fullName +
                                        '<div id="likeOnItem' + val.ID + '" onclick="functionLike(' + val.ID + ')" style="margin-left:2px; width:80px;height:20px; background-color:#8A0808; background-image:url(../Profile/LikeButtonImage/LikeButton6.png);background-repeat:no-repeat;background-size:80px 20px;cursor: pointer;"></div>'
                                }
                                else {
                                    fullName = fullName +
                                        '<div id="likeOnItem' + val.ID + '" onclick="functionLike(' + val.ID + ')" style="margin-left:2px; width:80px;height:20px; background-color:#8A0808; background-image:url(../Profile/LikeButtonImage/LikeButton8.png);background-repeat:no-repeat;background-size:80px 20px;cursor: pointer;"></div>'
                                }
                                fullName = fullName +
                                    '<input type="hidden" id="hiddenlikeOnItem' + val.ID + '" name="hiddenlikeOnItem' + val.ID + '" value="1">' +
                                    '</td>' +

                                    '<td colspan="1"  style="width:2%; height:10px;  background-color:#e6fff9; border-bottom:0.5px solid #00ffbf;" >' +
                                    '<div id="functiOnComment' + val.ID + '" onclick="functiOnComment(' + val.ID + ')" style="margin-left:2px; width:80px;height:20px; background-color:#8A0808; background-image:url(../Profile/LikeButtonImage/Comment1.png);background-repeat:no-repeat;background-size:80px 20px;cursor: pointer;"></div>' +
                                    '<input type="hidden" id="hiddenfunctiOnComment' + val.ID + '" name="hiddenfunctiOnComment' + val.ID + '" value="1">' +
                                    '</td>' +

                                    '<td colspan="1"  style="width:2%; height:10px;  background-color:#e6fff9; border-bottom:0.5px solid #00ffbf;" >' +
                                    '<div id="functiOnSaveComment' + val.ID + '" onclick="functiOnSaveComment(' + val.ID + ')" style="visibility:hidden;float: right;margin-left:2px; width:80px;height:20px; background-color:#8A0808; background-image:url(../Profile/LikeButtonImage/SaveComment1.png);background-repeat:no-repeat;background-size:80px 20px;cursor: pointer;"></div>' +
                                    '<input type="hidden" id="hiddenfunctiOnSaveComment' + val.ID + '" name="hiddenfunctiOnSaveComment' + val.ID + '" value="1">' +
                                    '</td>' +

                                    '<td colspan="3" style="width:2%; height:10px;   background-color:#e6fff9; border-bottom:0.5px solid #00ffbf;" >' +
                                    '<input id="commentOnItem' + val.ID + '" type="text" style="visibility:hidden;" maxlength="20" />' +
                                    '<input type="hidden" id="hiddencommentOnItem' + val.ID + '" name="hiddencommentOnItem' + val.ID + '" value="1">' +
                                    '</td>' +

                                    '<td colspan="1"  style="width:2%; height:10px;  background-color:#e6fff9; border-bottom:0.5px solid #00ffbf;border-right:0.5px solid #00ffbf;" >' +
                                    '<div id="functiOnCommentHistory' + val.ID + '" onclick="functiOnCommentHistory(' + val.ID + ')" style="margin-left:2px; width:80px;height:20px; background-color:#8A0808; background-image:url(../Profile/LikeButtonImage/ShowCommentHistory.png);background-repeat:no-repeat;background-size:80px 20px;cursor: pointer;"></div>' +
                                    '</td>' +

                                    '<tr>' +
                                    '<td colspan="9"  style="width:5%; height:25px;"></td>' +
                                    '</tr>'

                            });
                        }

                        fullName = fullName +
                            '<tr>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '<td style="width:5%;"></td>' +
                            '</tr>'
                        userInformation.append(fullName)


                    },
                    error: function (xhr, status, error) {
                        userInformation.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                    }
                });
            });
        }

        function downloadPdfFile(pdfFileId) {
            $(document).ready(function () {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                var userInformation = $('#tblItemUploadedByUser');

                $.ajax({
                    type: 'GET',
                    url: rootUrl + '/api/PdfFileFunction/GetUserProfileSocialActivityByID',
                    data: {
                        ID: pdfFileId
                    },
                    success: function (data) {
                        $.each(data, function (index, val) {
                            const fileExtentions = val.PDFfileName.split('.');
                            var a = document.createElement('a');
                            var pdfAsDataUri = "data:application/" + fileExtentions[1] + ";base64," + val.FileData;
                            a.download = val.PDFfileName;
                            a.type = 'application/' + fileExtentions[1];
                            a.rel = 'nofollow';
                            a.href = pdfAsDataUri;
                            a.click();
                        });
                    },
                    error: function (xhr, status, error) {
                        userInformation.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                    }
                });
            });
        }


        function functionLike(elementOfLikeNo) {
            if (document.getElementById('hiddenlikeOnItem' + elementOfLikeNo).value == '1') {
                document.getElementById('likeOnItem' + elementOfLikeNo).style.backgroundImage = 'url(../Profile/LikeButtonImage/LikeButton8.png)';
                document.getElementById('hiddenlikeOnItem' + elementOfLikeNo).value = '2';
            }
            else {
                document.getElementById('likeOnItem' + elementOfLikeNo).style.backgroundImage = 'url(../Profile/LikeButtonImage/LikeButton6.png)';
                document.getElementById('hiddenlikeOnItem' + elementOfLikeNo).value = '1';
            }
            $(document).ready(function () {
                var pathArray = window.location.pathname.split('/');
                var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                $.ajax({
                    type: 'GET',
                    url: rootUrl + '/api/GetUserProfile/GetUserProfileLike',
                    data: {
                        UserName: document.getElementById('hiddenUserName').value,
                        Like: document.getElementById('hiddenlikeOnItem' + elementOfLikeNo).value,
                        UserProfileID: elementOfLikeNo
                    },
                    success: function (data) {
                        
                    },
                    error: function (xhr, status, error) {
                        userInformation.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                    }
                });
            });
        }

        function functiOnComment(elementOfCommentNo) {
            document.getElementById('commentOnItem' + elementOfCommentNo).style.visibility = 'visible';
            document.getElementById('functiOnSaveComment' + elementOfCommentNo).style.visibility = 'visible';
            document.getElementById('functiOnComment' + elementOfCommentNo).style.visibility = 'hidden';
        }

        function functiOnSaveComment(elementOfCommentNo) {
            document.getElementById('functiOnComment' + elementOfCommentNo).style.visibility = 'visible';
            
            if (document.getElementById('commentOnItem' + elementOfCommentNo).value != '') {
                var txtComment = document.getElementById('commentOnItem' + elementOfCommentNo).value;
                $(document).ready(function () {
                    var pathArray = window.location.pathname.split('/');
                    var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
                    $.ajax({
                        type: 'GET',
                        url: rootUrl + '/api/GetUserProfile/GetUserProfileComment',
                        data: {
                            UserName: document.getElementById('hiddenUserName').value,
                            Comment: txtComment,
                            UserProfileID: elementOfCommentNo
                        },
                        success: function (data) {
                            document.getElementById('commentOnItem' + elementOfCommentNo).value = ''
                            document.getElementById('commentOnItem' + elementOfCommentNo).style.visibility = 'hidden';
                            document.getElementById('functiOnSaveComment' + elementOfCommentNo).style.visibility = 'hidden';
                        },
                        error: function (xhr, status, error) {
                            userInformation.html("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText);
                        }
                    });
                });
            }

        }

        function functiOnCommentHistory(functiOnCommentHistoryNo) {
            var pathArray = window.location.pathname.split('/');
            var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
            newwindow = window.open(rootUrl + '/Profile/UserSocialCommentHistory.aspx?functiOnCommentHistoryNo=' + functiOnCommentHistoryNo, 'name', 'height=500,width=850');
            if (window.focus) { newwindow.focus() }
            return false;
        }

    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .bg-imgs img 
        {
          position: absolute;
          z-index: -1;
          height: 5%;
          opacity: 0%;
          transition-delay: 5s;
          transition: opacity 5s;
        }

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
        .cssTextarea{
            background: #b3d9ff;
                  border:1px solid #4da6ff;
                  color: #000080;
                  height:25px;
                  font-weight:bold;
                  border-top-left-radius:10px;
                  border-bottom-right-radius:10px;
        }

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
    </style>
</head>
<body style="margin:0px; padding:0px;">
    <form id="form1" runat="server">
        <div>
            <div style="height:auto; width:90%; margin:auto;">
              <table style="height:auto; width:100%;">
                  <tr>
                      <td colspan="10" style="height:30px; width:100%;background-color:#8A0808; background-image:url(../Profile/SocialImage/15.jfif);background-repeat:no-repeat;background-size:100% 30px;">
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">College Social Activity</b>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="10" style="width:5%;">                         

                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:50px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>C. S. A.</b>
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
                      <td onclick="return gotoContact('UserContact.aspx');" style="height:50px; width:4%; background: lightblue;border-radius: 50%;font-size:10px; background-image:url(../images/UserImage/User1.jpg);background-repeat:no-repeat;background-size:65px 65px; border-color:aquamarine;cursor:pointer;">                         

                      </td>
                  </tr>
                  <tr>
                      <td id="tdfacebook" onclick="gotofacebook();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer;">                         
                          <b>facebook</b>
                      </td>
                      <td rowspan="12" colspan="8" style="width:8%;">
                        <div id="boxes-list" style="width:98%; height:240px; overflow:auto; background-color:azure; padding:2px;">
                           <div style="width:100%;">
                              <div id="progressbar" style="position:relative; height:30px; display:none;">
                                  <span id="progressbar-label" style="position:absolute; color:red; font-family:fantasy; left:35%; top:20%;">Loading...</span>
                               </div>
                           </div>
                          <table id="tblItemUploadedByUser" style="width:99.8%; margin-left:-1px;  height:auto; background-color:white; border-collapse:collapse;">

                          </table>

                        </div>
                      </td>
                      <td id="tdContact">                         

                      </td>
                  </tr>
                  <tr>
                      <td id="tdyoutube" onclick="gotoyoutube();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer;">                         
                          <b>youtube</b>
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td id="tdClose" onclick="closeWin();" onmouseout="changeColoronmouseout(this)" onmousemove="changeColoronmousemove(this);" style="height:25px; width:5%; border-top-left-radius:50px;border-top-right-radius:50px;border-bottom-left-radius:50px;border-bottom-right-radius:50px; text-align:center; background-color:aquamarine; color:#00b300; border-color:aquamarine;cursor:pointer;">                         
                          <b>Close</b>
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                   
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td colspan="1" style="width:10%; color:orange; font-weight:bold;  font-family:fantasy;">
                          Study Material :
                      </td>
                      <td colspan="3" style="width:10%;">
                          <asp:FileUpload ID="uploadPdfFile" ForeColor="#ffcc99"  Font-Bold="true" runat="server" />
                      </td>
<%--                      <td style="width:5%; color:orange; font-weight:bold; font-family:fantasy;">
                          Image :
                      </td>
                      <td colspan="4" style="width:10%;">
                          <asp:FileUpload ID="uploadImagefile" ForeColor="#ffcc99" Font-Bold="true" runat="server" />
                      </td>--%>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td style="width:10%; color:orange; font-weight:bold; font-family:fantasy;">
                          Message
                      </td>
                      <td colspan="7" style="width:10%;">
                          <textarea id="txtChat" runat="server" cols="95" rows="2"  class="cssTextarea" ></textarea>
                      </td>
                      <td style="width:5%;">

                      </td>
                  </tr>
                  <tr>
                      <td style="width:5%;">
                          
                      </td>
                      <td style="width:10%;">
                          <input id="btnUpload" type="button" value="Upload" class="button" />
                      </td>
                      <td colspan="4" style="width:10%;">
                          
                      </td>
                      <td colspan="2" style="width:10%;">
                          
                      </td>
                      <td style="width:10%;">
                          
                      </td>
                      <td style="width:5%;">

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
                  //let elementCollection = ['tdfacebook', 'tdyoutube','tdClose'];
                  //let countElement = 0;
                  //let varColor1 = '#8080ff';
                  //let varBGColor1 = '#e6e6ff';
                  //let varColor2 = '#c2c2d6'
                  //let varBGColor2 = '#9494b8'
                  //setInterval(function () {                      
                  //    if (countElement == 0) {
                  //        document.getElementById(elementCollection[0]).style.color = varColor1;
                  //        document.getElementById(elementCollection[0]).style.backgroundColor = varBGColor1;
                  //        document.getElementById(elementCollection[1]).style.color = varColor2;
                  //        document.getElementById(elementCollection[1]).style.backgroundColor = varBGColor2;
                  //        document.getElementById(elementCollection[2]).style.color = varColor2;
                  //        document.getElementById(elementCollection[2]).style.backgroundColor = varBGColor2;
                  //    }
                  //    else if (countElement == 1) {
                  //        document.getElementById(elementCollection[0]).style.color = varColor2;
                  //        document.getElementById(elementCollection[0]).style.backgroundColor = varBGColor2;
                  //        document.getElementById(elementCollection[1]).style.color = varColor1;
                  //        document.getElementById(elementCollection[1]).style.backgroundColor = varBGColor1;
                  //        document.getElementById(elementCollection[2]).style.color = varColor2;
                  //        document.getElementById(elementCollection[2]).style.backgroundColor = varBGColor2;
                  //    }
                  //    else {
                  //        document.getElementById(elementCollection[0]).style.color = varColor2;
                  //        document.getElementById(elementCollection[0]).style.backgroundColor = varBGColor2;
                  //        document.getElementById(elementCollection[1]).style.color = varColor2;
                  //        document.getElementById(elementCollection[1]).style.backgroundColor = varBGColor2;
                  //        document.getElementById(elementCollection[2]).style.color = varColor1;
                  //        document.getElementById(elementCollection[2]).style.backgroundColor = varBGColor1;
                  //    }
                  //    countElement++;
                  //    if (countElement == 3) {
                  //        countElement = 0;
                  //    }

                  //}, 2000);


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

                  getUserProfileData();
              </script>
          </div>
              <asp:HiddenField ID="hiddenUserName" runat="server" />
              <asp:HiddenField ID="hiddenSenderEmailAddress" runat="server" />
        </div>
    </form>
</body>
</html>
