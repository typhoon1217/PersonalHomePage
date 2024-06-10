<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="fixedWrap">
<!-- 상단 메시지 출력부분 -->
	<aside class="top-msg" id="top-msg">
	<!-- P안에 내용 출력됨 JS함수로 호출 -->
		<p id="message"></p>
	</aside>
<!--상단바-->
	<div class="pageSelectWrap">
		<button class="btn pgsel" onclick="toggleNav()">
			<i class="fa-solid fa-bars"></i>
		</button>
		<div class="logo"></div>
		<button class="btn login-btn" onclick="toggleLogin()">
			<i class="fa-regular fa-user"></i>
		</button>
	</div>
		
<!-- 사이드 팝업 메뉴-->
<jsp:include page="../Parts/SideBar.jsp"></jsp:include>
	<!-- 팝업UI 닫기용 오버레이-->
	<div class="overlay" id="overlay" onclick="closeLogin(event)"></div>
<!-- 로그인 팝업 메뉴-->
<jsp:include page="../Parts/Login.jsp"></jsp:include>
<!-- 스크롤버튼 -->
<jsp:include page="../Parts/ScrollBTN.jsp"></jsp:include>
</div>