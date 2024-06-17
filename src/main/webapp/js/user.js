// 회원가입 제출
function submitRegForm(event) {
	event.preventDefault(); // Prevent the default form submission
	if(regValidation()){
		document.getElementById('regForm').submit();
		console.log('제출 완료.');
	}else{
		scrollToTop();
		//showMessage("입력값을 확인해주세요");
		console.log('제출 방어.');
		return;
	}
}
		
	/*	
		scrollToTop();
		showMessage("입력값을 확인해주세요");
		console.log('제출 방어.');
	}else{
		let otherRadio = document.getElementById('Other');
		let otherInput = document.getElementById('Others');
		if (otherRadio.checked && otherInput.value.trim() !== "") {
			otherRadio.value = otherInput.value.trim();
		}
		document.getElementById('regForm').submit();
		console.log('제출 완료.');
		
	}
}
*/

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

// 회원정보 수정 제출
function submitEditUserForm(event) {
	event.preventDefault(); // Prevent the default form submission
	if (editValidation()) {
		let otherRadio = document.getElementById('Other');
		let otherInput = document.getElementById('Others');

		if (otherRadio.checked && otherInput.value.trim() !== "") {
			otherRadio.value = otherInput.value.trim();
		}

		document.getElementById('editForm').submit();
		console.log('제출 완료.');
	} else {
		scrollToTop();
		showMessage("입력값을 확인해주세요");
		console.log('제출 방어.');
	}
}

// Validation reg Functions
function regValidation() {
	let isValid = true;
	if (!validationID('susername')) isValid = false;
	if (!validationPW('signupPW')) isValid = false;
	if (!validationConfirmPW('signupPW', 'regConPW')) isValid = false;
	if (!validationEmail('regEmail')) isValid = false;
	if (!validatePhoneNumber('regPNone')) isValid = false;
	if (!validatePhoneNumber('regPNtwo')) isValid = false;
	return isValid;
}

function loginValidation() {
	let isValid = true;
	if (!validationID('loginUsername')) isValid = false;
	if (!validationPW('loginPassword')) isValid = false;
	return isValid;
}

function editValidation() {
	// Add validation logic for edit form if needed
	return true; // Placeholder return
}

// Input Validation Functions
function validationID(usernameID) {
	const usernameElement = document.getElementById(usernameID);
	const usernameVal = usernameElement.value;
	if (usernameVal === "") {
		showError("사용자명을 입력해 주세요.", usernameID);
		return false;
	} else if (!regID(usernameVal)) {
		showError('사용자명은 최소 5글자 입니다.', usernameID);
		return false;
	} else {
		clearErrorMessage(usernameID);
		return true;
	}
}

function validationPW(passwordID) {
	const passwordElement = document.getElementById(passwordID);
	const passwordVal = passwordElement.value;
	if (passwordVal === "") {
		showError("비밀번호를 입력해 주세요.", passwordID);
		return false;
	} else if (!regPW(passwordVal)) {
		showError('비밀번호는 8자리의 숫자+알파벳 조합입니다.', passwordID);
		return false;
	} else {
		clearErrorMessage(passwordID);
		return true;
	}
}



function validationEmail(emailID) {
	const emailElement = document.getElementById(emailID);
	const emailVal = emailElement.value;
	if (emailVal === "") {
		showError("이메일을 입력해 주세요.", emailID);
		return false;
	} else if (!validateEmailFormat(emailVal)) {
		showError('잘못된 이메일 형식입니다.', emailID);
		return false;
	} else {
		clearErrorMessage(emailID);
		return true;
	}
}

function validatePhoneNumber(phoneID) {
	const phoneElement = document.getElementById(phoneID);
	const phoneVal = phoneElement.value;
	if (phoneVal === "") {
		clearErrorMessage(phoneID);
		return true; // Phone number can be empty
	} else if (!regPhoneNumber(phoneVal)) {
		showError('15자리 이하의 숫자만 입력 가능합니다.', phoneID);
		return false;
	} else {
		clearErrorMessage(phoneID);
		return true;
	}
}

// Utility Functions
function validateEmailFormat(emailVal) {
	const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	return emailPattern.test(emailVal);
}

function validatePhoneNumberFormat(phoneVal) {
	const phonePattern = /^\d{1,15}$/;
	return phonePattern.test(phoneVal.replace(/-/g, ''));
}

function regID(usernameVal) {
	const usernamePattern = /^[a-zA-Z0-9]{5,}$/; // At least 5 characters, letters and numbers only
	return usernamePattern.test(usernameVal);
}

function regPW(passwordVal) {
	const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // At least 8 characters, letters and numbers
	return passwordPattern.test(passwordVal);
}

function regPhoneNumber(phoneVal) {
	return validatePhoneNumberFormat(phoneVal);
}

// Show and Clear Error Messages
function showError(message, inputID) {
	const inputWrapElement = document.getElementById(inputID).closest('.inputwrap');
	const errorMessage = inputWrapElement.querySelector('.errmsg');
	errorMessage.textContent = message;
}

function clearErrorMessage(inputWrapID) {
	const inputElement = document.getElementById(inputWrapID).closest('.inputwrap');
	const errorMessage = inputElement.querySelector('.errmsg');
	errorMessage.textContent = '';
}

// Password Visibility Toggle
function showpw(passwordID, btnID) {
	const pw = document.getElementById(passwordID);
	const btn = document.getElementById(btnID);
	if (pw.type === 'password') {
		pw.type = 'text';
		btn.innerHTML = '<i class="fa-regular fa-eye-slash"></i>';
		btn.classList.remove('hbg');
		btn.classList.add('xbg');
	} else if(pw.type==='text'){
		pw.type = 'password';
		btn.innerHTML = '<i class="fa-regular fa-eye"></i>';
		btn.classList.remove('xbg');
		btn.classList.add('hbg');
	}
}

