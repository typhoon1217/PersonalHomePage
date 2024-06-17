<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String ver = "1";

String msg = request.getParameter("msg");
if (msg == null)
	msg = ("버전"+ver);

String loginUserName = (String) session.getAttribute("loginUserName");
if (loginUserName == null)
	loginUserName = "";

String role = (String) session.getAttribute("role ");
if (role == null)
	role = "";

String theme = (String) session.getAttribute("theme");
if (theme == null)
	theme = "default_theme";

String popup = request.getParameter("popup");
if (popup == null)
	popup = "";

boolean slide = false;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jungwoo | Register</title>

<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<!-- 기본스타일 -->
<link rel="stylesheet" href="../css/style.css?ver120">

<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<link rel="stylesheet" href="../css/<%=theme%>.css?ver<%=ver%>">
<!-- Load script.js first -->
<script src="../js/script.js?ver<%=ver%>"></script>
<!-- Then load user.js -->
<script src="../js/user.js?ver<%=ver%>"></script>

</head>
<body onload=" showMessage('<%=msg%>'); "
	style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;"
	class="flowscroll pt100">
쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마
	<!-- 검색용 제목 -->
	<h1 class="hide">Jungwoo Shin Personal HomePage</h1>

	<!-- 고정부분 
	<jsp:include page="../Parts/Fixed.jsp"></jsp:include>
	<!-- RegisterMain 
	<jsp:include page="../Parts/Main/MainRegister.jsp"></jsp:include>
	<!-- Footer 
	<jsp:include page="../Parts/Footer.jsp"></jsp:include>
	-->
</body>
</html>