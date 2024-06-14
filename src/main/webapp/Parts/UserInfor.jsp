
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String utf8encMsg = "";
String url = "";

String loginUserName = (String) session.getAttribute("loginUserName");
if (loginUserName == null) {
	utf8encMsg = URLEncoder.encode("로그인 세션이 만료되었습니다.", "UTF-8");
	url = "../View/Register.jsp?msg=" + utf8encMsg;
	response.sendRedirect(url);
}
String role = (String) session.getAttribute("role ");
//if(role ==null)role  = "ERROR";
%>
<div class="login-wrap flowscroll shadow" id="login-wrap">

	<div class="heading">
		<div class="notwkbtn round "></div>
		<%
		out.print(loginUserName);
		%>
		<button class="btn login-btn round xbg " onclick="toggleLogin()">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</div>

	<section class="sectionUserpic">
		<div class="userpicwrap">
			<img class="userpic"
				src="../img/hobb/KakaoTalk_20240608_160355144_04.jpg"
				alt="User Image">
		</div>
	</section>
	<h4 class="box">admin</h4>
	<div class="btnflexwrap">

		<button class="btn login-btn round  " onclick="">Delete Users</button>

		<button class="btn login-btn round  nbg" onclick="">Setting</button>
		<button class="btn login-btn round  nbg" onclick="">Delete
			Users</button>
		<button class="btn login-btn round  nbg" onclick="">Edit
			Users</button>
	</div>

	<h4 class="box">User</h4>

	<div class="btnflexwrap">
		<button class="btn login-btn round  nbg" onclick="">My
			Postings</button>
		<button class="btn login-btn round  nbg" onclick="">Direct
			Message</button>
		<button class="btn login-btn round  nbg" onclick="">Account
			Setting</button>
		<button class="btn login-btn round  nbg" onclick="">Delete
			Account</button>
		<a class="btn login-btn round  hbg"
			href="../View/EditUserInformation.jsp">Edit User Information</a> <a
			class="btn login-btn round xbg " href="../Proc/LogoutProc.jsp">Log
			out</a>
	</div>


</div>