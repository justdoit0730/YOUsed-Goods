<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 다음페이지 -->

<!-- 다음페이지 -->


<%@ include file="../header2.jsp"%>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>물건사기</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="main.do"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">종류<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="portfolio.do">전체</a>
						<a href="portfolioCategory.do?category=인테리어">인테리어</a>
						<a href="portfolioCategory.do?category=가전제품">가전제품</a>
						<a href="portfolioCategory.do?category=생활용품">생활용품</a>
						<a href="portfolioCategory.do?category=기타">기타</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">카테고리<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="portfolio.do">물건사기</a>
						<a href="portfoliowrite.do" onclick="return checkLogin()">물건팔기</a>
						<a href="qa.do">자유게시판</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="search_wrap">
	  
		<!-- <div class="record_group">
			<p>총게시글<span>120</span>건</p>
		</div> -->
		
		<div class="search_group">
			<form name="myform"  action="portfolioSearch.do" method="get">
				<select name="sel" class="select">
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<input type="text" name="word" class="search_word">
				<button class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div>
	  
	   <!-- search end -->
	   
	  <div class="bord_list">
		<ul class="basic_board">
		<c:forEach var="nlist" items="${portfolioList}">
			<li>
				<span class="date">
				<fmt:parseDate var="regdate" value="${nlist.regdate }" pattern="yyyy-MM-dd"/>
					<em><fmt:formatDate value="${regdate}" pattern="dd"/></em>
					<fmt:formatDate value="${regdate}" pattern="yyyy-MM"/>
				</span>
				<div class="text_wrap">
					<div class="img_wrap">
					<a href = "portfolioview.do?bno=${nlist.bno}">
						<img src="${pageContext.request.contextPath}/upload/${nlist.imgurl}" alt="">
						</a>
					</div>
					<span class="info">
						<span class="blue_text"></span>
						<i class="bar"></i>
						<span> ${nlist.category } </span>
						<i class="bar"></i>
						<span> ${nlist.nickname} </span>
						<i class="bar"></i>
						
						<%-- <i class="fa fa-eye"></i> 
						<span>${nlist.viewcount }</span> --%>
						
					</span>
					<p class="title">
						<a href = "portfolioview.do?bno=${nlist.bno}">${nlist.title }</a>
					</p>
					<span class="text">
						 ${nlist.content}
					</span>
				</div>
			</li>
		</c:forEach>
		</ul>
		<div class="paging">
			<a href=""><i class="fa  fa-angle-double-left"></i></a>
			<a href=""><i class="fa fa-angle-left"></i></a>
			<a href="" class="active">1</a>
			<a href=""><i class="fa fa-angle-right"></i></a>
			<a href=""><i class="fa  fa-angle-double-right"></i></a>
			<a href="portfoliowrite.do" class="btn_write" onclick="return checkLogin()">글쓰기</a>
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
			})
			
		});
	</script>

<%@ include file="../footer2.jsp"%>