<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header.jsp" %>

<body id="page-top">
 <section class="content-section bg-primary1 text-white text-center" id="services">
            <div class="container px-4 px-lg-5">
                <div class="content-section-heading">
                    <h3 class="text-secondary mb-0">YOUsed goodS</h3>
                    <h2 class="mb-5" style="color:#000;">특징
                    </h2>
                </div>
                
                <!-- 선생님 -->
                


 <body>
 <!-- 
 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->
			
			<div class="gnb_group">
				<h1 class="logo">JSL CO</h1>
				<nav class="gnb">
					<ul class="nav_1depth">
						<li><a href="../about/gratings.html">기업소개</a>
							<ul class="nav_2depth">
								<li><a href="../about/gratings.html">인사말</a></li>
								<li><a href="../about/history.html">연혁 및 </a></li>
								<li><a href="../about/gratings.html">교직원소개</a></li>
								<li><a href="../about/photo.html">대우갤러리</a></li>
								<li><a href="../about/map.html">찾아오시는길</a></li>
							</ul>
						</li>
						<!--<li><a href="allclass.html">학과및모집안내</a>
							<ul class="nav_2depth">
								<li><a href="allclass.html">전체모집과정</a></li>
								<li><a href="allclass.html">스마트웹콘텐츠개발과정</a></li>
							</ul>
						</li> -->
						<li><a href="../portfolio/portfolio.html">포트폴리오</a>
							<ul class="nav_2depth">
								<li><a href="../portfolio/portfolio.html">포트폴리오</a></li>
							</ul>
						</li>
						<!-- <li><a href="online.html">온라인접수</a>
							<ul class="nav_2depth">
								<li><a href="online.html">온라인접수</a></li>
								<li><a href="online.html">취업성공패키지</a></li>
							</ul>
						</li> -->
						<li><a href="notice.html">커뮤니티</a>
							<ul class="nav_2depth">
								<li><a href="../notice/notice.html">공지사항</a></li>
								<li><a href="qa.html">질문과답변</a></li>
								<li><a href="../faq/faq.html">FAQ</a></li>
								<li><a href="../pds/pds.html">자료실</a></li>
								<li><a href="../adm/admin.html">관리자</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<div class="line">
		</div>

	</div>

	<script>
		//$(document).ready(function() {
		$(function() {
			$(".gnb>.nav_1depth>li").hover(function() {
				$(".gnb>.nav_1depth>li").removeClass();
				$(this).addClass("active");

				//$(this).children(".nav_2depth").show();
				//}, function() {
				//  $(".gnb>.nav_1depth>li").removeClass();
				//  $(this).children(".nav_2depth").hide();
				//	});

				$(this).children(".nav_2depth").stop().slideDown("fast");
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").stop().slideUp("fast");
					});

				/* $(this).children(".nav_2depth").fadeIn();
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").fadeOut();
					}); */

			});
	</script>

	
	<!-- sub contents -->
	<div class="sub_title">
		<h2>질문과답변</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.html"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a>
						<a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">질문과답변<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">공지사항</a>
						<a href="qa.html">질문과답변</a>
						<a href="faq.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>120</span>건</p>
		</div>
		<div class="search_group">
			<form name="myform" action="">
				<select name="sel" class="select">
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<input type="text" name="search" class="search_word">
				<button class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	  <div class="bord_list">
		<table class="bord_table" summary="이표는 번호,제목,답변상태, 작성자, 작성일, 조회수로 구성되어 있습니다">
			<caption class="sr-only">질문과 답변 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>답변상태</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>8</td>
					<td class="title"><a href="qa_view.html">입학절차에 대하여 알고 싶어요</a></td>
					<td><span class="waiting">답변대기</span></td>
					<td>관리자</td>
					<td>18-10-16</td>
					<td>187</td>
				</tr>
				<tr>
					<td>7</td>
					<td class="title"><a href="qa_view.html">무엇이 궁금한가요?</a></td>
					<td><span  class="complet">답변완료</span></td>
					<td>관리자</td>
					<td>18-10-16</td>
					<td>187</td>
				</tr>
				<tr>
					<td>6</td>
					<td class="title"><a href="qa_view.html">궁굼한내용제목입니다</a></td>
					<td><span class="waiting">답변대기</span></td>
					<td>관리자</td>
					<td>18-10-16</td>
					<td>187</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<a href=""><i class="fa  fa-angle-double-left"></i></a>
			<a href=""><i class="fa fa-angle-left"></i></a>
			<a href="" class="active">1</a>
			<a href="">2</a>
			<a href="">3</a>
			<a href="">4</a>
			<a href="">5</a>
			<a href=""><i class="fa fa-angle-right"></i></a>
			<a href=""><i class="fa  fa-angle-double-right"></i></a>
			<a href="qa_write.html" class="btn_write">글쓰기</a>
		</div>
	  </div>
	</div>
	<!-- end contents -->
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>
	              
                
                <!-- 선생님 -->
            </div>
        </section>
</body>

<%@ include file = "../footer.jsp" %>