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

		<a class="logo box" href="../View/Home.jsp">
			<p>>_</p>
			<i>Jungwoo</i>
		</a>

		<button class="btn login-btn" onclick="toggleLogin()">
			<i class="fa-regular fa-user"></i>
		</button>

		<a class="btn home-btn hide" href="../View/Home.jsp">
			<i class="fa-solid fa-house"></i>
		</a>
	</div>

	<!-- 사이드 팝업 메뉴-->
	<jsp:include page="../Parts/SideBar.jsp"></jsp:include>
	<!-- 팝업UI 닫기용 오버레이-->
	<div class="overlay" id="overlay" onclick="closeLogin(event)"></div>
	
<%
String loginUserName = (String)session.getAttribute("loginUserName");
if(loginUserName==null){;
%>
<!-- 로그인 팝업 메뉴-->
	<jsp:include page="../Parts/Login.jsp"></jsp:include>
<%}else{%>
<!-- 로그인 팝업 메뉴-->
<jsp:include page="../Parts/UserInfor.jsp"></jsp:include>
<%}%>
	<!-- 스크롤버튼 -->
	<jsp:include page="../Parts/ScrollBTN.jsp"></jsp:include>
</div>