<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>
<style>
body {
	margin: 10px;
	padding: 10px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.button {
	padding: 10px 40px;
	font-size: 20px;
	background-color: brown;
	color: wheat;
}

#drop-content {
	position: absolute;
	z-index: 1;
}

#drop-content a {
	display: block;
	font-size: 20px;
	background-color: #dfdfdf;
	color: black;
	text-decoration: none;
	padding: 10px 36px;
	margin: 2px 0px 0px 0px;
}
</style>
<!-- sub contents -->
<div class="sub_title">
	<h2>물건판매 수정</h2>
	<div class="container">
		<div class="location">
			<ul>
				<li class="btn_home"><a href="main.do"><i
						class="fa fa-home btn_plus"></i></a></li>
				<li class="dropdown"><a href="">종류<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="../about/gratings.html">전체</a> <a
							href="../about/gratings.html">인테리어</a> <a
							href="../portfolio/portfolio.html">가전제품</a> <a
							href="../notice/notice.html">생활용품</a> <a
							href="../notice/notice.html">기타</a>
					</div></li>
				<li class="dropdown"><a href="">카테고리<i
						class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="portfolio.do">물건사기</a> <a href="portfoliowrite.do">물건팔기</a>
						<a href="qa.do">자유게시판</a>
					</div></li>
			</ul>
		</div>
		<!-- container end -->
	</div>

	<div class="container">
		<div class="write_wrap">
			
			<form name="portfolio" method="post" enctype="multipart/form-data"
				action="portfoliowrite.do" onsubmit="return check()">
				<!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
				<table class="bord_table">
					<tbody>
						<tr>
							<th>작성자</th>
							<td><input name="nickname" value="${nickname}" readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<th>종류</th>
							<td><select name="category" id="category">
									<option value="">판매 상품의 종류를 선택하세요!</option>
									<option value="인테리어">인테리어</option>
									<option value="가전제품">가전제품</option>
									<option value="생활용품">생활용품</option>
									<option value="기타">기타</option>

							</select></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id="summernote"
									class="summernote"></textarea></td>
						</tr>
						<tr>
							<th>첨부</th>
							<td><input type="file" name="imgurl" id="isFile"></td>
							<!-- 524페이지 참조 -->
						</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
					<input type="button" value="목록" class="btn_list"
						onClick="location.href='portfolio.do';">
				</div>
			</form>
		</div>

	</div>
	<!-- end contents -->
	<script>
		function check() {

			if (portfolio.title.value == "") {
				alert("제목을 입력하세요!");
				portfolio.title.focus();
				return false;
			}
			if (portfolio.content.value == "") {
				alert("내용을 입력하세요!");
				portfolio.content.focus();
				return false;
			}
			if(portfolio.category.value ==""){
				alert("종류를 선택하세요!");
				portfolio.category.focus();
				return false;
			}

			var imgFile = portfolio.imgurl.value;
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
			var maxSize = 20 * 1024 * 1024;
			var fileSize;

			if (portfolio.imgurl.value == "") {
				alert("판매 사진 첨부는 필수 입니다!");
				portfolio.imgurl.focus();
				return false;
			}

			if (imgFile != "" && imgFile != null) {
				fileSize = document.getElementById("isFile").files[0].size;

				if (!imgFile.match(fileForm)) {
					alert("이미지 파일만 업로드 가능합니다.");
					return false;
				} else if (fileSize > maxSize) {
					alert("파일 사이즈는 20MB까지 가능합니다.");
					return false;
				}
			}
			return true;
		}
	</script>
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
		});
		//summernote jquery

		$(document)
				.ready(
						function() {
							$('#summernote')
									.summernote(
											{
												height : 300,
												fontNames : [ '맑은고딕', 'Arial',
														'Arial Black',
														'Comic Sans MS',
														'Courier New', ],
												fontNamesIgnoreCheck : [ '맑은고딕' ],
												focus : true,

												callbacks : {
													onImageUpload : function(
															files, editor,
															welEditable) {
														for (var i = files.length - 1; i >= 0; i--) {
															sendFile(files[i],
																	this);  
														}
													}
												}

											});

						})
		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : 'profileImage.do',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(img_name) {
					alert(img_name);
					$(el).summernote('editor.insertImage', img_name);
				}
			});
		} // sendfile
	</script>
	<script src="js/summernote.min.js"></script>
	<%@ include file="../footer2.jsp"%>