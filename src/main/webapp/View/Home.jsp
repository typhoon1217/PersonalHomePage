<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = request.getParameter("msg");
if(msg==null)msg = "버전1";

String loginUserName = (String)session.getAttribute("loginUserName");
if(loginUserName==null)loginUserName = "";

String role  = (String)session.getAttribute("role ");
if(role ==null)role  = "";

String popup = request.getParameter("popup");
if(popup==null)popup = "";

boolean slide = true;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Jungwoo|HOME</title>
<% if(slide){%>
<link rel="stylesheet" href="../css/slideshow.css?ver23422231">
<script src="../js/slideshow.js?ver1"></script>
<%}%>

<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 
<link rel="stylesheet" href="../css/style.css?ver3223232333">
<script src="../js/script.js?ver2223434331"></script>
<script src="../js/login.js?ver231"></script>

</head>
<body onload="
 showMessage('<%out.print(msg);%>'); 
 <% if(popup.equals("login")){%>toggleLogin();<%}%>
 <% if(slide){%>call_ss_js();<%}%>
 "
	style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;"
	class="flowscroll pt100">

	<!-- 검색용 제목 -->
	<h1 class="hide">Jungwoo Shin Personal HomePage</h1>

	<!-- 고정부분 -->
	<jsp:include page="../Parts/Fixed.jsp"></jsp:include>
	<!-- Main -->
	<jsp:include page="../Parts/Main.jsp"></jsp:include>
	<!-- Footer -->
	<jsp:include page="../Parts/Footer.jsp"></jsp:include>

</body>
</html>