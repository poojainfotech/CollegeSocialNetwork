////window.addEventListener('beforeunload', function (e) {
////    e.preventDefault();
////    e.returnValue = '';
////});


function myFunction(elementId, invalidUser, errorMsg, addedSuccessfully) {
    if (invalidUser == '' || invalidUser == null) {
        if (errorMsg != null) {
            alert('' + errorMsg + '');
            elementId.focus = true;
            return false;
        }
    }
    if (invalidUser) {
        alert('Not a valid user.');
        return false;
    }

    if (addedSuccessfully) {
        alert('User added successfully.');
        return false;
    }
};

function functionInvalidUser(invalidUser) {
    if (invalidUser) {
        alert('Not a valid user.');
        return false;
    }
};




function checkUserDetails() {
    if (document.getElementById('txtUserName').value == '') {
        alert('Input value is not valid, Please enter user name.');
        document.getElementById('txtUserName').focus();
        return false;
    }
    if (document.getElementById('txtUserPassword').value == '') {
        alert('Input value is not valid, Please enter user password.');
        document.getElementById('txtUserPassword').focus();
        return false;
    }

    if (document.getElementById('txtUserCollegeCode').value == '') {
        alert('Input value is not valid, Please enter college code.');
        document.getElementById('txtUserCollegeCode').focus();
        return false;
    }
};

function checkUpdateUserProfile() {


    if (document.getElementById('ddlTypeColledgeCode').value == '-1') {
        alert('Input value is not valid, Please select colledge code.');
        document.getElementById('ddlTypeColledgeCode').focus();
        return false;
    }

    if (document.getElementById('txtUserName')) {
        if (document.getElementById('txtUserName').value == '') {
            alert('Input value is not valid, Please enter user name.');
            document.getElementById('txtUserName').focus();
            return false;
        }
    }

    //if (document.getElementById('fileUploadImage').value == '') {
    //    alert('Input value is not valid, Please select user image.');
    //    document.getElementById('fileUploadImage').focus();
    //    return false;
    //}

    if (document.getElementById('txtUserPassword')) {
        if (document.getElementById('txtUserPassword').value == '') {
            alert('Input value is not valid, Please enter user password.');
            document.getElementById('txtUserPassword').focus();
            return false;
        }
    }

    if (document.getElementById('txtUserConfirmPassword')) {
        if (document.getElementById('txtUserConfirmPassword').value == '') {
            alert('Input value is not valid, Please enter user confirm password.');
            document.getElementById('txtUserConfirmPassword').focus();
            return false;
        }
    }

    if (document.getElementById('txtUserPassword') && document.getElementById('txtUserConfirmPassword')) {
        if (document.getElementById('txtUserPassword').value != document.getElementById('txtUserConfirmPassword').value) {
            alert('Input value is not valid, user password and user confirm password are not same.');
            document.getElementById('txtUserPassword').focus();
            return false;
        }
    }

    if (document.getElementById('txtUserParentName')) {
        if (document.getElementById('txtUserParentName').value == '') {
            alert('Input value is not valid, Please enter parent name.');
            document.getElementById('txtUserParentName').focus();
            return false;
        }
        
    }

    if (document.getElementById('txtUserParentPassword')) {
        if (document.getElementById('txtUserParentPassword').value == '') {
            alert('Input value is not valid, Please enter parent password.');
            document.getElementById('txtUserParentPassword').focus();
            return false;
        }
    }

    if (document.getElementById('txtUserParentConfirmPassword')) {
        if (document.getElementById('txtUserParentConfirmPassword').value == '') {
            alert('Input value is not valid, Please enter user parent confirm password.');
            document.getElementById('txtUserParentConfirmPassword').focus();
            return false;
        }
        
    }

    if (document.getElementById('txtUserParentPassword') && document.getElementById('txtUserParentConfirmPassword')) {
        if (document.getElementById('txtUserParentPassword').value != document.getElementById('txtUserParentConfirmPassword').value) {
            alert('Input value is not valid, parent password and parent confirm password are not same.');
            document.getElementById('txtUserParentPassword').focus();
            return false;
        }
    }

    if (document.getElementById('txtFirstName').value == '') {
        alert('Input value is not valid, Please enter user first name.');
        document.getElementById('txtFirstName').focus();
        return false;
    }
    if (document.getElementById('txtLastName').value == '') {
        alert('Input value is not valid, Please enter user last name.');
        document.getElementById('txtLastName').focus();
        return false;
    }

    if (document.getElementById('ddlStudentCourse').value == '-1') {
        alert('Input value is not valid, Please select course.');
        document.getElementById('ddlStudentCourse').focus();
        return false;
    }

    if (document.getElementById('txtEmailAddress').value == '') {
        alert('Input value is not valid, Please enter user email address.');
        document.getElementById('txtEmailAddress').focus();
        return false;
    }

    if (document.getElementById('txtPremises').value == '') {
        alert('Input value is not valid, Please enter user premises.');
        document.getElementById('txtPremises').focus();
        return false;
    }

    if (document.getElementById('txtDateOfBirth').value == '') {
        alert('Input value is not valid, Please enter user date of birth.');
        document.getElementById('txtDateOfBirth').focus();
        return false;
    }

    if (document.getElementById('ddlGender').value == '-1') {
        alert('Input value is not valid, Please select gender.');
        document.getElementById('ddlGender').focus();
        return false;
    }

    if (document.getElementById('txtPinNo').value == '') {
        alert('Input value is not valid, Please enter pin no.');
        document.getElementById('txtPinNo').focus();
        return false;
    }

    if (document.getElementById('txtCity').value == '') {
        alert('Input value is not valid, Please enter city.');
        document.getElementById('txtCity').focus();
        return false;
    }

    if (document.getElementById('txtState').value == '') {
        alert('Input value is not valid, Please enter state.');
        document.getElementById('txtState').focus();
        return false;
    }

    if (document.getElementById('txtCoutry').value == '') {
        alert('Input value is not valid, Please enter country.');
        document.getElementById('txtCoutry').focus();
        return false;
    }

    if (document.getElementById('txtPhone').value == '') {
        alert('Input value is not valid, Please enter user phone no.');
        document.getElementById('txtPhone').focus();
        return false;
    }
};



