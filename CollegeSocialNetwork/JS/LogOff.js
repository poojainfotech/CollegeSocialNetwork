setInterval(function () {
    PageMethods.GetActiveUser(onSuccess, onFailure);
}, 10);

function logout() {
    PageMethods.SessionExpire(Success, Failure);
}

function GetName() {
    PageMethods.Name(Success, Failure);
}

function Success(result) {
    window.location.href = '../Login/CSNLogin.aspx';
}

function Failure(error) {
    alert(error);
}

function onSuccess(result) {
    document.getElementById('lblCurrentUser').innerHTML = 'Active User : ' + result;
}

function onFailure(error) {
    alert(error);
}