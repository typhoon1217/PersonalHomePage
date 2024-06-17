<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- -----------------메인페이지용 -->
<c:set var="ver" value="11312" />

<c:choose>
	<c:when test="${param.msg == null}">
		<c:set var="msg" value="버전${ver}" />
	</c:when>
	<c:otherwise>
		<c:set var="msg" value="${param.msg}" />
	</c:otherwise>
</c:choose>
<c:set var="pageReq" value="${param.pageReq}" />
<c:set var="popup" value="${param.popup}" />
<!-- -----------------메인 포합 일부페이지용 -->
<c:set var="loginUserName" value="${sessionScope.loginUserName}" />
<!-- -----------------메인페이지안씀 -->
<c:set var="role" value="${sessionScope.role}" />
<c:set var="userpic" value="${sessionScope.userpic}" />
<!-- -----------------테마 서브페이지도 씀 -->
<c:set var="theme" value="${sessionScope.theme}" />
<c:set var="thememode" value="${sessionScope.thememode}" />
<c:set var="wallpaper" value="${sessionScope.wallpaper}" />

<c:if test="${empty theme}">
	<c:set var="theme" value="default_theme" />
</c:if>
<c:if test="${not empty thememode and not empty theme}">
	<c:set var="theme" value="${theme}_${thememode}" />
</c:if>


<c:choose>
	<c:when test="${not empty wallpaper and not empty loginUserName}">
		<c:set var="userWallpaperURL"
			value="../img/users/${loginUserName}/USER/wallpaper/${wallpaper}.jpg" />
	</c:when>
	<c:otherwise>
		<c:set var="userWallpaperURL"
			value="../img/default/wallpaper/wallpaper.jpg" />
	</c:otherwise>
</c:choose>

<!-- ----------------- -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jungwoo</title>
<link rel="icon" href="../img/default/favicon/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="../css/${theme}.css?${ver}">
<link rel="stylesheet" href="../css/style.css?${ver}">

<c:if test="${pageReq eq 'Main'}">
	<link rel="stylesheet" href="../css/slideshow.css?ver12231">
	<script src="../js/slideshow.js?${ver}"></script>
</c:if>

<script src="../js/script.js?${ver}"></script>
<script src="../js/user.js?${ver}"></script>
</head>
<body
	onload="
	onload();
    showMessage('${msg}');
    <c:if test='${popup eq "login"}'> toggleLogin(); </c:if>
"
	style="background-image: url('${userWallpaperURL}'); 
	background-size: cover; 
	background-repeat: no-repeat;"
	class="flowscroll pt100">

	<!-- 검색용 제목 -->
	<h1 class="hide">Jungwoo Shin Personal HomePage</h1>

	<!-- 고정부분 -->
	<jsp:include page="../Parts/Fixed.jsp"></jsp:include>

	<!-- 메인페이지 -->
	<!-- 주석이 있으면 choose 동작안함 -->
	
	<c:choose>
		<c:when test="${pageReq == 'Register'}">
			<jsp:include page="../Parts/User/Register.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq == 'EditUserInformation'}">
			<jsp:include page="../Parts/User/EditUserInfor.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq == 'EditAccountInformation'}">
			<jsp:include page="../Parts/User/EditAccountInfor.jsp"></jsp:include>
		</c:when>


		<c:when test="${pageReq=='AdminManageUsers'}">
			<jsp:include page="../Parts/${role}/AdminManageUsers.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq=='AdminManagePosts'}">
			<jsp:include page="../Parts/${role}/AdminManagePosts.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq=='AdminManageContents'}">
			<jsp:include page="../Parts/${role}/AdminManageContents.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq=='AdminManageStorages'}">
			<jsp:include page="../Parts/${role}/AdminManageStorages.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq=='AdminPostAnnouncements'}">
			<jsp:include page="../Parts/${role}/AdminPostAnnouncements.jsp"></jsp:include>
		</c:when>
		<c:when test="${pageReq=='AdminEditUserInformation'}">
			<jsp:include page="../Parts/${role}/AdminEditUserInformation.jsp"></jsp:include>
		</c:when>
		
		
		<c:otherwise>
			<jsp:include page="../Parts/Main/Main.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<!-- Footer -->

	<jsp:include page="../Parts/Footer.jsp"></jsp:include>
</body>
</html>
