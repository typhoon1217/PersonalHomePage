<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<body>
	<h1>JSTL Example</h1>

	<c:set var="message" value="Hello, JSTL!" />
	<p>
		Message:
		<c:out value="${message}" />
	</p>

	<c:set var="user" value="admin" />
	<c:if test="${user == 'admin'}">
		<p>Welcome, Admin!</p>
	</c:if>

	<%-- List 생성 --%>
	<%
    List<String> items = new java.util.ArrayList<>();
    items.add("Item1");
    items.add("Item2");
    items.add("Item3");
    items.add("Item2");
    items.add("Item3");
    items.add("Item2");
    items.add("Item3");
%>

	<h1>Item List</h1>
	<ul>
		<%-- 반복문을 통해 리스트 출력 --%>
		<c:forEach var="item" items="${items}">
			<li><c:out value="${item}" /></li>
		</c:forEach>
	</ul>

	<c:choose>
		<c:when test="${user == 'admin'}">
			<p>Admin Panel</p>
		</c:when>
		<c:otherwise>
			<p>User Panel</p>
		</c:otherwise>
	</c:choose>

	<c:set var="now" value="<%= new java.util.Date() %>" />
	<p>
		Current Date:
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
	</p>

	<p>
		Formatted Number:
		<fmt:formatNumber value="${12345.6789}" type="currency" />
	</p>
</body>
</html>