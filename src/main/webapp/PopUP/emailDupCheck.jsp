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
<title>E-Mail Check</title>
<link rel="stylesheet" href="../css/<%=theme%>.css?ver2323">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/popup.css">

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
    <section class="popupwrap wrap">
        <h1 class="heading">Username Check</h1>
        <hr>
        <div class="box
        
        
        ">
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
        <a class="btn round" href="#" onClick="sendIDCHECK(<%= check %>)">Close</a>
    </section>
</body>
</html>
