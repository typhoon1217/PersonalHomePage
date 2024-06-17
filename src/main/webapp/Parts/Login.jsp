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

<div class="login-wrap flowscroll cbg wrap" id="login-wrap">
	<div class="heading sad gbg">
		<h4>Login</h4>
		<button class="btn login-btn round xbg s3030" onclick="toggleLogin()">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</div>
	<form class="loginform" id="loginform"
		onsubmit="submitLoginForm(event)" action="../Proc/loginProc.jsp"
		method="post" onclick="event.stopPropagation()">

		<div class="inputwrap ">
			<div class="inputline sad">
				<div class="round notwkbtn">
					<i class="fa-regular fa-user"></i>
				</div>
				<input type="text" id="loginUsername" name="username"
					placeholder="User Name">
				<button type="button" class="round btn xbg "
					onclick="aclear('loginUsername')">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
			<span class="errmsg"></span>
		</div>
		<div class="inputwrap ">
			<div class="inputline sad">
				<div class="round notwkbtn ">
					<i class="fa-solid fa-key"></i>
				</div>
				<input type="password" id="loginPassword" name="pw"
					placeholder="Password">

				<div class="inputline3 ">
					<button type="button" class="round btn hbg" id="loginPasswordbtn"
						onclick="showpw('loginPassword','loginPasswordbtn')">
						<i class="fa-regular fa-eye"></i>
					</button>

					<button type="button" class="round btn xbg"
						onclick="aclear('loginPassword')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
			</div>
			<p class="errmsg"></p>
		</div>

		<div class="submitform ">
			<button class="submitbtn btn wrap hbg" type="submit">Sign in</button>

			<button type="button" class="clearbtn btn wrap xbg"
				onclick="clearAllLogin()">
				<i class="fa-solid fa-eraser"></i>
			</button>
		</div>

		<br>
		<c:url var="registerUrl" value="../View/Home.jsp">
			<c:param name="pageReq" value="Register" />
			<c:param name="msg" value="회원가입" />
		</c:url>
		<a href="${registerUrl}">회원가입</a>
	</form>
</div>