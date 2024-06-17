<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = request.getParameter("msg");
if(msg==null)msg = "버전2";

String loginUserName = (String)session.getAttribute("loginUserName");
if(loginUserName==null)loginUserName = "";

String role  = (String)session.getAttribute("role ");
if(role ==null)role  = "";

String theme  = (String)session.getAttribute("theme");
if(theme ==null)theme  = "default_theme";

String popup = request.getParameter("popup");
if(popup==null)popup = "";

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jungwoo|Edit User Information</title>

<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<link rel="stylesheet" href="../css/<%=theme%>.css?ver2323">
<link rel="stylesheet" href="../css/style.css?ver330">
<script src="../js/script.js?ver12323"></script>
<script src="../js/user.js?ver2231"></script>

</head>
<body
	onload=
" showMessage('<%out.print(msg);%>'); 
 <%if (popup.equals("login")) {%>toggleLogin();<%}%>
 "
	style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;"
	class="flowscroll pt100">
쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마쓰지마
	<!-- 검색용 제목 -->
	<h1 class="hide">Jungwoo Shin Personal HomePage</h1>

	<!-- 고정부분 
	<jsp:include page="../Parts/Fixed.jsp"></jsp:include>
	<!-- RegisterMain 
	<jsp:include page="../Parts/Main/Main.jsp"></jsp:include>
	<!-- Footer 
	<jsp:include page="../Parts/Footer.jsp"></jsp:include>
-->
</body>
</html>