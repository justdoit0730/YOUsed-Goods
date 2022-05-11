<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header2.jsp" %>

<body id="page-top">

 <section class="content-section bg-primary1 text-white text-center" id="services">
            <div class="container px-4 px-lg-5">
                <div class="content-section-heading">
                    <h3 class="text-secondary mb-0">YOUsed goodS</h3>
                    <h2 class="mb-5" style="color:#000;">로그인
                    </h2>
                </div>
                
                
                <!-- 예시 -->
                <div class="sub_title">
	
	<!-- container end -->
</div>

<div class="container">

	<div class="member_boxL">
		<h2>개인회원</h2>
		<div class="login_form">
			<form id="login" method="post">
				<div class="fl_clear">
					<label for="mbrId">아이디</label> <input name="id" id="id" type="text">
				</div>
				<div class="fl_clear">
					<label for="scrtNo">비밀번호</label> <input name="pw" id="pw"
						type="password">
				</div>
				<a class="btn_login btn_Blue" href="javascript:fn_login();">로그인</a>
			</form>
		</div>
		<span> ${msg }</span>
	</div>

</div>
<!-- end contents -->
<c:if test="${not empty msg}">
	<script>
		$(document.ready(function)){
			alert("${msg}");	
		}))
		
	</script>
</c:if>

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

<script>
  		function fn_login() {
      		var log = document.getElementById("login");
    		log.method = "post";
    		log.action = "login.do";
    		log.submit();
   		}
   
</script>
                <!-- 예시 -->
                
                
            </div>
        </section>
</body>

<%@ include file = "../footer2.jsp" %>