// Clear Inputs
function clearAllLogin() {
	document.getElementById('loginUsername').value = '';
	document.getElementById('loginPassword').value = '';
}

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

function clearInput(inputID) {
	document.getElementById(inputID).value = '';
}

// Utility Actions
function sendVerifyEmail(emailID, btnID) {
	const emailBtn = document.getElementById(btnID);
	if (!validationEmail(emailID)) {
		showMessage('다시 입력해주세요.');
	} else {
		showMessage('검사완료 처리');
	}
	alert('아직 전송은 구현되지 않았습니다.');
}

function zipCheck() {
	const url = "../PopUP/zipCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no ,width=500 ,height=1000 , directories=no,status=yes,scrollbars=yes,menubar=no");
}

function onInputPhone(phoneID) {
	let phoneNumber = document.getElementById(phoneID);
	phoneNumber.value = phoneNumber.value
		.replace(/[^0-9]/g, '')
		.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	validatePhoneNumber(phoneID);
}

function usernameCheck(usernameID) {
	if (!validationID(usernameID)) {
		showMessage('다시 입력해주세요');
	} else {
		const usernameElement = document.getElementById(usernameID).value;
		const url = "../PopUP/usernameCheck.jsp?username=" + usernameElement;
		window.open(url, "post", "width=470,height=350");
	}
}

function updateUsernameField() {
	const result = document.getElementById('susernamepass').value;
	const usernameCheckBtnElement = document.getElementById('usernameCheckBTN');

	if (result == 'taken') {
		usernameCheckBtnElement.classList.add('xbg');
		usernameCheckBtnElement.classList.remove('obg');
		usernameCheckBtnElement.classList.remove('hbg');
		usernameCheckBtnElement.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
		showMessage("아이디 중복 확인 실패");
	} else if (result == 'available') {
		usernameCheckBtnElement.classList.add('hbg');
		usernameCheckBtnElement.classList.remove('obg');
		usernameCheckBtnElement.classList.remove('xbg');
		usernameCheckBtnElement.innerHTML = '<i class="fa-solid fa-o"></i>';
		showMessage("아이디 중복 확인 통과");
	}
}

function updateEmailField() {
	const result = document.getElementById('susernamepass').value;
	const usernameCheckBtnElement = document.getElementById('usernameCheckBTN');

	if (result == 'taken') {
		usernameCheckBtnElement.classList.add('xbg');
		usernameCheckBtnElement.classList.remove('obg');
		usernameCheckBtnElement.classList.remove('hbg');
		usernameCheckBtnElement.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
		showMessage("아이디 중복 확인 실패");
	} else if (result == 'available') {
		usernameCheckBtnElement.classList.add('hbg');
		usernameCheckBtnElement.classList.remove('obg');
		usernameCheckBtnElement.classList.remove('xbg');
		usernameCheckBtnElement.innerHTML = '<i class="fa-solid fa-o"></i>';
		showMessage("아이디 중복 확인 통과");
	}
}

function emailCheck(emailID) {
	if (!validationEmail(emailID)) {
		showMessage('다시 입력해주세요');
	} else {
		const emailElement = document.getElementById(emailID).value;
		const url = "../PopUP/emailDupCheck.jsp?email=" + emailElement;
		window.open(url, "post", "width=470,height=350");
	}
}

// 비밀번호 일치 확인 및 버튼 상태 변경    validationConfirmPW 을 호풀해야되서 변수명 하드코드함 
//추후 다른필드에서 재사용시 공식을 새로만들것
function confimpw() {
	const btn = document.getElementById('regChkPWBTN');
	if (!validationPW('signupPW') || !validationConfirmPW('signupPW', 'regConPW')) {
		// Corrected function name
		showMessage('다시 입력해주세요.');
		btn.innerHTML = '<i class="fa-solid fa-triangle-exclamation"></i>';
		btn.classList.remove('hbg');
		btn.classList.add('xbg');
	} else {
		showMessage('비밀번호가 일치합니다.');
		btn.innerHTML = '<i class="fa-solid fa-o"></i>';
		btn.classList.add('hbg');
		btn.classList.remove('xbg');
	}
}

//비밀번호 중복 검사
function validationConfirmPW(pwID, conPwID) {
	const passwordElement = document.getElementById(pwID);
	const confimePasswordElement = document.getElementById(conPwID);
	const passwordVal = passwordElement.value;
	const confimePasswordVal = confimePasswordElement.value;

	if (passwordVal != confimePasswordVal) {
		showError('비밀번호가 일치하지 않습니다.', conPwID);
		return false;
	} else {
		clearErrorMessage(conPwID);
		return true;
	}
}

// 한개만 비우기
function aclear(inputid) {
	let inputElement = document.getElementById(inputid);
	if (inputElement) {
		inputElement.value = '';
	} else {
		console.error(`Element with ID ${inputid} not found.`);
	}
}

// 핸드폰 번호 입력 포맷팅
function oninputPhone(phoneID) {
	let phonenumber = document.getElementById(phoneID);
	phonenumber.value = phonenumber.value
		.replace(/[^0-9]/g, '')
		.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	validatePhoneNumber(phoneID);
}

// 이메일 전송  (미구현)
function sendVarifyEmail(emailID, embtn) {
	const embtnElement = document.getElementById(embtn);
	if (!validationEmail(emailID)) {
		showMessage('다시 입력해주세요.');
	} else {
		showMessage('검사완료 처리');
	}
	alert('아직 전송은 구현되지 않았습니다.');
}
