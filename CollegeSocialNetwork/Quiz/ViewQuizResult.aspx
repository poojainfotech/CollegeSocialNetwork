<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewQuizResult.aspx.cs" Inherits="CollegeSocialNetwork.Quiz.TestResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script> 
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../JS/UserAddedSuccessfully.js"></script>
    <script type="text/javascript">  
        function generateReportCardsInPdf() {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = dd + '_' + mm + '_' + yyyy + '_' + today.getMinutes() + '_' + today.getSeconds();

            var fileName = document.getElementById('HiddenFieldUserName').value + "_" + today;


            var form = $('#reportCard'),
            cache_width = form.width(),
            a4 = [595.28, 841.89]; // for a4 size paper width and height  
            $('body').scrollTop(0);
            createPDF();
            //create pdf  
            function createPDF() {
                getCanvas().then(function (canvas) {
                    var
                        img = canvas.toDataURL("image/png"),
                        doc = new jsPDF({
                            unit: 'px',
                            format: 'a4'
                        });
                    doc.addImage(img, 'JPEG', 20, 20);
                    doc.save(fileName + '.pdf');
                    form.width(cache_width);
                });
            }

            // create canvas object  
            function getCanvas() {
                form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
                return html2canvas(form, {
                    imageTimeout: 2000,
                    removeContainer: true
                });
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
                          <b style="color:orangered; text-align:left; font-family:fantasy; font-size:20px;">Test Report Cards</b>
                      </td>
                  </tr>
                  <tr>
                      <td id="logo" style="height:40px; width:4%; background:#6699cc;border-radius: 50%;font-size:10px;border-color:aquamarine;color:#d9d9d9; text-align:center;font-family:fantasy; font-size:20px;">                         
                         <b>T. R. C.</b>
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
                          <div  id="boxes-list" style="width:100%; height:384px; overflow:auto;">
                            <table id="reportCard" style=" width:87.8%; margin-left:8.3%; font-size:13.5px; border-collapse:collapse; ">
                              <% if (ViewResultData != null && ViewResultData.Rows.Count >= 0) %>
                              <% { %>
<%--                                    <tr style=" background-color:#99ddff;">    
                                        <td colspan="1" style="width:10%; text-align:right;">                         
                                        </td>
                                        <td colspan="8" style="width:10%;">
                                        </td>
                                    </tr>--%>
                                    <tr style=" font-weight:bold; background-color:#00ace6; ">    
                                            
                                        <td style="width:10%;">
                                        </td>
                                        <td style="width:10%;">
                                            Student Name                                                    
                                        </td>
                                        <td style="width:10%;">
                                            Father Name
                                        </td>
                                        <td style="width:10%;">
                                            CourseName
                                        </td>
                                        <td style="width:10%;">
                                            Acadamic Year
                                        </td>
                                        <td style="width:10%;">
                                            Subject
                                        </td>
                                        <td style="width:10%;">
                                            Mark
                                        </td>
                                        <td style="width:10%;">
                                            Grade
                                        </td>
                                        <td style="width:10%;">

                                        </td>
                                    </tr>                              
                                    <tr style="background-color:#99e6ff; ">    
                                            
                                        <td style="width:10%;">
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["FirstName"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["UserParentFirstName"] %>&nbsp;&nbsp;&nbsp;&nbsp;<%:ViewResultData.Rows[0]["UserParentLastName"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["CourseName"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["AcadamicYear"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["Subject"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["Mark"] %>
                                        </td>
                                        <td style="width:10%;">
                                            <%:ViewResultData.Rows[0]["Grade"] %>
                                        </td>
                                        <td style="width:10%;">
                                            
                                        </td>
                                    </tr>                              
                              <% } %>
                              <% else %>
                              <% { %>
                                      <tr style=" background-color:#ccf2ff;">
                                        <td colspan="1" style="text-align:right;">
                      
                                        </td>
                                        <td colspan="9" style="padding-left:3px; color:red;">
                                           No Report Card Available.
                                        </td>
                                     </tr>

                              <% } %>
                                    <tr style=" background-color:#ccf2ff;">    
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
                            </table>
                          </div>
                      </td>
                  </tr>

                  <tr>
                      <td style="width:7%; height:10px;">                         
                         <asp:Button ID="btnBackToHome" ForeColor="#ff6666" runat="server" Text="Back To Home" class="button" OnClick="btnBackToHome_Click" />                       
                      </td>
                      <td style="width:10%; text-align:right;">
                       <input type="button" id="create_pdf" value="Generate PDF" onclick="generateReportCardsInPdf()" class="button" />                
                      </td>
                      <td style="width:10%; text-align:right;">
                          
                      </td>
                      <td style="width:10%; text-align:right;">
                          
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
            <asp:HiddenField ID="hiddenPreviousCount" runat="server" />
            <asp:HiddenField ID="HiddenNextCount" runat="server" />
            <asp:HiddenField ID="HiddenQuestionAnswerDetails" runat="server" />
            <asp:HiddenField ID="HiddenFieldUserName" runat="server" />
        </div>
    </form>
</body>
</html>
