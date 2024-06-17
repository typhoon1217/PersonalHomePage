<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="mainwarp2  wrap vbg semiround">

	<main class="pad20">
		<div class="heading gbg sad">
			<h4>Sign-Up</h4>
			<div class="btn round hbg">
				<a href="../View/Home.jsp"> <i class="fa-solid fa-house"></i>
				</a>
			</div>
		</div>
		<form class="regForm" id="regForm" name="regForm" method="post"
			action="../Proc/SignUpProc.jsp" onsubmit="submitRegForm(event)">
			<br>
			<div class="heading ">
				<h2># Required</h2>
			</div>
			<div class="inputwrap  margt10">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-regular fa-user"></i>
					</div>

					<input type="text" id="susername" name="username"
						placeholder="User name">

					<div class="inputline3">
						<button type="button" class="round btn obg
						"
							id="usernameCheckBTN" onclick="usernameCheck('susername')">
							<i class="fa-solid fa-list-check"></i>
						</button>
						<input type="hidden" id="susernamepass" value="n">

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
						placeholder="Password">
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
					<input type="password" id="regConPW" placeholder="Confirm Password">
					<button type="button" class="round btn hbg" id=regChkPWBTN
						onclick="confimpw()">
						<i class="fa-solid fa-check"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>
			<div class="inputwrap ">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-at"></i>
					</div>
					<input type="text" id="regEmail" name="email" placeholder="E-Mail">
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
			<br>
			<div class="heading">
				<h2># Optional</h2>
			</div>
			<div class="inputwrap  margt10">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-user-tag"></i>
					</div>
					<input type="text" id="regName" name="name" placeholder="Name">
					<button type="button" class="round btn xbg"
						onclick="aclear('regName')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>
			<div class="inputwrap ">
				<div class="radioline fwrap2 sad">
					<div class="radiowrap ">
						<input type="radio" id="Blank" value="" name="gender" checked>
						<label for="Blank"> <i>Gender</i> <span>No Answer</span>
						</label>
					</div>
					<div class="radiowrap">
						<input type="radio" id="Male" value="Male" name="gender">
						<label for="Male"> <i class="fa-solid fa-mars rdmale"
							style="color: var(--text-1);"></i> <span>Male</span>
						</label>
					</div>
					<div class="radiowrap">
						<input type="radio" id="Female" value="Female" name="gender">
						<label for="Female"> <i class="fa-solid fa-venus rdfemale"
							style="color: var(--text-1);"></i> <span>Female</span>
						</label>
					</div>
					<div class="radiowrap">
						<input type="radio" id="Other" value="Other" name="gender">
						<label for="Other"> <i
							class="fa-solid fa-genderless rdother"></i> <span>Other</span> <i
							class="textInRadiowrap"> <input type="text" id="Others"
								placeholder="input:">
						</i>
						</label>
					</div>
				</div>
				<p class="errmsg"></p>
			</div>
			<div class="inputwrap ">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-mobile-button"></i>
					</div>
					<input type="text" id="regPNone" name="phone1"
						placeholder="Phone Number 1" oninput="oninputPhone('regPNone')">
					<button type="button" class="round btn xbg"
						onclick="aclear('regPNone')">
						<i class="fa-solid fa-eraser"></i>
					</button>
				</div>
				<p class="errmsg"></p>
			</div>
			<div class="inputwrap ">
				<div class="inputline sad">
					<div class="round notwkbtn">
						<i class="fa-solid fa-phone"></i>
					</div>
					<input type="text" id="regPNtwo" name="phone2"
						placeholder="Phone Number 2" oninput="oninputPhone('regPNtwo')">
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
				<div class="inputwrap ">
					<div class="inputline2 ">
						<p>ZipCode:</p>
						<input type="text" id="regZip" name="zipcode">
					</div>
					<p class="errmsg"></p>
				</div>
				<div class="inputwrap ">
					<div class="inputline2 ">
						<p>Address1:</p>
						<input type="text" id="regAddOne" name="address1">
					</div>
					<p class="errmsg"></p>
				</div>
				<div class="inputwrap ">
					<div class="inputline2 ">
						<p>Address2:</p>
						<input type="text" id="regAddTwo" name="address2">
					</div>
					<p class="errmsg"></p>
				</div>
				<br>
			</div>
			<div class=" submitform margt10">
				<button class="submitbtn btn wrap hbg " type="submit">Sign
					Up</button>
				<button type="button" class="clearbtn wrap btn xbg"
					onclick="clearAllSignup()">
					<i class="fa-solid fa-eraser"></i>
				</button>
			</div>
		</form>
	</main>
</div>