<%@page import="tool.GetRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//GetRandom.stringNumber(1, 10);
%>
<link rel="stylesheet" href="../css/slideshow.css?ver12231">
<script src="../js/slideshow.js?ver122222"></script>
<div

class="slideshow-wrap">
	<div class="slideshow">
		<div class="slideshow_slides">
			<a href="#" id="slide1"> <img
				src="../img/test/webp<%=GetRandom.stringNumber(1,4)%>.webp" alt="Image 1">
				<b class="caption cbg blur">랜덤사진1</b>
			</a> <a href="#" id="slide2"> <img
				src="../img/test/webp<%=GetRandom.stringNumber(1,4)%>.webp" alt="Image 2">
				<b class="caption cbg blur">랜덤사진2</b>
			</a> <a href="#" id="slide3"> <img
				src="../img/test/webp<%=GetRandom.stringNumber(1,4)%>.webp" alt="Image 3">
				<b class="caption cbg blur">랜덤사진3</b>
			</a> <a href="#" id="slide4"> <img
				src="../img/test/webp<%=GetRandom.stringNumber(1,4)%>.webp" alt="Image 4">
				<b class="caption cbg blur">랜덤사진4</b>
			</a>
		</div>
	</div>
	
	<div class="slideshow_nav cbg blur">
		<a href="#" class="prev"><i class="fa-solid fa-chevron-left"></i></a>
		<div class="indicator">
			<a href="#" class="active"> <i class="fa-solid fa-circle-notch"></i></a>
			<a href="#"> <i class="fa-solid fa-circle-notch"></i></a> <a href="#"><i
				class="fa-solid fa-circle-notch"></i></a> <a href="#"><i
				class="fa-solid fa-circle-notch"></i></a>
		</div>
		<a href="#" class="next"><i class="fa-solid fa-chevron-right"></i></a>
	</div>
</div>


<main class="mainwarp cbg blur semiround ">
	<section class="content-wrapper semiround ">
		<h4 class="heading tbg">sample tbg</h4>
		<div class="content-box vbg">
			<h2>vbg</h2>
			<img src="../img/test/img<%=GetRandom.stringNumber(1, 7)%>.jpg"
				alt="Image 4">
			<h3>Trip</h3>
			<p>Some content Some content forSome content forSome content for</p>
		</div>
		<div class="content-box cbg">
			<h2>cbg</h2>
			<img src="../img/test/img<%=GetRandom.stringNumber(1, 7)%>.jpg"
				alt="Image 3">
			<h3>Music</h3>
			<p>Some content forSome content forSome content forSome content
				forSome content for</p>
		</div>
		<div class="content-box large gbg">
			<h2>gbg Large</h2>
			<img src="../img/test/img<%=GetRandom.stringNumber(1, 7)%>.jpg"
				alt="Image 2">
			<h3>Aviation</h3>
			<p>Some content forSome content forSome content forSome content
				forSome content for</p>
		</div>
		<div class="content-box nbg">
			<h2>nbg</h2>
			<img src="../img/test/img<%=GetRandom.stringNumber(1, 7)%>.jpg"
				alt="Image 4">
			<h3>Trip</h3>
			<p>Some content for box 4.</p>
		</div>
		<div class="content-box obg blur">
			<h2>obg + blur</h2>
			<img src="../img/test/img<%=GetRandom.stringNumber(1, 7)%>.jpg"
				alt="Image 2">
			<h3>Aviation</h3>
			<p>Some content forSome content forSome content forSome content
				forSome content forSome content forSome content for</p>
		</div>
	</section>
</main>
