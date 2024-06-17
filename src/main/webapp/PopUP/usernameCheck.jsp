<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="controller.UserDAO" />
<%
String username = request.getParameter("username");
boolean check = dao.usernameCheck(username);

String theme  = (String)session.getAttribute("theme");
if(theme ==null)theme  = "default_theme";
%>
<html>
<head>
<title>Username Check</title>
<link rel="stylesheet" href="../css/<%=theme%>.css?ver2323">
<link rel="stylesheet" href="../css/style.css?ver2323">
<link rel="stylesheet" href="../css/popup.css?ver2323">

<script>
    function sendIDCHECK(check) {
        opener.document.getElementById('susernamepass').value = check ? 'taken' : 'available';
        opener.updateUsernameField(); // Call function in the opener window
    }

    // Call the function immediately after defining it
    sendIDCHECK(<%= check %>);

    // Set a timeout to close the window after 5 seconds
    setTimeout(function() {
        window.close();
    }, 5000);
</script>

</head>
<body style="background-image: url(../img/food/nonalc/nicks/img1.jpg); background-size: cover; background-repeat: no-repeat;" class="flowscroll">
    <br>
    <section class="popupwrap vbg wrap">
        <h1 class="heading obg sad">Username Check</h1>
        <div class="box sad <%if(check){%>xbg<%}else{%>hbg<%}%>">
            <b><%=username%></b>
            <%
            if (check) {
                out.println("UserName is already taken.<br>");
            } else {
                out.println("UserName is available.");
            }
            %>
            <p>This window will be closed automatically in 5 seconds</p>
        </div>
        <a class="btn sad xbg" href="#" onClick="window.close()">Close</a>
    </section>
</body>
</html>
