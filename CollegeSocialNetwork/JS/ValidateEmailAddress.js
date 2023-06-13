function ValidateEmail(txtMail, txtSpanName) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(txtMail.value)) {
        txtSpanName.innerHTML = '';
        txtSpanName.style.visibility = 'hidden';
        txtSpanName.style.color = 'white';
        txtMail.blur();
        return (true)
    } else {
        
        txtSpanName.innerHTML = 'Invalid email address!';
        txtSpanName.style.visibility = 'visible';
        txtSpanName.style.color = 'red';
        txtMail.focus();
        return (false)
    }
    
};


function ValidateNumber(txtFields, txtSpanName) {
    if (Number.isInteger(txtFields.value)) {
        txtSpanName.innerHTML = '';
        txtSpanName.style.visibility = 'hidden';
        txtSpanName.style.color = 'white';
        txtNumber.blur();
        return (true)
    } else {

        txtSpanName.innerHTML = 'Charecter not allow!';
        txtSpanName.style.visibility = 'visible';
        txtSpanName.style.color = 'red';
        txtNumber.focus();
        return (false)
    }
};

