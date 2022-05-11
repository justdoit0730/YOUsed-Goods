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
	  <!-- search end -->
	  <div class="bord_list">
		
		<div class="faq-group">
		<ul>
			<li>
				<button class="accordion">
				전문가로 대우받기 위한 경력은 최소한 몇년?
				</button>
				<div class="panel">
					<p>전문가로 대우받기 위해서는 각 분야에 직무능력과 직무기술을 습득하는 것을 기본으로 하지요. 최소한 일만시간(3년)을 투자할 생각으로 배우고 익히고 인내하고 시간 노력을 투자 하시면 됩니다</p>
				</div>
			</li>
			<li>
				<button class="accordion">
				전문가로 대우받기 위한 경력은 최소한 몇년?
				</button>
				<div class="panel">
					<p>전문가로 대우받기 위해서는 각 분야에 직무능력과 직무기술을 습득하는 것을 기본으로 하지요. 최소한 일만시간(3년)을 투자할 생각으로 배우고 익히고 인내하고 시간 노력을 투자 하시면 됩니다</p>
				</div>
			</li>
			<li>
				<button class="accordion">
				전문가로 대우받기 위한 경력은 최소한 몇년?
				</button>
				<div class="panel">
					<p>전문가로 대우받기 위해서는 각 분야에 직무능력과 직무기술을 습득하는 것을 기본으로 하지요. 최소한 일만시간(3년)을 투자할 생각으로 배우고 익히고 인내하고 시간 노력을 투자 하시면 됩니다</p>
				</div>
			</li>
		</ul>
		</div>

		<script>
			$(function() {
				$(".accordion").on("click",function() {
					$(".panel").not($(this).next().slideToggle()).slideUp();
					$(".accordion").not($(this)).removeClass("active");
					$(this).toggleClass("active");
				});
			});
		</script>

		
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