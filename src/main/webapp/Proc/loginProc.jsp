<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String username = request.getParameter("username");
String pass = request.getParameter("pw");
int check = dao.loginCheck(username, pass);
String utf8encMsg ="";
String url ="";
%>

<%
if (check == 1) {//로그인 성공
	//역할조회 
	String role = dao.rolecheck(username);
	session.setAttribute("loginUserName", username);
	session.setAttribute("role", role);
	//--
    utf8encMsg = URLEncoder.encode("로그인 성공", "UTF-8");
    url = "../View/Home.jsp?msg=" + utf8encMsg;
} else if (check == 0) {//아이디는 있는데 비밀번호 오류
	utf8encMsg = URLEncoder.encode("비밀번호 오류입니다.", "UTF-8");
    url = "../View/Home.jsp?msg=" + utf8encMsg + "&popup=login";
	
} else {//아이디 자체가 존재하지 않는 경우	
    utf8encMsg = URLEncoder.encode("존재하지 않는 아이디입니다.", "UTF-8");
    url = "../View/Home.jsp?msg=" + utf8encMsg + "&popup=login";
}
response.sendRedirect(url);
%>

