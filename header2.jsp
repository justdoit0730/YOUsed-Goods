<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="java.io.File"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>YOUsed goodS</title>

<link href="/goods/css/bootstrap.min.css" rel="stylesheet">
<link href="/goods/css/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="/goods/css/styles2.css?ver=1">
<link href="/goods/css/common.css" rel="stylesheet">
<link href="/goods/css/layout.css" rel='stylesheet'>
<link href="/goods/css/font-awesome.min.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link href="/goods/css/sub.css" rel="stylesheet">


<script src="/goods/js/jquery-3.3.1.min.js"></script>
<script src="/goods/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<script src="/goods/js/my.js"></script>
</head>

<!-- BODY -->
<body id="page-top">
	<nav
		class="navbar navbar-expand-lg navbar-dark fixed-top sub-bg-black z-9999"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand sub-mg-auto" href="/goods/main.do">Youesd
				goodS</a>


		</div>
	</nav>

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
					<li>${nickname} 님 환영합니다!</li>
					<li class="first sidebar-brand"><a href="logout.do">로그아웃</a></li>
					<li class="sidebar-brand"><a href="mypage.do">마이페이지</a></li>
				</c:when>
			</c:choose>
		</ul>
		<ul class="sidebar-nav nav_1depth">
			<li class="sidebar-nav-item"><a href="/goods/">Home</a></li>
			<li class="sidebar-nav-item"><a href="">거래하자!</a>
				<ul class="nav_2depth" style="display: none;">
					<li><a href="portfolio.do">물건사기</a></li>
					<li><a href="portfoliowrite.do"
						onclick="return checkLogin(${userid})">물건팔기</a></li>
					<!--  "-->
					<li><a href="qa.do">자유게시판</a></li>
				</ul></li>
			<li class="sidebar-nav-item"><a href="">커뮤니티</a>
				<ul class="nav_2depth" style="display: none;">
					<li><a href="/goods/faq/faq.jsp" class="">FAQ</a></li>
					<li><a href="../about/history.html" class="">QnA</a></li>
					<li><a href="../about/gratings.html" class="">공지사항</a></li>
					<li><a href="../gallery/photo.html" class="">관리자</a></li>
				</ul></li>
		</ul>

	</nav>

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

	<script>
		$(document).ready(function() {
			$(".nav-item").hover(function() {
				$(this).children("div").addClass("active");
			}, function() {
				$(this).children("div").removeClass();
			})
		})
	</script>
</body>

