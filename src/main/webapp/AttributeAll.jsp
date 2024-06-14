<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 String loginID = (String)session.getAttribute("loginUSER");
 String MSG = request.getParameter("MSG");
 if(MSG==null){
	 MSG = "ㅎㅇㅎㅇ";
 }
%>
