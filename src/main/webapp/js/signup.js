// 회원가입 제출
function submiRegForm(event) {
    event.preventDefault(); // Prevent the default form submission
    if (RegValidation()) {
        document.getElementById('regForm').submit();
        //console.log('제출 완료.');
    } else {
        scrollToTop();
    	showMessage("입력값을 확인해주세요");
        //console.log('제출 방어.');
    }
}

// Validation RegForm
function RegValidation(){
    let isValid = true;
    if (!validationID('susername')) {
        isValid = false;
    }
    if (!validationPW('signupPW')) {
        isValid = false;
    }
    if (!validationConfimePW('signupPW','regConPW')){
        isValid = false;
	}
    if (!validationEmail('regEmail')){
        isValid = false;
	}
    if (!validatePhoneNumber('regPNone')){
        isValid = false;
	}
    if (!validatePhoneNumber('regPNtwo')){
        isValid = false;
	}
    return isValid;
}

function validatePhoneNumber(phoneNumberID) {
    const phonenumber = document.getElementById(phoneNumberID).value;
    const phonenumberPattern  =  /^\d{1,15}$/i;
    
    // 빈값 허용
    if (phonenumber === '') {
        clearErrorMessage(phoneNumberID);
        return true;
    }
    
    if (!phonenumberPattern.test(phonenumber)) {
        showError('15자리 이하의 숫자만 입력 가능합니다.', phoneNumberID);
        return false;
    } else {
        clearErrorMessage(phoneNumberID); 
        return true;
    }
}

function validationEmail(emailID) {
    const email = document.getElementById(emailID).value;
    const emailPattern  =  /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    
    if(email == ""){
        showError("이메일을 입력해 주세요.", emailID);
    }else if (!emailPattern.test(email)) {
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



// 비밀번호 일치확인
function confimpw(passwordID,conpwID,btnid) {
    const btn = document.getElementById(btnid);
    if(!validationPW(passwordID)||!validationConfimePW(passwordID,conpwID)){
        showMessage('다시 입력해주세요.');
        //btn.textContent = 'Check';
        btn.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
    	btn.classList.remove('hbg');
        btn.classList.add('xbg');
    }else{
        showMessage('비밀번호가 일치합니다.');
        //btn.textContent = 'O';
        btn.innerHTML = '<i class="fa-solid fa-o"></i>';
    	btn.classList.remove('hbg');
        btn.classList.remove('xbg');
    }
}

// 회원가입 전체 비우기
function clearAllSignup() {
    
    document.getElementById('susername').value = '';
    document.getElementById('signupPW').value = '';
    document.getElementById('regConPW').value = '';
    document.getElementById('regEmail').value = '';

    document.getElementById('regName').value = '';

    document.getElementById('Other').value = '';
    
    document.getElementById('regPNone').value = '';
    document.getElementById('regPNtwo').value = '';
    document.getElementById('regZip').value = '';
    document.getElementById('regAddOne').value = '';
    document.getElementById('regAddTwo').value = '';
    
    scrollToTop();
    showMessage("입력값을 전부 초기화 했어요");
}


// 이메일 전송  (미구현)
function sendVarifyEmail(emailID,embtn) {
    const emailbtn = document.getElementById(embtn);
    if(!validationEmail(emailID)){
        showMessage('다시 입력해주세요.');
        //emailbtn.textContent = 'Send';
    }else{
        showMessage('검사완료 처리');
        //emailbtn.textContent = 'O';
    }
    alert('아직 전송은 구현되지 않았습니다.');
}


// 이메일 전송  (미구현)
function usernameCheck(usernameID,unBTN){
    if(!validationID(usernameID)){
        showMessage('다시 입력해주세요.');
        //unBTN.textContent = 'Check';
    }else{
        const username = document.getElementById(usernameID).value;
        url="../PopUP/usernameCheck.jsp?username=" + username;
        window.open(url,"post","width=470,height=350");
        showMessage('Username CHECK');
        unBTN.textContent = 'O';
    }
}

function zipCheck(){
    url="../PopUP/zipCheck.jsp?check=y";
    window.open(url,"post","toolbar=no ,width=500 ,height=1000 , directories=no,status=yes,scrollbars=yes,menubar=no");
}