function validateUserFields(txtName, txtSpanName, bCheck, alertMsg, numberNotAllow, charecterNotAllow, checkPasswordAndConformPassword,text1,text2) {
    if (txtName.value == '') {
        txtSpanName.innerHTML = alertMsg;
        txtSpanName.style.visibility = 'visible';
        txtSpanName.style.color = 'red';
        txtName.focus();
        return false;
    }
    else {
        if (txtName.value != '' && bCheck === true) {
            if (checkIfStringHasSpecialChar(txtName.value)) {
                txtSpanName.innerHTML = 'Special characters not allow.';
                txtSpanName.style.color = 'red';
                txtSpanName.style.visibility = "visible";
                txtName.focus();
                return false;
            }
            else {
                if (numberNotAllow) {
                    if (stringContainsNumber(txtName.value)) {
                        txtSpanName.innerHTML = 'Digit not allow!';
                        txtSpanName.style.visibility = 'visible';
                        txtSpanName.style.color = 'red';
                        txtName.focus();
                        return false;
                    } else {
                        txtSpanName.innerHTML = '*';
                        txtSpanName.style.color = 'white';
                        txtSpanName.style.visibility = "hidden";
                    }
                } else if (charecterNotAllow)
                {
                    if (stringContainsCharacter(txtName.value)) {
                        txtSpanName.innerHTML = 'Character not allow!';
                        txtSpanName.style.visibility = 'visible';
                        txtSpanName.style.color = 'red';
                        txtName.focus();
                        return false;
                    } else {
                        txtSpanName.innerHTML = '*';
                        txtSpanName.style.color = 'white';
                        txtSpanName.style.visibility = "hidden";
                    }
                }
                else {
                    txtSpanName.innerHTML = '*';
                    txtSpanName.style.color = 'white';
                    txtSpanName.style.visibility = "hidden";
                }
            }
        }
        else {
            txtSpanName.innerHTML = '*';
            txtSpanName.style.color = 'white';
            txtSpanName.style.visibility = "hidden";
        }
        if (checkPasswordAndConformPassword) {
            if (text1.value != text2.value) {
                alert('Password and confirm password are not same.');
                text1.focus();
            }
        }
    }
};
        
function checkIfStringHasSpecialChar(_string) {
    let spChars = /[!#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if (spChars.test(_string)) {
        return true;
    } else {
        return false;
    }
};
    
function stringContainsNumber(txtFields) {
    let pattern = /[0-9]/g;
    let result = txtFields.match(pattern);
    if (result === null) {
        return false;
    }
    else {
        return true;
    }
};

function stringContainsCharacter(txtFields) {
    let pattern = /[^0-9]/g;
    let result = txtFields.match(pattern);
    if (result === null) {
        return false;
    }
    else {
        return true;
    }
};


