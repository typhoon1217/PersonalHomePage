<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="controller.UserDAO"/>
<jsp:useBean id="vo" class="model.UserVO" />
<jsp:setProperty name="vo" property="*" />
<%
boolean flag = dao.userInsert(vo);
%>

<%
String msg = request.getParameter("msg");
if(msg==null)msg = "버전1";

String loginID = (String)session.getAttribute("loginUSER");
if(loginID==null)loginID = "";

String permission  = (String)session.getAttribute("permission ");
if(permission ==null)permission  = "NoRole";

String popup = request.getParameter("popup");
if(popup==null)popup = "";

boolean slide = true;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>회원가입 확인</title>

<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 
<link rel="stylesheet" href="../css/style.css?ver12232310">
<script src="../js/script.js?ver2231"></script>
<script src="../js/login.js?ver1"></script>
<% if(slide){%>
<link rel="stylesheet" href="../css/slideshow.css?ver1231">
<script src="../js/slideshow.js?ver1"></script>
<%}%>

</head>

<body 
onload="onloadMsgSlide('회원가입 확인 페이지 입니다',false)" 
style="background-image: url(../img/food/nonalc/nicks/img1.jpg); 
background-size: cover; 
background-repeat: no-repeat;" 
class="flowscroll">



<!-- 고정부분 -->
<jsp:include page="../Parts/Fixed.jsp"></jsp:include>
<main class="procmainwrap"> 


<%
if(flag){
 out.println("<h1>회원가입을 축하 드립니다.</h1>");
 out.println("<a class= 'relend btn'  href=../View/Home.jsp>홈 화면</a>");
}else{
 out.println("<h1>회원가입 실패.</h1>");
 out.println("<a class= 'absolute btn' href=../View/Register.jsp>다시 가입</a>");
}
%>


</main>
<!-- Footer -->
<jsp:include page="../Parts/Footer.jsp"></jsp:include>


</body>
</html>