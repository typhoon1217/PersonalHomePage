<%@page import="model.UserVO"%>
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

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String utf8encMsg = "";
String url = "";
%>
<%
//
String sloginID = (String) session.getAttribute("loginUserName");
String srole = (String) session.getAttribute("role");
String tgUsername = null;

//로그인아이디 널일시 홈페이지 리다이렉트 방어 
if (sloginID == null) {
	utf8encMsg = URLEncoder.encode("로그인 세션이 만료되었습니다.", "UTF-8");
	url = "../View/Register.jsp?msg=" + utf8encMsg;
	response.sendRedirect(url);
}
//리스트로딩

//관리자일시 파라미터 확인후 타겟유저네임에 세팅
if (srole.equals("admin"))
	tgUsername = request.getParameter("tgUsername");

//관리자의권한 상태에서 tgUsername 요청 없을시 관리자의 혹은 유저의 sloginID
if (tgUsername == null)
	tgUsername = sloginID;

//tgUsername="testusername";

//타겟유저네임에 유저리스트 가져오는 dao접근
UserVO vo = dao.getMember(tgUsername);
%>
<div class="mainwarp2  wrap vbg semiround">

	<main class="pad20">
		<div class="heading gbg ">
			<div>
				<h2>
					<%
					out.print(tgUsername);
					%>
				</h2>
				Edit User Information
			</div>


			<div class="btn round hbg">
				<a href="../View/Home.jsp"> <i class="fa-solid fa-house"></i>
				</a>
			</div>
		</div>
		<form method="post" action="../Proc/SignUpProc.jsp" name="editForm"
			class="editForm" id="editForm" onsubmit="submitEditUserForm(event)">
			<br>
			<div class="heading  margt10">
				<h2># Required</h2>
			</div>


			<div class="inputwrap  margt10">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-regular fa-user"></i>
					</div>
					<input type="text" id="susername" name="username"
						placeholder="<%=vo.getUsername()%>">


					<div class="inputline3">
						<button type="button" class="round obg btn" id="usernameCheckBTN"
							onclick="usernameCheck('susername','usernameCheckBTN')">
							<i class="fa-solid fa-list-check"></i>
						</button>

						<button type="button" class="round btn xbg"
							onclick="aclear('susername')">
							<i class="fa-solid fa-eraser"></i>
						</button>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>



			<div class="inputwrap ">
				<div class="inputline sad">

					<div class="round notwkbtn">
						<i class="fa-solid fa-key"></i>
					</div>
					<input type="password" id="signupPW" name="pw"
						placeholder="New Password">

					<div class="inputline3">
						<button type="button" id="showSignupPW" class="round btn hbg"
							onclick="
			showpw('signupPW','showSignupPW');
			showpw('regConPW','showSignupPW');
			">
							<i class="fa-regular fa-eye"></i>
						</button>


						<button type="button" class="round btn xbg"
							onclick="
			aclear('signupPW');
			aclear('regConPW');
			">
							<i class="fa-solid fa-eraser"></i>
						</button>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap ">
				<div class="inputline sad">

					<div class="round notwkbtn">
						<i class="fa-solid fa-check"></i>
					</div>
					<input type="password" id="regConPW"
						placeholder="Confirm New Password">


					<button type="button" class="round btn hbg" id=regChkPWBTN
						onclick="confimpw( 'signupPW','regConPW', 'regChkPWBTN')">
						<i class="fa-solid fa-check"></i>
					</button>

				</div>
				<p class="errmsg"></p>
			</div>
</div>