function diableEnableInputField() {
    var selectedValue = document.getElementById("ddlTypeOfUser").value;
    if (selectedValue === 'Student') {
        if (document.getElementById('hiddenFieldForTypeOfUser')) {
            document.getElementById("hiddenFieldForTypeOfUser").value = 'Y';
        }
        document.getElementById("txtUserName").disabled = false;
        document.getElementById("fileUploadImage").disabled = false;
        document.getElementById("txtUserPassword").disabled = false;
        document.getElementById("txtUserParentName").disabled = false;
        document.getElementById("txtUserParentPassword").disabled = false;
        document.getElementById("txtUserParentConfirmPassword").disabled = false;
        document.getElementById("txtFirstName").disabled = false;
        document.getElementById("txtLastName").disabled = false;
        document.getElementById("txtEmailAddress").disabled = false;
        document.getElementById("txtPremises").disabled = false;
        document.getElementById("ddlGender").disabled = false;
        document.getElementById("txtCity").disabled = false;
        document.getElementById("txtCoutry").disabled = false;
        document.getElementById("txtUserConfirmPassword").disabled = false;
        document.getElementById("txtMiddleName").disabled = false;
        document.getElementById("ddlTypeColledgeCode").disabled = false;
        document.getElementById("ddlStudentCourse").disabled = false;
        document.getElementById("ddlTypeColledgeCode").disabled = false;
        document.getElementById("ddlStudentCourse").disabled = false;
        document.getElementById("txtDateOfBirth").disabled = false;
        document.getElementById("txtPinNo").disabled = false;
        document.getElementById("txtState").disabled = false;
        document.getElementById("txtPhone").disabled = false;
    } else if (selectedValue === 'Faculty') {
        if (document.getElementById('hiddenFieldForTypeOfUser')) {
            document.getElementById("hiddenFieldForTypeOfUser").value = 'Y';
        }
        document.getElementById("txtUserName").disabled = false;
        document.getElementById("fileUploadImage").disabled = false;
        document.getElementById("txtUserPassword").disabled = false;
        document.getElementById("txtUserParentName").disabled = false;
        document.getElementById("txtUserParentPassword").disabled = false;
        document.getElementById("txtUserParentConfirmPassword").disabled = false;
        document.getElementById("txtFirstName").disabled = false;
        document.getElementById("txtLastName").disabled = false;
        document.getElementById("txtEmailAddress").disabled = false;
        document.getElementById("txtPremises").disabled = false;
        document.getElementById("ddlGender").disabled = false;
        document.getElementById("txtCity").disabled = false;
        document.getElementById("txtCoutry").disabled = false;
        document.getElementById("txtUserConfirmPassword").disabled = false;        
        document.getElementById("txtMiddleName").disabled = false;
        document.getElementById("ddlTypeColledgeCode").disabled = false;
        document.getElementById("ddlStudentCourse").disabled = false;
        document.getElementById("ddlTypeColledgeCode").disabled = false;
        document.getElementById("ddlStudentCourse").disabled = false;
        document.getElementById("txtDateOfBirth").disabled = false;
        document.getElementById("txtPinNo").disabled = false;
        document.getElementById("txtState").disabled = false;
        document.getElementById("txtPhone").disabled = false;
    } else {
        if (document.getElementById('hiddenFieldForTypeOfUser')) {
            document.getElementById("hiddenFieldForTypeOfUser").value = 'N';
        }
        document.getElementById("txtUserName").disabled = true;
        document.getElementById("fileUploadImage").disabled = true;
        document.getElementById("txtUserPassword").disabled = true;
        document.getElementById("txtUserParentName").disabled = true;
        document.getElementById("txtUserParentPassword").disabled = true;
        document.getElementById("txtFirstName").disabled = true;
        document.getElementById("txtLastName").disabled = true;
        document.getElementById("txtEmailAddress").disabled = true;
        document.getElementById("txtPremises").disabled = true;
        document.getElementById("ddlGender").disabled = true;
        document.getElementById("txtCity").disabled = true;
        document.getElementById("txtCoutry").disabled = true;
        document.getElementById("txtUserConfirmPassword").disabled = true;
        document.getElementById("txtUserParentConfirmPassword").disabled = true;
        document.getElementById("txtMiddleName").disabled = true;
        document.getElementById("ddlStudentCourse").disabled = true;
        document.getElementById("ddlTypeColledgeCode").disabled = true;
        document.getElementById("ddlStudentCourse").disabled = true;
        document.getElementById("txtDateOfBirth").disabled = true;
        document.getElementById("txtPinNo").disabled = true;
        document.getElementById("txtState").disabled = true;
        document.getElementById("txtPhone").disabled = true;
    }
};
