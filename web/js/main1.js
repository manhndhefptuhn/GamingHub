function revealPassword() {
  var passwordInput = document.getElementById("your-pass");
  var passwordInput2 = document.getElementById("your-pass2");
  var revealCheckbox = document.getElementById("reveal-checkbox");

  if (revealCheckbox.checked) {
    passwordInput.type = "text";
    passwordInput2.type = "text";
  } else {
    passwordInput.type = "password";
    passwordInput2.type = "password";
  }
}

