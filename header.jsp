<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>YOUsed goods</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/goods/css/styles.css?after" rel="stylesheet" />
<link href="/goods/mycss/headerCss.css?after" rel="stylesheet" />
<link href="/goods/css/bootstrap.min.css?after" rel="stylesheet">
<script src="/goods/js/my.js?after"></script>
<style>
</style>
<body id="page-top">
	<!-- Navigation-->
	<a class="menu-toggle rounded" href="#"><i class="fas fa-bars"></i></a>
	<nav class="gnb" id="sidebar-wrapper">
		<ul class="sidebar-nav nav_1depth">
			<c:choose>
				<c:when test="${empty userid}">
					<li class="sidebar-brand fisrt"><a href="login.do">로그인</a></li>
					<li class="sidebar-brand"><a href="member.do">회원가입</a></li>
				</c:when>
				<c:when test="${not empty userid}">
					<li style : background> ${nickname} 님 환영합니다!</li>
					<li class="first sidebar-brand"><a href="logout.do">로그아웃</a></li>
					<li class="sidebar-brand"><a href="mypage.do">마이페이지</a></li>
				</c:when>
			</c:choose>
		</ul>
		<ul class="sidebar-nav nav_1depth">
			<li class="sidebar-nav-item"><a href="#page-top">Home</a></li>
			<li class="sidebar-nav-item"><a href="">거래하자!</a>
				<ul class="nav_2depth" style="display: none;">
					<li><a href="portfolio.do">물건사기</a></li>
					<li><a href="portfoliowrite.do" onclick="return checkLogin(${userid})" >물건팔기</a></li> <!--  "-->
					<li><a href="qa.do">자유게시판</a></li>
				</ul></li>
			<li class="sidebar-nav-item"><a href="">커뮤니티</a>
				<ul class="nav_2depth" style="display: none;">
					<li><a href="/goods/faq/faq.jsp" class="">FAQ</a></li>
					<li><a href="/goods/about/gratings.jsp" class="">QnA</a></li>
					<li><a href="../about/gratings.html" class="">공지사항</a></li>
					<li><a href="../gallery/photo.html" class="">관리자</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class="sidebar-nav nav_1depth">
		
		<li class="sidebar-nav-item"><a href="">국적</a>
				<ul class="nav_2depth" style="display: none;">
					<li><a href="/goods/faq/faq.jsp" class="">한국</a></li>
					<li><a href="/goods/indexj.jsp" class="">일본</a></li>
					
				</ul>
			</li>
		</ul>
		
	</nav>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- 드랍다운 -->

	<script>
		//$(document).ready(function() {
		$(function() {
			$(".gnb>.nav_1depth>li").hover(function() {
				$(".gnb>.nav_1depth>li").removeClass("active");
				$(this).addClass("active");

				//$(this).children(".nav_2depth").show();
				//}, function() {
				//  $(".gnb>.nav_1depth>li").removeClass();
				//  $(this).children(".nav_2depth").hide();
				//	});

				$(this).children(".nav_2depth").stop().slideDown("fast");
			}, function() {
				$(".gnb>.nav_1depth>li>.nav_2depth").removeClass("active");
				$(this).children(".nav_2depth").stop().slideUp("fast");
			});

			/* $(this).children(".nav_2depth").fadeIn();
			}, function() {
			  $(".gnb>.nav_1depth>li").removeClass();
			  $(this).children(".nav_2depth").fadeOut();
				}); */

		});
	</script>
</body>
