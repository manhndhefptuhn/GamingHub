function togglePasswordVisibility() {
    var passwordInput = document.getElementById('loginPassword');
    var revealCheckbox = document.getElementById('revealCheckbox');

    if (revealCheckbox.checked) {
        passwordInput.type = 'text';
    } else {
        passwordInput.type = 'password';
    }
}

function revealPassword() {
    var passwordInput1 = document.getElementById('old-Pass');
    var passwordInput2 = document.getElementById('your-pass');
    var passwordInput3 = document.getElementById('your-pass2');
    var revealCheckbox = document.getElementById('reveal-checkbox');

    if (revealCheckbox.checked) {
        passwordInput1.type = 'text';
        passwordInput2.type = 'text';
        passwordInput3.type = 'text';
    } else {
        passwordInput1.type = 'password';
        passwordInput2.type = 'password';
        passwordInput3.type = 'password';
    }
}

function revealPassword1() {
    var passwordInput2 = document.getElementById('your-pass');
    var passwordInput3 = document.getElementById('your-pass2');
    var revealCheckbox = document.getElementById('reveal-checkbox');

    if (revealCheckbox.checked) {
        passwordInput2.type = 'text';
        passwordInput3.type = 'text';
    } else {
        passwordInput2.type = 'password';
        passwordInput3.type = 'password';
    }
}

function openPopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'block';
}

function closePopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'none';
}
