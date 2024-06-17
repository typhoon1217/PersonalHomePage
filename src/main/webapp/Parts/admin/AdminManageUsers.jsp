<%@page import="java.util.List"%>
<%@page import="controller.UserDAO"%>
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
UserDAO userDAO = new UserDAO();
List<UserVO> userList = userDAO.getAllUserNamesAndRoles();
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
//타겟유저네임에 유저리스트 가져오는 dao접근
UserVO vo = dao.getMember(tgUsername);
%>
<div class="mainwarp2  wrap vbg semiround">

	<main class="pad20">
		<div class="heading gbg sad">
			<div>
				<h2>User Manager</h2>

			</div>
			<div class="btn round hbg">
				<a href="../View/Home.jsp"> <i class="fa-solid fa-house"></i>
				</a>
			</div>
		</div>


		<div class="inputwrap margt10 selectline">
			<div class="inputline sad ">

				<nav class="permadmin"
				
					onclick="toggleList('sel-user-togglebutton','sel-user')">
					<div>
					<div class="selectbtn heading sad obg">
						<i class=" fa-solid fa-chevron-up" id="sel-user-togglebutton"></i>
					</div>
						<ul class="selectbox vbg toglist" id="sel-user">
						<li>A-Z</li>
						<li>Z-A</li>
						<li>admin</li>
						<li>guest</li>
						</ul>					
					</div>


				</nav>

				<input type="text" id="userSearch" placeholder="Input User ID">
				<div class="inputline3">
					<button type="button" class="round obg btn"
						onclick="Search('userSearch','')">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					

					<button type="button" class="round btn xbg"
						onclick="aclear('regEmail')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
			</div>
			<p class="errmsg"></p>
		</div>

		<section class="inputwrap2 flowscroll max50vh box tbg sad">
			<%
			if (userList != null && !userList.isEmpty()) {
			%>
			<%
			for (UserVO user : userList) {
			%>
			<div class="heading cbg margt10 hovfad">
				<button class="btn round xbg"><%=user.getRole()%></button>
				<div class="overXhidden">
					<span> <%=user.getUsername()%>
					</span>
				</div>
				<div class="inputline3 ">
					<button class="btn round hbg">
						<i class="fa-solid fa-gears"></i>
					</button>
					<button class="btn round xbg">
						<i class="fa-solid fa-trash"></i>
					</button>
				</div>
			</div>
			<%
			}
			%>
			<%
			} else {
			%>
			<b>No users found.</b>
			<%
			}
			%>
		</section>
		<!-- end of list -->


		<div class=" submitform margt10">
			<button class="submitbtn wrap xbg btn" type="submit">Close</button>
			<button type="button" class="clearbtn wrap btn xbg">
				<i class="fa-solid fa-eraser"></i>
			</button>
		</div>

	</main>

</div>