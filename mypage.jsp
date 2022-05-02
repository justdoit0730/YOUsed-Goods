<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>회원인증</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="main.do"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">거래하자!<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="potofolio.do">물건사기</a>
						<a href="potofoliowrite.do">물건팔기</a>
						<a href="qa.do">자유게시판</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">공지사항<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">FAQ</a>
						<a href="qa.html">QNA</a>
						<a href="faq.html">공지사항</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="con_title">
            <h1>메일인증</h1>
         <p>메일 인증을 통하여 정보를 수정할 수 있습니다</p>
        </div>
		<div class="join_write col_989">
			
        	<div class="fl_clear">
        		<input name="email" id="email" type="text" placeholder="이메일주소입력">
        		<input type="button" value="이메일전송" id="btn_email" class="btn_email">
        	</div>
        	<div class="fl_clear">
        		<input name="certinumber" id="certinumber" type="text" placeholder="인증번호 입력"> 
        		<a class="btn_login btn_blue" href="javascript:void(0)" id="btn_ok">확인</a>
        	</div>
        	
        	
        
        </div>
	</div>
	<!-- end contents -->
	
	
	
	<script>
		$(function() {
			//locatin jquery
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
			
			
			//email jquery
			$("#btn_email").on("click", function(e) {
				var email = $("#email").val();
				if(email == "") {
					alert("이메일주소 입력");
					$("#email").focus();
				}else{
					$.ajax({
						type:"post",
						async:false,
						data:{"email":$("#email").val()},
						url:"emailSend.do",
						dataType:"json", //서버에서 보내주는 데이타 형식
						success:function(data) {
							alert(data.msg);
						},error:function() {
							alert("email error");
						}
					})
				}
			})
			
			//#btn_ok 클릭 이벤트 처리
			$("#btn_ok").on("click", function(){ //확인버튼 클릭 했을 때
				var certinumber = $("#certinumber").val();
				//ID 가 certinumber 값을 변수에 저장
				if(certinumber == "") { //공백과 같으면
					alert("인증번호 입력"); //메세지 출력
					$("#certinumber").focus(); //커서를 #certinumber인 위치로 이동
				}else{
					$.ajax({
						type:"post",
						url:"certicompare.do",
						data:{"certinumber":certinumber},
						dataType:"json", //서버에서 처리된 결과를 JSON형식으로 받겠다
						async:false,
						success:function(data) {
							alert(data.msg);
							if(data.check == "ok") {
								//location.href="memberupdate.do";
								$(location).attr("href","memberupdate.do");
								//memberupdate.do를 href속성에 넣고 location을 실행한다
							}else{
								$(location).attr("href","mypage.do");
							}
						},error:function() {
							alert("통신에러");
						}
					})
				}
				
			})
			
			
	
		});//
	</script>



<%@ include file="../footer2.jsp"%>