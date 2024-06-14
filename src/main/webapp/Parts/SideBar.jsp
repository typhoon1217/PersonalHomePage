<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginUserName = (String) session.getAttribute("loginUserName");
if (loginUserName == null)
	loginUserName = "";

String role = (String) session.getAttribute("role");
if (role == null)
	role = "";
%>

<div class="page-select wrap flowscroll shadow pad20" id="page-select">
	
		<button class="btn login-btn round xbg s3030" onclick="toggleNav()">
			<i class="fa-solid fa-xmark"></i>
		</button>
	<!-- 미구현 div class="usertag login-btn btn" onclick="toggleLogin()"-->
	
	<%if(loginUserName!=""){%>
		<br>
		<div class="heading">
			<p class="role" id="selsrole">
				<%out.print(role);%>
			</p>
			<p class="user round" id="selsuser">
				<%out.print(loginUserName);%>
			</p>
			
			<button class="btn login-btn round hbg" onclick="toggleNav()">
				<i class="fa-solid fa-user-gear"></i>
			</button>
		</div>
	<%}%>
	
	<%if(role.equals("admin")){%>
	<br>
	<nav class="permadmin"  onclick="toggleList('sel-admin-togglebutton','sel-admin')">
			<h3 class="heading xbg">
			<i class="fa-solid fa-chevron-down" id="sel-admin-togglebutton"></i>
			<p>&nbsp Admin &nbsp</p>
			<i class="fa-solid fa-user-tie"></i>
			</h3>
		<ul class="hide" id="sel-admin">
			<li><a href="#">UserManage</a></li>
			<li><a href="#">PostManage</a></li>
			<li><a href="#">FileStorage</a></li>
			<li><a href="#">Notice</a></li>
		</ul>
	</nav>
	<%}%>
	
	<%if(role!=""){%>
	<br>
<nav class="permadmin"  onclick="toggleList('sel-post-togglebutton','sel-post')">
			<h3 class="heading hbg">
			<i class="fa-solid fa-chevron-down" id="sel-post-togglebutton"></i>
				<div> &nbsp Post &nbsp </div>
				<i class="fa-solid fa-list"></i>
			</h3>
		<ul class="hide" id="sel-post">
			<li><a href="#">Post</a></li>
			<li><a href="#">Food</a></li>
			<li><a href="#">Hobbies</a></li>
			<li><a href="#">Etc</a></li>
		</ul>
	</nav>
	<%}%>
	
	<br>
<nav class="permadmin"  onclick="toggleList('sel-dev-togglebutton','sel-dev')">
			<h3 class="heading obg">
			<i class="fa-solid fa-chevron-up" id="sel-dev-togglebutton"></i>
				
				<p>
				&nbsp
				Dev
				&nbsp
				</p>
				
				<i class="fa-brands fa-connectdevelop"></i>
			</h3>
		<ul class="" id="sel-dev">
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Projects</a></li>
			<li><a href="#">GitHub</a></li>
		</ul>
	</nav>
	
	<br>
<nav class="permdef"  onclick="toggleList('sel-blog-togglebutton','sel-blog')">
			<h3 class="heading obg">
			<i class="fa-solid fa-chevron-up" id="sel-blog-togglebutton"></i>
				<p>
				&nbsp
				Blog
				&nbsp
				</p>
				<i class="fa-brands fa-blogger-b"></i>
			</h3>
		<ul class="" id="sel-blog">
			<li><a href="#">Work Out</a></li>
			<li><a href="#">Food</a></li>
			<li><a href="#">Hobbies</a></li>
			<li><a href="#">Etc</a></li>
		</ul>
	</nav>
</div>