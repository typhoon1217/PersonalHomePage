<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%
session.invalidate();//세션클리어 로그아웃
String utf8encMsg = URLEncoder.encode("성공적으로 로그아웃 되었습니다.", "UTF-8");
String url = "../View/Home.jsp?msg=" + utf8encMsg;
response.sendRedirect(url);
%>