function userAddedSuccessfully() {
    var progressbarDiv1 = $('#progressbar');
    var progressbarLable1 = $('#progressbar-label');
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarLable1.text('User Added Successfully.');
    return false;
}





function SelectTypeOfUser() {
    var progressbarDiv1 = $('#progressbar');
    var progressbarLable1 = $('#progressbar-label');
    if (document.getElementById('hiddenFieldForTypeOfUser')) {
        if (document.getElementById("hiddenFieldForTypeOfUser").value === 'N') {
            progressbarDiv1.fadeIn(1000);
            progressbarDiv1.fadeOut(3000);
            progressbarDiv1.fadeIn(1000);
            progressbarDiv1.fadeOut(3000);
            progressbarLable1.text('Please select type of user.');
        } else {
            return checkUpdateUserProfile();
        }
    }
}

function InvalidUserDetails() {
    var progressbarDiv1 = $('#progressbar');
    var progressbarLable1 = $('#progressbar-label');
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarLable1.text('Invalid user details.');
}

function RedirectToHomePage(rootUrl) {
    window.location.href = rootUrl;
}

function InputFieldIsotValid() {
    var progressbarDiv1 = $('#progressbar');
    var progressbarLable1 = $('#progressbar-label');
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarDiv1.fadeIn(1000);
    progressbarDiv1.fadeOut(3000);
    progressbarLable1.text('Input field is not valid.');
}

