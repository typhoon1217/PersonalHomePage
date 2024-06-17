function onload(){
	 try {call_ss_js()    } catch (error) {
        console.log("slideerrornoslide");
    }
    
	
};

// showMessage function
function showMessage(message) {
    console.log("showMessage called with message:", message); // Debug log
    let topMsg = document.getElementById('top-msg');
    if (!topMsg) {
        console.error("Element with ID 'top-msg' not found.");
        return;
    }
    topMsg.textContent = message;
    topMsg.classList.add('show');
    setTimeout(() => {
        topMsg.classList.remove('show');
    }, 3000);
}

function setupListener(wrap, btn) {
    console.log('Setting up listener for:', wrap, 'with button:', btn);
    wrap.classList.toggle('open');

    const overlay = document.getElementById('overlay');
    overlay.classList.toggle('open');

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
    //console.log('Toggling navigation');
    setupListener(nav, btn);
}
// 네비게이션 리스트 토글함수
function toggleList(btnID,listID) {
    const btn = document.getElementById(btnID);
    const listquery = document.getElementById(listID);
    listquery.classList.toggle('toglist');
    btn.classList.toggle('fa-chevron-down');
    btn.classList.toggle('fa-chevron-up');
}

function toggleList2(btnID,listID) {
    const btn = document.getElementById(btnID);
    const listquery = document.getElementById(listID);
    listquery.classList.toggle('toglist');
    btn.classList.toggle('fa-chevron-down');
    btn.classList.toggle('fa-chevron-up');
}


// 로그인 토글 함수
function toggleLogin() {
    const loginWrap = document.getElementById('login-wrap');
    const btn = document.querySelector('.login-btn');
    //console.log('Toggling login');
    setupListener(loginWrap, btn);
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



