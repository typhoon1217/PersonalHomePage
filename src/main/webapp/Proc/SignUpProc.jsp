<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="controller.UserDAO" />
<jsp:useBean id="vo" class="model.UserVO" />
<jsp:setProperty name="vo" property="*" />
<%
boolean flag = dao.userInsert(vo);
String utf8encMsg = "";
String url = "";
%>

<%
if (flag) {//회원가입 성공
	utf8encMsg = URLEncoder.encode("회원가입 성공", "UTF-8");
	url = "../View/Home.jsp?msg=" + utf8encMsg;
	url = "../View/Home.jsp?msg=" + utf8encMsg + "&popup=login";
} else {//회원가입 실패 입력값들을 다시 확인해주세요	
	utf8encMsg = URLEncoder.encode("회원가입 실패 아이디와 이메일 중복을 확인하고 다시 시도해주세요.", "UTF-8");
	url = "../View/Home.jsp?msg=" + utf8encMsg + "&pageReq=Register";;
}
response.sendRedirect(url);
%>

<%--
if(flag){
 out.println("<h1>회원가입을 축하 드립니다.</h1>");
 out.println("<a class= 'relend btn'  href=../View/Home.jsp>홈 화면</a>");
}else{
 out.println("<h1>회원가입 실패.</h1>");
 out.println("<a class= 'absolute btn' href=../View/Register.jsp>다시 가입</a>");
}
--%>