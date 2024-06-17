
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,controller.*"%>
<%@page import="model.ZipCodeVO"%>
<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String theme = (String) session.getAttribute("theme");
if (theme == null)
	theme = "default_theme";

request.setCharacterEncoding("UTF-8");

String check = request.getParameter("check");
String dong = request.getParameter("dong");

Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
int totalList = zipcodeList.size();
%>


<html>
<head>
<title>ZipCheck</title>
<link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<link rel="stylesheet" href="../css/<%=theme%>.css?ver2323">
<link rel="stylesheet" href="../css/style.css?ver2322223">
<link rel="stylesheet" href="../css/popup.css?ver2323">


<script>
	function dongCheck() {
		if (document.zipForm.dong.value == "") {
			alert("동이름을 입력하세요");
			document.zipForm.dong.focus();
			return;
		}
		document.zipForm.submit();
	}

	function sendAddress(zipcode, sido, gugun, dong, bunji) {
		var address = sido + " " + gugun + " " + dong + " " + bunji;
		opener.document.regForm.zipcode.value = zipcode;
		opener.document.regForm.address1.value = address;
		self.close();
	}
</script>

</head>
<body
	style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;"
	class="flowscroll">
	<br>
	<section class="popupwrap vbg wrap">
		<h1 class="heading obg sad">Search Address</h1>

		<div class="box sad">

			<form name="zipForm" method="post" action="zipCheck.jsp">
				<div class="inputwrap">
					<div class="inputline sad">

						<div class="round notwkbtn">
							<i class="fa-solid fa-house"></i>
						</div>

						<input type="text" id="zipSearchID" name="dong">

						<button type="button" class="round btn" value="검색"
							onclick="dongCheck()">
							<i class="fa-regular fa-map"></i>
						</button>
						&nbsp

						<button type="button" class="round btn xbg"
							onclick="aclear('zipSearchID')">
							<i class="fa-solid fa-eraser"></i>
						</button>
					</div>
			</form>


			<div class="flowscroll max60vh">
				<input type="hidden" name="check" value="n">
				<table>

					<!-- 3 -->
					<%
					if (check.equals("n")) {
					%>
					<%
					if (zipcodeList.isEmpty()) {
					%>
					<tr>
						<td align="center"><br />검색된 결과가 없습니다.</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td align="center"><br /> ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
					</tr>
					<%
					for (int i = 0; i < totalList; i++) {
						ZipCodeVO vo = zipcodeList.elementAt(i);
						String tempZipcode = vo.getZipcode();
						String tempSido = vo.getSido();
						String tempGugun = vo.getGugun();
						String tempDong = vo.getDong();
						String tempBunji = vo.getBunji();
						if (tempBunji == null)
							tempBunji = " ";
					%>
					<tr>
						<td><a
							href="javascript:sendAddress('<%=tempZipcode%>','<%=tempSido%>'
					,'<%=tempGugun%>','<%=tempDong%>','<%=tempBunji%>')">
								<%=tempZipcode%>&nbsp;<%=tempSido%>&nbsp;<%=tempGugun%> &nbsp;<%=tempDong%>&nbsp;<%=tempBunji%></a><br>
							<%
							} //end for
							} //end else
							%> <%
 }
 %></td>
					</tr>
				</table>

			</div>


			<br>
		</div>
		<a class="btn xbg sad" href="#" onClick="javascript:self.close()">Close</a>
	</section>
</body>
</html>