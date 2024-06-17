<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="fixedWrap sad">
	<!-- 상단 메시지 출력부분 -->
	<aside class="top-msg nbg blur" id="top-msg">
		<!-- P안에 내용 출력됨 JS함수로 호출 -->
		<p id="message"></p>
	</aside>
	<!--상단바-->
	<div class="topheader nbg blur">
		<button class="btn pgsel tbg" onclick="toggleNav()">
			<i class="fa-solid fa-bars"></i>
		</button>

		<a class="logo round bbg" href="../View/Home.jsp"> <i class="tbg">
				<span class="logo2 bgbtm">>_</span> Jungwoo
		</i>
		</a>
		<button class="btn login-btn tbg" onclick="toggleLogin()">
			<i class="fa-regular fa-user"></i>
		</button>

	</div>

	<!-- 사이드 팝업 메뉴-->
	<jsp:include page="../Parts/SideBar.jsp"></jsp:include>
	<!-- 팝업UI 닫기용 오버레이-->
	<div class="overlay" id="overlay" onclick="closeLogin(event)"></div>

	<c:choose>
		<c:when test="${empty loginUserName}">
			<jsp:include page="../Parts/Login.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../Parts/UserInfor.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

	<!-- 스크롤버튼 -->
	<jsp:include page="../Parts/ScrollBTN.jsp"></jsp:include>

</div>
