<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="login-wrap flowscroll shadow" id="login-wrap">
	<h2 class="heading">
		Login
		<button class="btn login-btn round xbg s3030" onclick="toggleLogin()">
			<i class="fa-solid fa-xmark"></i>
		</button>
	</h2>
	<form class="loginform" id="loginform"
		onsubmit="submitLoginForm(event)" action="../Proc/loginProc.jsp"
		method="post" onclick="event.stopPropagation()">

		<div class="inputwrap wrap">
			<label for="loginUsername">Username</label>
			<div class="inputline wrap">
				<div class="round notwkbtn">
					<i class="fa-regular fa-user"></i>
				</div>
				<input type="text" id="loginUsername" name="username">
				<button type="button" class="round btn xbg "
					onclick="aclear('loginUsername')">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
			<p class="errmsg"></p>
		</div>
		<div class="inputwrap wrap">
			<label for="loginPassword">Password</label>
			<div class="inputline wrap">

				<div class="round notwkbtn ">
					<i class="fa-solid fa-key"></i>
				</div>

				<input type="password" id="loginPassword" name="pw">

				<button type="button" class="round btn hbg" id="loginPasswordbtn"
					onclick="showpw('loginPassword','loginPasswordbtn')">
					<i class="fa-regular fa-eye"></i>
				</button>
				&nbsp
				<button type="button" class="round btn xbg"
					onclick="aclear('loginPassword')">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
			<p class="errmsg"></p>
		</div>


		<div class="submitform wrap">
			<button class="submitbtn btn" type="submit">Sign in</button>
			<button type="button" class="clearbtn btn xbg"
				onclick="clearAllLogin()">
				<i class="fa-solid fa-eraser"></i>
			</button>
		</div>
		<br> <a href="../View/Register.jsp">Guest Register</a>
	</form>
</div>