
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${not empty userpic and not empty loginUserName}">
		<c:set var="userPicURL"
			value="../img/users/${loginUserName}/USER/userpic/${userpic}.jpg" />
	</c:when>
	<c:otherwise>
		<c:set var="userPicURL" value="../img/default/userpic/userpic.jpg" />
	</c:otherwise>
</c:choose>

<div class="login-wrap flowscroll wrap cbg blur" id="login-wrap">

	<div class="heading gbg ">
		<div class="notwkbtn round obg"></div>
		${loginUserName}
		<button class="btn login-btn round xbg " onclick="toggleLogin()">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</div>

	<div class="fwrap flowscroll h320 vbg semiround margt10">
		<section class="sectionUserpic trcbg fors200200">
			<div class="userpicwrap s200200">
				<img class="userpic s200200" src='${userPicURL}' alt="User Image">

				<a class="wrapConhead btn nbg"> ${loginUserName}</a>
			</div>
		</section>
		<div class="fwrapc">
			<div>
				<a class=" btn  heading hbg" onclick=""> <b>Account Setting</b>
				</a>
		
				<c:url var="EditUserInformationUrl" value="../View/Home.jsp">
					<c:param name="pageReq" value="EditUserInformation" />
					<c:param name="msg" value="사용자 정보 수정" />
				</c:url>
				<a class=" btn   obg" href="${EditUserInformationUrl}"> Edit Account Information</a> 
				<a class=" btn   obg" onclick=""> My Postings </a> <a
					class=" btn   obg" onclick=""> Direct Message </a> <a
					class=" btn   obg" onclick=""> Change Theme </a>
			</div>
		</div>
	</div>
	<a class="heading btn login-btn  xbg margt10"
		href="../Proc/LogoutProc.jsp"> Log Off </a>
</div>