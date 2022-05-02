<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>

	<!-- sub contents -->
	<div class="sub_title">
		<h2>회원수정</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="main.do"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">메뉴<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">로그인 정보 수정</a>
						<a href="allclass.html">내가 올린 게시글</a>
						<a href="portfolio.html">좋아요 누른 게시글</a>
						<a href="online.html">자유게시판</a>
						
					</div>
				</li>
				
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="con_title">
            <h1>내정보(개인회원)</h1>
         <p>HOME / 마이페이지 / 내정보(개인회원)</p>
        </div>
		<div class="join_write col_989">
			<form name="member" id="member" method="post" action="memberupdate.do">
                
            <table class="table_write02" summary="회원가입을 위한 닉네임, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <caption>회원가입을 위한 정보입력표</caption>
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                	
                    <tr>
                        <th><label for="nickname">닉네임<span class="must"></span></label></th>
                        <td>
                       		<input type ="hidden" name ="bno" value ="${mupdate.bno}">
                            <input type="text" name="nickname" id="nickname" class="w300" value="${mupdate.nickname}"> 
                            <span id="nickmsg" style="color:#f00;"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw1">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw1" id="pw1" class="w300">
                            <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw2" id="pw2" class="w300">
                            <p class="guideTxt"><span class="tc_point">비밀번호 미입력시 기존비밀번호가 유지됩니다.</span></p>
                        </td>
                    </tr>
                   
					<tr>
                        <th><label for="phone">전화번호<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="phone" id="phone" class="w300" value="${mupdate.phone}">
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="email" name="email" id="email" class="w300" value="${mupdate.email}">
                        </td>
                    </tr>
                    
            </table>
        
        	<div class="btnArea Acenter pt60 pb100">
        		<a href="javascript:void(0)" class="btn_round btn_large btn_pointColor w180" id="btn_ok"><b>회원 수정하기</b></a>
        		<a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180"><b>뒤로가기</b></a>
    		</div>
	
			</form>
        
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
			
			$("#btn_ok").on("click", function() {

				if(!$("#nickname").val()) {// if(member.name.value == "")
					alert("닉네임을 입력하세요!");
					$("#nickname").focus();
					return false;
				}
				
				
				//정규 표현식
				var regEmail=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //""붙이면안된다 
				
				if(!regEmail.test($("#email").val())) {
					alert("유효한 이메일 주소를 입력하세요!");
					$("#email").focus();
					return false;
				}
				alert("수정이 완료되었습니다.");
				$("#member").submit(); //action을 실행한다
			})
			

		});
		$("#nickname").blur(function(){
			$.ajax({
				type: "post",
				url: "checkUserNickname.do",
				data : {
					nickname : $("#nickname").val()
				},
				success : function(data) {
					if (data != 1) {
						console.log("ok");
						if ($("#nickname").val() != "") {
							$("#nickmsg").html("사용 가능한 닉네임입니다");
						}
					} else {
						console.log("no");
						if ($("#nickname").val() != "") {
							$("#nickmsg").html("사용 불가능한 닉네임입니다");
							$("#nickname").val("");
							$("#nickname").focus();
						}
					}
				},
				error : function (){
					alert("통신에러")
				}
			})
		});
	</script>



<%@ include file="../footer2.jsp"%>