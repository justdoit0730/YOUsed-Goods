<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>자유게시판</h2>
				<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="main.do"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">종류<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="../about/gratings.html">전체</a>
						<a href="../about/gratings.html">인테리어</a>
						<a href="../portfolio/portfolio.html">가전제품</a>
						<a href="../notice/notice.html">생활용품</a>
						<a href="../notice/notice.html">기타</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">카테고리<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="portfolio.do">물건사기</a>
						<a href="portfoliowrite.do">물건팔기</a>
						<a href="qa.do">자유게시판</a>
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
				
				<c:forEach var="nlist" items="${qaList}">
			<li>
				<span class="date">
				<fmt:parseDate var="regdate" value="${nlist.regdate }" pattern="yyyy-MM-dd"/>
					<em><fmt:formatDate value="${regdate}" pattern="dd"/></em>
					<fmt:formatDate value="${regdate}" pattern="yyyy-MM"/>
				</span>
				<div class="text_wrap">
					<div class="img_wrap">
						<img src="${pageContext.request.contextPath}/upload/${list.imgurl}" alt="">
					</div>
					<span class="info">
						<span class="blue_text"></span>
						<i class="bar"></i>
						<span> ${list.nickname} </span>
						<i class="bar"></i>
						<i class="fa fa-eye"></i> ${list.viewcount }
						
					</span>
					<p class="title">
						<a href = "portfolioview.do?bno=${list.bno}">${list.title }</a>
					</p>
					<span class="text">
						 ${list.content}
					</span>
				</div>
			</li>
		</c:forEach>
				
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
			<a href="javascript:void(0)" class="btn_write" id="btn_qaWrite">글쓰기</a>
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
			
			
			$("#btn_qaWrite").on("click", function() {
				var userid ="${userid}"; 
				if(!userid) {
					alert("로그인 하세요");
					location.href="login.do";
				}else{
					location.href="qawrite.do";
				}
			})
			
		});
	</script>

<%@ include file="../footer2.jsp"%>