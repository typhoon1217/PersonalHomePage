<%@page import="model.UserVO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String utf8encMsg ="";
String url ="";
%>
<%
//
String sloginID = (String)session.getAttribute("loginID");
String srole  = (String)session.getAttribute("role");

String tgUsername = sloginID;

//로그인아이디 널일시 홈페이지 리다이렉트 방어 
if(sloginID == null) {
	utf8encMsg = URLEncoder.encode("로그인 세션이 만료되었습니다.", "UTF-8");
    url = "../View/Register.jsp?msg=" + utf8encMsg;
response.sendRedirect(url);	
}
//리스트로딩

//관리자일시 파라미터 확인후 타겟유저네임에 세팅
if(srole.equals("admin"))tgUsername = request.getParameter("tgUsername");

//타겟유저네임에 유저리스트 가져오는 dao접근
UserVO vo = dao.getMember(tgUsername);
%>

<script src="../js/signup.js?ver1232232123"></script>
<div class="mainwarp2">

	<main class="pad20">
		<h2 class="heading">
			<%out.print(tgUsername);%>
			Edit User Information
			<div class="btn round hbg">
				<a href="../View/Home.jsp"> <i class="fa-solid fa-house"></i>
				</a>
			</div>
		</h2>


		<form method="post" action="../Proc/SignUpProc.jsp" name="regForm"
			class="regForm" id="regForm" onsubmit="submitEditUserForm(event)">


			<br>
			<h2>&nbsp # Required</h2>

			<div class="inputwrap wrap">
				<label for="susername">Username</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-regular fa-user"></i>
					</div>
					<input type="text" id="susername" name="username"
						placeholder="<%=vo.getUsername()%>">


					<button type="button" class="round btn" id="usernameCheckBTN"
						onclick="usernameCheck('susername','usernameCheckBTN')">
						<i class="fa-solid fa-list-check"></i>
					</button>
					&nbsp
					<button type="button" class="round btn xbg"
						onclick="aclear('susername')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>



			<div class="inputwrap wrap">
				<label for="signupPW">Password</label>
				<div class="inputline wrap">

					<div class="round notwkbtn">
						<i class="fa-solid fa-key"></i>
					</div>
					<input type="password" id="signupPW" name="pw"
						placeholder="New Password">

					<button type="button" id="showSignupPW" class="round btn hbg"
						onclick="
			showpw('signupPW','showSignupPW');
			showpw('regConPW','showSignupPW');
			">
						<i class="fa-regular fa-eye"></i>
					</button>

					&nbsp
					<button type="button" class="round btn xbg"
						onclick="
			aclear('signupPW');
			aclear('regConPW');
			">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap wrap">
				<label for="regConPW">Confirm Password</label>
				<div class="inputline wrap">

					<div class="round notwkbtn">
						<i class="fa-solid fa-check"></i>
					</div>
					<input type="password" id="regConPW"
						placeholder="Confirm New Password">


					<button type="button" class="round btn hbg" id=regChkPWBTN
						onclick="confimpw( 'signupPW','regConPW', 'regChkPWBTN')">
						<i class="fa-solid fa-check"></i>
					</button>
					&nbsp
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap wrap">
				<label for="password">E-mail</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-solid fa-at"></i>
					</div>
					<input type="text" id="regEmail" name="email"
						placeholder="<%=vo.getEmail()%>">

					<button type="button" class="round btn"
						onclick="sendVarifyEmail('regEmail','sendVarifyEmail')">
						<i class="fa-solid fa-list-check"></i>
					</button>
					&nbsp
					<button type="button" class="round btn xbg"
						onclick="aclear('regEmail')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<br>
			<h2>&nbsp # Optional</h2>


			<div class="inputwrap wrap">
				<label for="regName">Name</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-solid fa-user-tag"></i>
					</div>
					<input type="text" id="regName" name="name"
						placeholder="<%=vo.getName()%>">
					<button type="button" class="round btn xbg"
						onclick="aclear('regName')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<!-- 성별 입력 -->
			<div class="inputwrap wrap">
				<label for="gender">Gender</label>
				<div class="radioline wrap">
					<div class="radiowrap">
						<input type="radio" id="Blank" value=""
							<%= (vo.getGender() == null || vo.getGender().equals("")) ? "checked" : "" %>
							name="gender" /> 
							<label for="Blank"> 
							<i class="fa-solid fa-x rdother" style="color: var(--text-1);"></i>
							<p>Blank</p>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Male" value="Male"
							<%= (vo.getGender() != null && vo.getGender().equals("Male")) ? "checked" : "" %>
							name="gender" /> <label for="Male"> <i
							class="fa-solid fa-mars rdmale" style="color: var(--text-1);"></i>
							<p>Male</p>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Female" value="Female"
							<%= (vo.getGender() != null && vo.getGender().equals("Female")) ? "checked" : "" %>
							name="gender" /> <label for="Female"> <i
							class="fa-solid fa-venus rdfemale" style="color: var(--text-1);"></i>
							<p>Female</p>
						</label>
					</div>

					<div class="radiowrap">
						<input type="radio" id="Other" value="Other"
							<%= (!(vo.getGender() != null && (vo.getGender().equals("Male") || vo.getGender().equals("Female") || vo.getGender().equals("")))) ? "checked" : "" %>
							name="gender" /> <label for="Other"> <i
							class="fa-solid fa-genderless rdother"
							style="color: var(--text-1);"></i>
							<p>Other</p>
							<div class="wrap">
								<input type="text" id="Others" name="otherGender"
									placeholder="Other Gender">
							</div>
						</label>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>

			<div class="inputwrap wrap">
				<label for="regPNone">Phone Number 1</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-solid fa-mobile-button"></i>
					</div>
					<input type="text" id="regPNone" name="phone1">
					<button type="button" class="round btn xbg"
						onclick="aclear('regPNone')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap wrap">
				<label for="regPNone">Phone Number 1</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-solid fa-mobile-button"></i>
					</div>
					<input type="text" id="regPNone" name="phone1">

					<button type="button" class="round btn xbg"
						onclick="aclear('regPNone')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>


			<div class="inputwrap wrap">
				<label for="regPNtwo">Phone Number 2</label>
				<div class="inputline wrap">
					<div class="round notwkbtn">
						<i class="fa-solid fa-phone"></i>
					</div>
					<input type="text" id="regPNtwo" name="phone2">

					<button type="button" class="round btn xbg"
						onclick="aclear('regPNtwo')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>

			<br>
			<div class="inputwrap wrap">

				<br>
				<div class="inputline2 wrap">

					<p>ZipCode:</p>
					<input type="text" id="regZip" name="zipcode">


					<button type="button" class="round btn" onclick="zipCheck()	">
						<i class="fa-solid fa-magnifying-glass-location"></i>
					</button>
					&nbsp
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
				<p class="errmsg"></p>
			</div>
			<div class="inputwrap wrap">
				<div class="inputline2 wrap">
					<p>Address1:</p>
					<input type="text" id="regAddOne" name="address1">

				</div>
				<p class="errmsg"></p>
			</div>



			<div class="inputwrap wrap">
				<div class="inputline2 wrap">
					<p>Address2:</p>
					<input type="text" id="regAddTwo" name="address2">

				</div>
				<p class="errmsg"></p>
			</div>


			<div class=" submitform wrap">
				<button class="submitbtn btn" type="submit">Submit</button>
				<button type="button" class="clearbtn btn xbg"
					onclick="clearAllSignup()">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
		</form>
	</main>

</div>