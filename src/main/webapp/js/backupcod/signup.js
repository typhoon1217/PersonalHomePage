// 회원가입 제출
function submiRegForm(event) {
	event.preventDefault(); // Prevent the default form submission
	if (RegValidation()) {
		let otherRadio = document.getElementById('Other');
		let otherInput = document.getElementById('Others');

		if (otherRadio.checked && otherInput.value.trim() !== "") {
			otherRadio.value = otherInput.value.trim();
		}

		document.getElementById('regForm').submit();
		//console.log('제출 완료.');
	} else {
		scrollToTop();
		showMessage("입력값을 확인해주세요");
		//console.log('제출 방어.');
	}
}

// Validation RegForm
function RegValidation() {

	let isValid = true;
	if (!validationID('susername')) isValid = false;
	if (!validationID('susername')) isValid = false;
	if (!validationPW('signupPW')) isValid = false;

	if (!validationConfimePW('signupPW', 'regConPW')) isValid = false;
	if (!validationEmail('regEmail')) isValid = false;

	if (!validationConfimePW('regPNone')) isValid = false;
	if (!validationConfimePW('regPNtwo')) isValid = false;

	return isValid;
}


function validationID(usernameID) {
	const usernameElement = document.getElementById(usernameID);
	const usernameval = usernameElement.value;  // Get the value of the input field
	if (usernameval === "") {
		showError("사용자명을 입력해 주세요.", usernameID);
		return false;
	} else if (!regID(usernameval)) {
		showError('사용자명은 최소 5글자 입니다.', usernameID);
		return false;
	} else {
		clearErrorMessage(usernameID);
		return true;
	}
}

//비밀번호 중복 검사
function validationConfimePW(pwID, conPwID) {
	const passwordElement = document.getElementById(pwID);
	const confimePasswordElement = document.getElementById(conPwID);
	const passwordVal = passwordElement.value;
	const confimePasswordVal = confimePasswordElement.value;

	if (passwordVal !== confimePasswordVal) {
		showError('비밀번호가 일치하지 않습니다.', confimePasswordElement);
		return false;
	} else {
		clearErrorMessage(confimePasswordElement);
		return true;
	}
}


//이메일 검사
function validationEmail(emailID) {
	const emailElement = document.getElementById(emailID);
	const emailVal = emailElement.value;
	if (emailVal == "") {
		showError("이메일을 입력해 주세요.", emailID);
		return false;
	} else if (!validationEmail(emailVal)) {
		showError('잘못된 이메일 형식입니다.', emailID);
		return false;
	} else {
		clearErrorMessage(emailID);
		return true;
	}
}


//핸드폰 번호검사 1 빈값 허용
function validatePhoneNumber(phonID) {
	const phoneElement = document.getElementById(phonID);
	const phoneVal = phoneElement.value;
	//핸드폰 번호검사 1 빈값 허용
	if (phoneVal != "") {
		clearErrorMessage(phonID);
	} else {
		if (!regPhoneNumber(phoneVal)) {
			showError('15자리 이하의 숫자만 입력 가능합니다.', phonID);
			return false;
		} else {
			clearErrorMessage(phoneNumberID);
			return true;
		}
	}
}


//회원정보 수정 제출
function submiEditUserForm(event) {
	event.preventDefault(); // Prevent the default form submission
	if (editValidation()) {
		let otherRadio = document.getElementById('Other');
		let otherInput = document.getElementById('Others');

		if (otherRadio.checked && otherInput.value.trim() !== "") {
			otherRadio.value = otherInput.value.trim();
		}

		document.getElementById('editForm').submit();
		//console.log('제출 완료.');
	} else {
		scrollToTop();
		showMessage("입력값을 확인해주세요");
		//console.log('제출 방어.');
	}

}

// Validation editForm
function editValidation() {
}


function validatePhoneNumber(phoneVal) {
	const phonenumberPattern = /^\d{1,15}$/;
	if (!phonenumberPattern.test(phoneVal.replace(/-/g, ''))) {
		return false;
	} else {
		return true;
	}
}

//nullchk is boolean 이메일 검증
function validationEmail(emailval) {
	const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if (!emailPattern.test(emailval)) {
		return false;
	} else {
		return true;
	}
}




// 비밀번호 일치확인
function confimpw(passwordID, conpwID, btnid) {
	const btn = document.getElementById(btnid);
	if (!validationPW(passwordID) || !validationConfimePW(passwordID, conpwID)) {
		showMessage('다시 입력해주세요.');
		//btn.textContent = 'Check';
		btn.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
		btn.classList.remove('hbg');
		btn.classList.add('xbg');
	} else {
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
function sendVarifyEmail(emailID, embtn) {
	const emailbtn = document.getElementById(embtn);
	if (!validationEmail(emailID)) {
		showMessage('다시 입력해주세요.');
		//emailbtn.textContent = 'Send';
	} else {
		showMessage('검사완료 처리');
		//emailbtn.textContent = 'O';
	}
	alert('아직 전송은 구현되지 않았습니다.');
}


// 사용자명 확인 팝업
function usernameCheck(usernameID) {
	if (!validationID(usernameID)) {
		showMessage('다시 입력해주세요.');
	} else {
		const username = document.getElementById(usernameID).value;
		url = "../PopUP/usernameCheck.jsp?username=" + username;
		window.open(url, "post", "width=470,height=350");
		showMessage('Username CHECK');
	}
}

// 주소입력 팝업
function zipCheck() {
	url = "../PopUP/zipCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no ,width=500 ,height=1000 , directories=no,status=yes,scrollbars=yes,menubar=no");
}


function oninputPhone(phoneid) {
	let phonenumber = document.getElementById(phoneid);
	phonenumber.value = phonenumber.value
		.replace(/[^0-9]/g, '')
		.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	validatePhoneNumber(phoneid);
}


function updateUsernameField() {
	const result = document.getElementById('susernamepass').value;
	const usernameCheckBTNElement = document.getElementById('usernameCheckBTN');
	const iconElement = usernameCheckBTNElement.querySelector('i');
	
	if (result === 'taken') {
		usernameCheckBTNElement.classList.add('xbg');
		usernameCheckBTNElement.classList.remove('obg');
		usernameCheckBTNElement.classList.remove('hbg');
		btn.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
		
	} else if (result === 'available') {
		usernameCheckBTNElement.classList.add('hbg');
		usernameCheckBTNElement.classList.remove('obg');
		usernameCheckBTNElement.classList.remove('xbg');
		btn.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
	}
}

