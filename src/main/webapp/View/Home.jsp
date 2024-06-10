<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Typhoon</title>
    <link rel="icon" href="/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/slideshow.css">

    <script src="../js/slideshow.js"></script>
    <script src="../js/script.js"></script>
</head>

<body 
onload="onloadMsgSlide('반가워요',true)" 
style="background-image: url(../img/food/nonalc/nicks/img1.jpg); 
background-size: cover; 
background-repeat: no-repeat;" 
class="flowscroll">

<!-- 검색용 제목 -->
<h1 class="hide"> Jungwoo Shin Personal HomePage</h1>


<!-- 고정부분 -->
<jsp:include page="../Parts/Fixed.jsp"></jsp:include>
<!-- Main -->
<jsp:include page="../Parts/Main.jsp"></jsp:include>
<!-- Footer -->
<jsp:include page="../Parts/Footer.jsp"></jsp:include>
<!-- /body /html -->

</body>
</html>