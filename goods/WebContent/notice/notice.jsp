 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!-- sub contents -->
<div class="sub_title">
	<h2>공지사항</h2>
	<div class="container">
		<div class="location">
			<ul>
				<li class="btn_home"><a href="index.html"><i
						class="fa fa-home btn_plus"></i></a></li>
				<li class="dropdown"><a href="">커뮤니티<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a> <a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a> <a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div></li>
				<li class="dropdown"><a href="">공지사항<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">공지사항</a> <a href="qa.html">질문과답변</a> <a
							href="faq.html">FAQ</a>
					</div></li>
			</ul>
		</div>
	</div>
	<!-- container end -->
</div>

<div class="container">
	<div class="search_wrap">
		<div class="record_group">
			<p>
				총게시글<span> ${count} </span>건
			</p>
		</div>
		<div class="search_group">
			<form name="myform" method="get" action="notice.do">
				<select name="sel" class="select">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="word" class="search_word"> 
				
				<button class="btn_search" type="submit">
					<i class="fa fa-search"></i> <span class="sr-only">검색버튼</span>
				</button>
			</form>
		</div>
	</div>
	<!-- search end -->
	<div class="bord_list">
		<table class="bord_table" summary="이표는 번호,제목,글쓴이,날자,조회수로 구성되어 있습니다">
			<caption class="sr-only">공지사항 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="num" value="${count - ((pageMaker.cri.pageNum-1) * 10)}" />
				<c:forEach var="nlist" items="${noticeList}">
					<tr>
						<td>${num}</td>
						<td class="title"><a href="noticeview.do?bno=${nlist.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${nlist.title}</a></td>
						<td>${nlist.writer }</td>
						<td><fmt:parseDate var="dateString" value="${nlist.wdate }"
								pattern="yyyy-MM-dd" /> <fmt:formatDate value="${dateString}"
								pattern="yyyy-MM-dd" /></td>
						<td>${nlist.viewcount}</td>
					</tr>
					<c:set var="num" value="${num-1}" />
				</c:forEach>
			</tbody>
		</table>
		<div class="paging">
			<c:if test="${pageMaker.prev}">
				<a href="${pageMaker.startPage-1 }"><i
					class="fa  fa-angle-double-left"></i></a>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<!-- 반복실행-->
				<a href="${num}"
					class="${pageMaker.cri.pageNum == num?'active' :''}">${num}</a>
			</c:forEach>
			<!-- 반복실행-->
			<c:if test="${pageMaker.next}">
				<a href="${pageMaker.startPage+1}"><i
					class="fa  fa-angle-double-right"></i></a>
			</c:if>
			<div>
				<a href="noticewrite.do" class="btn_write">글쓰기</a>
			</div>
		</div>
	</div>
</div>
<!-- end contents -->

<form id="actionForm" action="notice.do" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>

<script>
	$(function() {
		$(".location  .dropdown > a").on("click", function(e) {
			e.preventDefault();
			if ($(this).next().is(":visible")) {
				$(".location  .dropdown > a").next().hide();
			} else {
				$(".location  .dropdown > a").next().hide();
				$(this).next().show();
			}
		});

		//page event 

		var actionForm = $("#actionForm");
		$(".paging > a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		})
	});
</script>



<%@ include file="../footer.jsp"%>