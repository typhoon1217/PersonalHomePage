
// 로그인 제출
function submitLoginForm(event) {
    event.preventDefault(); // Prevent the default form submission
    if (loginValidation()) {
        document.getElementById('loginform').submit();
        console.log('제출 완료.');
    } else {
        console.log('제출 방어.');
    }
}

// 로그인 검사 함수
function loginValidation() {
    let isValid = true;
    if (!validationID('loginUsername')) {
        isValid = false;
    }
    if (!validationPW('loginPassword')) {
        isValid = false;
    }
    return isValid;
}


function validationID(usernameid) {
    const username = document.getElementById(usernameid).value;
    const usernamePattern = /^[a-zA-Z0-9]{5,}$/; // At least 5 characters, letters and numbers only
    if(username == ""){
        showError("사용자명을 입력해 주세요.", usernameid);
    }else if (!usernamePattern.test(username)) {
        showError('사용자명은 최소 5글자 입니다.', usernameid);
        return false;
    }else{
        clearErrorMessage(usernameid);
        return true;
    }
}


function validationPW(passwordid) {
    const password = document.getElementById(passwordid).value;
    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // At least 8 characters, letters and numbers
    
    if(password == ""){
        showError("비밀번호를 입력해 주세요.", passwordid);
    }else if (!passwordPattern.test(password)) {
        showError('비밀번호는 8자리의 숫자+알파벳 조합입니다.', passwordid);
        return false;
    }else{
        clearErrorMessage(passwordid);
        return true;
    }
}


// Clear error message
function clearErrorMessage(inputName) {
    const inputWrap = document.getElementById(inputName).closest('.inputwrap');
    const errorMessage = inputWrap.querySelector('.errmsg');
    errorMessage.textContent = '';
}

// Show error message
function showError(message, inputName) {
    const inputWrap = document.getElementById(inputName).closest('.inputwrap');
    const errorMessage = inputWrap.querySelector('.errmsg');
    errorMessage.textContent = message;
}

function showpw(passwordid,btnid) {
    const pw = document.getElementById(passwordid);
    const btn = document.getElementById(btnid);
    if (pw.type === 'password') {
        pw.type = 'text';
        //btn.textContent = 'Hide';
        btn.innerHTML = '<i class="fa-regular fa-eye-slash"></i>';
    	btn.classList.remove('hbg');
        btn.classList.add('xbg');
    } else {
        pw.type = 'password';
        //btn.textContent = 'Show';
        btn.innerHTML = '<i class="fa-regular fa-eye"></i>';
    	btn.classList.remove('xbg');
        btn.classList.add('hbg');
    }
}



// 로그인창 전체 비우기
function clearAllLogin() {
    document.getElementById('loginUsername').value = '';
    document.getElementById('loginPassword').value = '';
}

// 한개만 비우기
function aclear(inputName) {
    document.getElementById(inputName).value = '';
}
