<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String username = request.getParameter("username");
boolean check = dao.usernameCheck(username);
%>
<html>
<head>
<title>Username Check</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/popup.css">

<script>
        setTimeout(function() {
            window.close();
        }, 5000); 
</script>

</head>
<body
	style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;"
	class="flowscroll">
	<br>
	<section class="popupwrap wrap">
		<h1 class="heading">Username Check</h1>
		<hr>
		<div class="box">

			<b><%=username%></b>
			<%
			if (check) {
				out.println("UserName is already taken.<br>");
			} else {
				out.println("UserName is available.");
			}
			%>
			<p>this window will be closed automatically in 5sec</p>

		</div>
		<a class="btn round" href="#" onClick="javascript:self.close()">Close</a>
	</section>
</body>
</html>