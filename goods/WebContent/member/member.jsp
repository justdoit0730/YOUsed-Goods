<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<link href="/goods/css/styles2.css" rel="stylesheet" />
<%@ include file="../header2.jsp"%>

<section class="content-section bg-primary1 text-white text-center"
	id="services">
	<div class="container px-4 px-lg-5">
		<div class="content-section-heading">
			<h3 class="text-secondary mb-0">YOUsed goodS</h3>
			<h2 class="mb-5" style="color: #000;">회원가입</h2>
		</div>
		</div>
		</section>


		<!-- 예시 -->
	
		<div class="container">
			
			<div class="join_write col_989">
				<form name="member" id="member" method="post" action="member.do">
					<div class="list_con">
						<ul class="icon_type1">
							<li>회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제3자에게
								제공되지 않습니다.</li>
						</ul>
						<input type="checkbox" name="agree" id="agree" value="t">동의	합니다.
					</div>
					<table class="table_write02"
						summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
						<caption>회원가입을 위한 정보입력표</caption>
						<colgroup>
							<col width="160px">
							<col width="auto">
						</colgroup>
						<tbody id="joinDataBody">
							<tr>
								<th><label for="name">이름</label></th>
								<td><input type="text" name="name" id="name" class="w300">
								</td>
							</tr>
							<tr>
								<th><label for="nickname">닉네임<span class="must"></span></label></th>
								<td><input type="text" name="nickname" id="nickname" class="w300">
									<span id="nickmsg" style="color: #f00;"></span></td>
							</tr>
							<tr>
								<th><label for="id">아이디<span class="must"></span></label></th>
								<td><input type="text" name="id" id="id" class="w300">
									<span id="msg" style="color: #f00;"></span></td>
							</tr>
							<tr>
								<th><label for="pw1">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
								<td><input type="password" name="pw1" id="pw1" class="w300">
									<p class="guideTxt">
										<span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로
										9~13자로 작성해 주십시오.
									</p></td>
							</tr>
							<tr>
								<th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
								<td><input type="password" name="pw2" id="pw2" class="w300">
									<p class="guideTxt">
										<span class="tc_point">비밀번호 미입력시 기존비밀번호가 유지됩니다.</span>
									</p></td>
							</tr>

							<tr>
								<th><label for="phone">전화번호<span class="must"><b>필수입력</b></span></label></th>
								<td><input type="text" name="phone" id="phone" class="w300">
								</td>
							</tr>
							<tr>
								<th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
								<td><input type="email" name="email" id="email"
									class="w300"></td>
							</tr>
					</table>

					<div class="btnArea Acenter pt60 pb100">
						<a href="javascript:fn_save();"	class="btn_round btn_large btn_pointColor w180" id="btn_ok">
							<b>회원가입하기</b>
						</a> 
						<a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180">
							<b>뒤로가기</b>
						</a>
					</div>

				</form>

			</div>
		</div>
		<!-- end contents -->



		<script>
		function() { 
				 $(".location  .dropdown > a").on("click", function(e) {
					e.preventDefault();
					if ($(this).next().is(":visible")) {
						$(".location  .dropdown > a").next().hide();
					} else {
						$(".location  .dropdown > a").next().hide();
						$(this).next().show();
					}
				}); 

				$("#btn_ok").on("click",
								function() {
									if ($("#agree").is(":checked") == false) {
										alert("약관동의 체크 하세요"); return false;
									}
									if (!$("#name").val()) {// if(member.name.value == "")
										alert("이름입력");	 $("#name").focus(); return false;
									}
									if (!$("#pw1").val() || !$("#pw2").val()) {
										alert("패스워드는 필수 입력 입니다"); $("#pw1").focus(); return false;
									}
									if ($("#pw1").val() != $("#pw2").val()) {
										alert("패스워드 확인 하세요"); $("#pw1").focus(); return false;
									}

									//정규 표현식
									var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //""붙이면안된다 

									if (!regEmail.test($("#email").val())) {
										alert("유효한 이메일 주소를 입력하세요");
										$("#email").focus();
										return false;
									}

									$("#member").submit(); //action을 실행한다
								})

							
				$("#nickname").blur(function(){
					$.ajax({
						type: "post",
						url: "checkUserNickname.do",
						data : {
							nickname : $("#nickname").val()
						},
						success : function(data) {
							console.log($("#nickname").val());
							console.log(data);
							if (data != 1) {
								if ($("#nickname").val() != "") {
									$("#nickmsg").html("사용 가능한 닉네임입니다");
								}
							} else {
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
								
				$("#id").blur(function() {
					//비동기식 id 존재여부 확인하기
					$.ajax({
						type : "post",
						url : "checkUserid.do",
						data : {
							id : $("#id").val()
						},
						success : function(data) {
							console.log(data);
							if (data != 1) {
								if ($("#id").val() != "") {
									$("#msg").html("사용 가능한 아이디 입니다");
								}
							} else {
								if ($("#id").val() != "") {
									$("#msg").html("사용 불가능한 아이디 입니다");
									$("#id").val("");
									$("#id").focus();
								}
							}
						},
						error : function() {
							alert("통신에러");
						}
					})
				})

			});
		</script>


		<%@ include file="../footer2.jsp"%>