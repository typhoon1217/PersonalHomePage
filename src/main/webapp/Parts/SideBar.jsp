<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="page-select wrap flowscroll shadow" id="page-select">

	<!-- 미구현 div class="usertag login-btn btn" onclick="toggleLogin()"-->

	<div class="usertag">
		<p class="role" id="role">Guest</p>
		<p class="user" id="user">Please Login</p>
	</div>
	<br>
	<nav class="permadmin">

		<h3>Admin</h3>
		<p>(관리자 권한 있을때만 노출됩니다.)</p>
		<ul>
			<li><a href="#">-UserManage</a></li>
			<li><a href="#">-PostManage</a></li>
			<li><a href="#">-FileStorage</a></li>
			<li><a href="#">-Notice</a></li>
		</ul>
	</nav>
	<br>
	<nav class="permguest">

		<h3>Guest</h3>
		<p>(로그인한 사용자 세션일때만 노출됩니다.)</p>
		<ul>
			<li><a href="#">-Post</a></li>
			<li><a href="#">-Food</a></li>
			<li><a href="#">-Hobbies</a></li>
			<li><a href="#">-Etc</a></li>
		</ul>
	</nav>
	<br>
	<nav class="permbasic">

		<h3>Jungwoo Shin</h3>
		<ul>
			<li><a href="#">-Home</a></li>
			<li><a href="#">-About</a></li>
			<li><a href="#">-Projects</a></li>
			<li><a href="#">-GitHub</a></li>
		</ul>
	</nav>
	<br>
	<nav class="permbasic">

		<h3>Blog</h3>
		<ul>
			<li><a href="#">-Workout</a></li>
			<li><a href="#">-Food</a></li>
			<li><a href="#">-Hobbies</a></li>
			<li><a href="#">-Etc</a></li>
		</ul>
	</nav>
</div>