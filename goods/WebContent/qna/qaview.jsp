<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>질문답변</h2>
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
					<a href="">질문답변<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="gratings.html">질문답변</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="board_view">
			<h2><span class="title">${qview.title}</span></h2>
			<p class="info"><span class="nickname">${qview.nickname }</span> | 2018-10-18 | <i class="fa fa-eye"></i>  ${qview.viewcount }</p>
			<div class="board_body">
				<p> ${pview.content }</p>
				<p style="font-weight:bold">답변</p>
				<p>댓글창!</p>
			</div>
			<div class="prev_next">
				<a href="" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>이전글제목표시</span>
				</span>
				</a>
				<div class="btn_3wrap">
					<a href="qa.html">목록</a> <a href="qa_modify.html">수정</a> <a href="qa_delete.html" onClick="return confirm('삭제하시겠어요?')">삭제</a> <a href="qa_reply.html">글쓰기</a>
				</div>
				<a href="" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>다음글제목표시</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
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

<%@ include file="../footer2.jsp"%>