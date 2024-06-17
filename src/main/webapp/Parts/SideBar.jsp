<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${not empty userpic and not empty loginUserName}">
		<c:set var="userPicURL"
			value="../img/users/${loginUserName}/USER/userpic/${userpic}.jpg" />
	</c:when>
	<c:otherwise>
		<c:set var="userPicURL" value="../img/default/userpic/userpic.jpg" />
	</c:otherwise>
</c:choose>
<div class="page-select vbg flowscroll pad20 wrap" id="page-select">
	<br>
	<div class="heading sad gbg">
		<c:choose>
			<c:when test="${empty loginUserName}">
				<a class="logo"> <i class="vbg"> <span class="logo2 bgbtm">>_</span>Jungwoo
				</i>
				</a>
				<button class="btn login-btn round xbg s3030" onclick="toggleNav()">
					<i class="fa-solid fa-xmark"></i>
				</button>
			</c:when>
			<c:when test="${not empty loginUserName}">
				<div class="userpicwrap s6060">
					<img class="userpic s6060" src="${userPicURL}" alt="User Image">
				</div>
				<h4 class="user round" id="selsuser">${loginUserName}</h4>
				<button class="btn login-btn round xbg s3030" onclick="toggleNav()">
					<i class="fa-solid fa-xmark"></i>
				</button>
			</c:when>
		</c:choose>
	</div>
	<!-- 미구현 div class="usertag login-btn btn" onclick="toggleLogin()"-->

	<c:if test="${role == 'admin'}">
		<br>
		<nav class="permadmin"
			onclick="toggleList('sel-admin-togglebutton','sel-admin')">
			<h3 class="heading sad  xbg">
				<div>
					<i class="fa-solid fa-user-tie"></i> <span>Admin</span>
				</div>

				<i class="fa-solid fa-chevron-down" id="sel-admin-togglebutton"></i>
			</h3>
			<ul class="toglist semiround vbg " id="sel-admin">
				<li><a href="../View/Home.jsp?pageReq=AdminManageUsers">Manage
						User</a></li>
				<li><a href="../View/Home.jsp?pageReq=AdminManagePosts">Manage
						Post</a></li>
				<li><a href="../View/Home.jsp?pageReq=AdminManageContents">Manage
						Content</a></li>
				<li><a href="../View/Home.jsp?pageReq=AdminManageStorages">Manage
						Storage</a></li>
				<li><a href="../View/Home.jsp?pageReq=AdminPostAnnouncements">Post
						Announcements</a></li>
			</ul>
		</nav>
	</c:if>

	<c:if test="${not empty loginUserName}">
		<br>
		<nav class="permadmin"
			onclick="toggleList('sel-post-togglebutton','sel-post')">
			<div class="heading sad hbg">
				<div>
					<i class="fa-solid fa-list"></i> <span>Posting</span>
				</div>
				<i class="fa-solid fa-chevron-down" id="sel-post-togglebutton"></i>

			</div>
			<ul class="toglist semiround vbg" id="sel-post">
				<li><a href="../View/Home.jsp?pageReq=UserPost">Post</a></li>
				<li><a href="../View/Home.jsp?pageReq=UserFood">Food</a></li>
				<li><a href="../View/Home.jsp?pageReq=UserHobbies">Hobbies</a></li>
				<li><a href="../View/Home.jsp?pageReq=UserAll">All</a></li>
			</ul>
		</nav>
	</c:if>

	<br>

	<nav class="permadmin" onclick="toggleList('sel-dev-togglebutton','sel-dev')">
		<div class="heading sad  obg">
			<div>
				<i class="fa-brands fa-connectdevelop"></i> <span>Web</span>
			</div>
			<i class="fa-solid fa-chevron-up" id="sel-dev-togglebutton"></i>
		</div>
		<ul class=" semiround vbg" id="sel-dev">
			<li><a href="../View/Home.jsp">Home</a></li>
			<li><a href="../View/Home.jsp?pageReq=About">About</a></li>
			<li><a href="../View/Home.jsp?pageReq=Projects">Projects</a></li>
			<li><a href="https://github.com/typhoon1217">GitHub</a></li>
		</ul>
	</nav>

	<br>
	<nav class="permdef"
		onclick="toggleList('sel-blog-togglebutton','sel-blog')">
		<div class="heading sad  obg">
			<div>
				<i class="fa-brands fa-blogger-b"></i> <span>Blog</span>
			</div>

			<i class="fa-solid fa-chevron-up" id="sel-blog-togglebutton"></i>

		</div>
		<ul class="semiround vbg" id="sel-blog">
			<li><a href="../View/Home.jsp?pageReq=ViewPost">Post</a></li>
			<li><a href="../View/Home.jsp?pageReq=ViewFood">Food</a></li>
			<li><a href="../View/Home.jsp?pageReq=ViewHobbies">Hobbies</a></li>
			<li><a href="../View/Home.jsp?pageReq=ViewAll">All</a></li>
		</ul>
	</nav>
</div>