function onloadMsgSlide(msg, slide) {
    if (slide) {
        call_ss_js();
    }
    showMessage(msg);
}

// 상단 메시지 표시
function showMessage(message) {
    let topMsg = document.getElementById('top-msg');
    topMsg.textContent = message;
    topMsg.classList.add('show');
    setTimeout(() => {
        topMsg.classList.remove('show');
    }, 3000);
}

function setupListener(wrap, btn) {
    console.log('Setting up listener for:', wrap, 'with button:', btn);
    wrap.classList.add('open');

    const overlay = document.getElementById('overlay');
    overlay.classList.add('open');

    const handleClick = (event) => {
        console.log('Handle click:', event.target);
        const clickedInsideBtn = btn.contains(event.target);
        const clickedInsideWrap = wrap.contains(event.target);
        //i클릭 에러 해결하기 위해서 버튼 내부로 변경 버튼 내부에 i클릭시 문제가 생겼음
        if (!clickedInsideBtn && !clickedInsideWrap) {
            console.log('Clicked outside wrap or button');
            wrap.classList.remove('open');
            overlay.classList.remove('open');
            document.removeEventListener('click', handleClick);
        }
    };
    document.addEventListener('click', handleClick);
}


// 네비게이션 토글 함수
function toggleNav() {
    const nav = document.getElementById('page-select');
    const btn = document.querySelector('.pgsel');
    console.log('Toggling navigation');
    setupListener(nav, btn);
    showMessage('메뉴 팝업');
}

// 로그인 토글 함수
function toggleLogin() {
    const loginWrap = document.getElementById('login-wrap');
    const btn = document.querySelector('.login-btn');
    console.log('Toggling login');
    setupListener(loginWrap, btn);
    showMessage('로그인 팝업');
}

// 로그인 제출
function submitForm(event) {
    event.preventDefault(); // Prevent the default form submission
    if (loginValidation()) {
        document.getElementById('login-form').submit();
        console.log('제출 완료.');
    } else {
        console.log('제출 방어.');
    }
}

// 로그인 검사 함수
function loginValidation() {
    let isValid = true;
    if (!validationID('username')) {
        isValid = false;
    }
    if (!validationPW('password')) {
        isValid = false;
    }
    return isValid;
}

function validationID(usernameid) {
    const username = document.getElementById(usernameid).value;
    const usernamePattern = /^[a-zA-Z0-9]{5,}$/; // At least 5 characters, letters and numbers only
    
    if (!usernamePattern.test(username)) {
        showError('아이디는 최소 5글자 입니다.', usernameid);
        return false;
    }else{
        clearErrorMessage(usernameid);
        return true;
    }
}

function validationPW(passwordid) {
    const password = document.getElementById(passwordid).value;
    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // At least 8 characters, letters and numbers
    
    if (!passwordPattern.test(password)) {
        showError('비밀번호는 8자리의 숫자+알파벳 조합입니다.', passwordid);
        return false;
    }else{
        clearErrorMessage(passwordid);
        return true;
    }
}

function validationEmail(emailID) {
    const email = document.getElementById(emailID).value;
    const emailPattern  =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    
    if (!emailPattern.test(email)) {
        showError('잘못된 이메일 형식입니다.', emailID);
        return false;
    }else{
        clearErrorMessage(emailID);
        return true;
    }
}

function validationConfimePW(passwordID,conpwID) {
    const pid = document.getElementById(passwordID);
    const cid = document.getElementById(conpwID);
    if(pid.value!==cid.value){
        showError('비밀번호가 일치하지 않습니다.', conpwID);
        return false;
    }else{
        clearErrorMessage(conpwID);
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
        btn.textContent = 'Hide';
    } else {
        pw.type = 'password';
        btn.textContent = 'Show';

    }
}

// 비밀번호 일치확인
function confimpw(passwordID,conpwID,cbtnid) {
    const btn = document.getElementById(cbtnid);
    if(!validationPW(passwordID)||!validationConfimePW(passwordID,conpwID)){
        showMessage('다시 입력해주세요.');
        btn.textContent = 'Check';
    }else{
        showMessage('비밀번호가 일치합니다.');
        btn.textContent = 'O';
    }
}

// 회원가입 전체 비우기
function clearAllSignup() {
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';
}


// 로그인창 전체 비우기
function clearAllLogin() {
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';
}

// 한개만 비우기
function aclear(inputName) {
    document.getElementById(inputName).value = '';
}

// 화면 맨 위로 스크롤 함수
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// 화면 맨 아래로 스크롤 함수
function scrollToBottom() {
    window.scrollTo({
        top: document.body.scrollHeight,
        behavior: 'smooth'
    });
}


// 이메일 전송  (미구현)
function sendVarifyEmail(emailID,embtn) {
    const emailbtn = document.getElementById(embtn);
    if(!validationEmail(emailID)){
        showMessage('다시 입력해주세요.');
        emailbtn.textContent = 'Send';
    }else{
        showMessage('검사완료 처리');
        emailbtn.textContent = 'O';
    }
    alert('아직 전송은 구현되지 않았습니다.');
}