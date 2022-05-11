<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header2.jsp"%>

<c:if test="${empty userid}">
	<script>
		location.href="login.do";
	</script>
</c:if>

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
						<a href="gratings.html">질문과답변</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">질문과 답변 글쓰기</h2>
	  <form name="notice" method="post" action="qawrite.do" onsubmit="return check()">
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="first">
						<th>작성자</th>
						<td><input name="nickname" value="${nickname}" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="summernote"></textarea></td>
					</tr>

				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;<input type="button" value="목록" class="btn_list" onClick="location.href='qa.html';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			if(notice.title.value=="") {
				alert("제목을 입력하세요");
				notice.title.focus();
				return false;
			}
			if(notice.content.value=="") {
				alert("내용을 입력하세요");
				notice.content.focus();
				return false;
			}
			return true;
		}
	</script>
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
			
			
		//summernote jquery
			
			$(function(){
				$('#summernote').summernote({
				height:300,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,
				
				callbacks: {
				onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				             sendFile(files[i], this);
				            }
				        }
				}
				
				});
				
				})
				
				function sendFile(file, el) {
					var form_data = new FormData();
				       form_data.append('file', file);
				       $.ajax({
				         data: form_data,
				         type: "POST",
				         url: 'profileImage.do',
				         cache: false,
				         contentType: false,
				         enctype: 'multipart/form-data',
				         processData: false,
				         success: function(img_name) {
				        	 alert(img_name);
				           $(el).summernote('editor.insertImage', img_name);
				         }
				       });
				    }
			
			
		});
	</script>

<%@ include file="../footer2.jsp"%>