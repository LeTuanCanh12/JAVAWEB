const form = document.getElementById('form');
const username = document.getElementById('username');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');

// form.addEventListener('submit', (e) => {
//     e.preventDefault();
//
//     checkInputs();
// });
function checkInputs() {
    const usernameValue = username.value.trim();
    const emailValue = email.value.trim();
    const passwordValue = password.value.trim();
    const password2Value = password2.value.trim();
    if (usernameValue == '') {
        //error
        //add error
        setErrorFor(username, 'Tên người dùng không được bỏ trống');

    } else {
        setSuccessFor(username);

    }
    if (emailValue == '') {
        setErrorFor(email, 'Email không được bỏ trống');


    } else if (isEmail(emailValue) != true) {
        setErrorFor(email, 'Email không hợp lệ');
    } else {
        setSuccessFor(email);
    }

   


    if (passwordValue == '') {
        setErrorFor(password, 'Mật khẩu không được bỏ trống');
    } else if (!isPassword(passwordValue)) {
        setErrorFor(password, 'Mật Khẩu không hợp lệ')
    } else {
        setSuccessFor(password);
    }
    if (password2Value == '') {
        setErrorFor(password2, 'Mật khẩu không được bỏ trống');
    } else if (passwordValue !== password2Value) {
        setErrorFor(password2, 'Mật Khẩu không đúng')
    } else {
        setSuccessFor(password2);
    }



    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');

        small.innerText = message;

        formControl.className = 'form-control error';
    }
    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = 'form-control success';

    }
    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
    function isPassword(password) {
        return /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(password);
    }

}