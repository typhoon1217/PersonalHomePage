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

		<section class="sectionUserpic trcbg fors200200" onclick="popUpeditpic()">
			<div class="userpicwrap s200200 wrap">
				<img class="userpic s200200" src='${userPicURL}' alt="User Image">

				<a class="wrapConhead btn nbg"> ${loginUserName}</a>
			</div>
		</section>

		<div class="inputwrap ">
			<div class="radioline fwrap2 sad">
				<div class="radiowrap ">
					<input type="radio" id="admin" value="admin" name="role"
						<%if(vo.getRole().equals("admin")) {%> checked <%}%> /> <label
						for="admin" checked> <i>Admin</i> <span>admin</span>
					</label>
				</div>
				<div class="radiowrap">
					<input type="radio" id="guest" value="guest" name="role"
						<%if(vo.getRole().equals("guest")) {%> checked <%}%> /> <label
						for="guest"> <i>Guest</i> <span>guest</span>
					</label>
				</div>
			</div>
			<p class="errmsg"></p>
		</div>

		<form method="post" action="../Proc/SignUpProc.jsp" name="editForm"
			class="editForm" id="editForm" onsubmit="submitEditUserForm(event)">
			<div class="inputwrap ">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-at"></i>
					</div>
					<input type="text" id="regEmail" name="email"
						placeholder="<%=vo.getEmail()%>">
					<div class="inputline3">
						<button type="button" class="round obg btn"
							onclick="sendVarifyEmail('regEmail','sendVarifyEmail')">
							<i class="fa-solid fa-list-check"></i>
						</button>
						<button type="button" class="round btn xbg"
							onclick="aclear('regEmail')">
							<i class="fa-solid fa-eraser"></i>
						</button>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap margt10">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-user-tag"></i>
					</div>
					<input type="text" id="regName" name="name"
						placeholder="<%if (vo.getName() == null || vo.getName().isEmpty()) {%>Add Phone Number2<%} else {%><%=vo.getName()%><%}%>">
					<button type="button" class="round btn xbg"
						onclick="aclear('regName')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<!-- 성별 입력 -->
			<div class="inputwrap ">
				<div class="radioline fwrap2 sad">
					<div class="radiowrap ">
						<input type="radio" id="Blank" value=""
							<%=(vo.getGender() == null || vo.getGender().equals("")) ? "checked" : ""%>
							name="gender" /> <label for="Blank"> <i>Gender</i> <span>No
								Answer</span>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Male" value="Male"
							<%=(vo.getGender() != null && vo.getGender().equals("Male")) ? "checked" : ""%>
							name="gender" /> <label for="Male"> <i
							class="fa-solid fa-mars rdmale" style="color: var(--text-1);"></i>
							<span>Male</span>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Female" value="Female"
							<%=(vo.getGender() != null && vo.getGender().equals("Female")) ? "checked" : ""%>
							name="gender" /> <label for="Female"> <i
							class="fa-solid fa-venus rdfemale" style="color: var(--text-1);"></i>
							<span>Female</span>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Other" value="Other" name="gender"
							<%boolean otherCheck = vo.getGender() != null && !vo.getGender().isEmpty() && !vo.getGender().equals("Male")
		&& !vo.getGender().equals("Female");
if (otherCheck) {%>
							checked <%}%> /> <label for="Other"> <i
							class="fa-solid fa-genderless rdother"
							style="color: var(--text-1);"></i> <span>Other</span> <i
							class="textInRadiowrap"> <input type="text" id="Others"
								placeholder="<%if (otherCheck) {
	vo.getGender();
} else {%>Other<%}%>">
						</i>
						</label>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>

			<div class="inputwrap ">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-phone"></i>
					</div>
					<input type="text" id="regPNtwo" name="phone2"
						oninput="oninputPhone('regPNtwo')"
						placeholder="<%if (vo.getPhone2() == null || vo.getPhone2().isEmpty()) {%>Add Phone Number2<%} else {%><%=vo.getPhone2()%><%}%>">
					<button type="button" class="round btn xbg"
						onclick="aclear('regPNtwo')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>





			<div class="inputwrap2 sad">
				<div class="heading mAw90">
					<h4>Address</h4>

					<div class="inputline3">
						<button type="button" class="round obg btn" onclick="zipCheck()	">
							<i class="fa-solid fa-magnifying-glass-location"></i>
						</button>
						<button type="button" class="round btn  xbg"
							onclick="
			aclear('regZip');
			aclear('regAddOne');
			aclear('regAddTwo')
			"
							style="z-index: 5000;">
							<i class="fa-solid fa-eraser"></i>
						</button>
					</div>
				</div>

				<br>
				<div class="inputwrap ">

					<br>
					<div class="inputline2 ">

						<p>ZipCode:</p>
						<input type="text" id="regZip" name="zipcode"
							placeholder="<%=(vo.getZipcode() != null && !vo.getZipcode().isEmpty()) ? vo.getAddress1() : ""%>
					">

					</div>
					<p class="errmsg"></p>
				</div>
				<div class="inputwrap ">
					<div class="inputline2 ">
						<p>Address1:</p>
						<input type="text" id="regAddOne" name="address1"
							placeholder="<%=(vo.getAddress1() != null && !vo.getAddress1().isEmpty()) ? vo.getAddress1() : ""%>
					">
					</div>
					<p class="errmsg"></p>
				</div>



				<div class="inputwrap ">
					<div class="inputline2 ">
						<p>Address2:</p>
						<input type="text" id="regAddTwo" name="address2"
							placeholder="<%=(vo.getAddress2() != null && !vo.getAddress2().isEmpty()) ? vo.getAddress2() : ""%>
					">
					</div>
					<p class="errmsg"></p>
				</div>
			</div>


			<div class=" submitform margt10">
				<button class="submitbtn wrap hbg btn" type="submit">Submit</button>
				<button type="button" class="clearbtn wrap btn xbg">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
		</form>
	</main>

</div>