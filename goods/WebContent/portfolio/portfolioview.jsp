<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ include file="../header2.jsp"%>

<script type="text/javascript">

function getCommentList(){
    var output = ""; //문자열로 태그를 만들어서 댓글 위치에 넘겨주려고 선언
    var logId = '${sessionScope.userId}'; //Expression Language Tag el태그 내장 객체중  sessionScope를 사용해서 userId값 가져오기
    var bno = $(".hdBno").val(); // detail 불러올때 Bno를 히든속성으로 숨겨놈
    var distinction = 1; //게시판 구별용
    var cdData ={ //배열 형태로 cddata 선언
        bno:bno
        ,distinction:distinction
    }

    $.ajax({ //Asynchronous Javascript And Xml
      type : "get" //get 보안 취약성 , 용량제한 있지만 빠르다 post보다
      ,url : "comment.do"
      ,data : cdData
      ,dataType : "json" /*응답결과데이터 형식 : JavaScript Object Notation 데이터 전송할 때 많이 사용되는 경량의 DATA교환 형식  */
       ,contentType:"application/json:charset=utf-8"
      ,success : function(result){
        for(var i in result){ /* js for문 */
          output += "<ul>";
          output += "<li class='reply'>";
          output += "<span>";
          output += "<img class='cmt-icon thumb_profile' alt='' src='images/thumb1.png'>";
          output += "</span>";
          output += "<span>";
          output += "<span"+" class='cmtWriter'>"+result[i].writer+"</span>";
          output += "<span"+" class='cmtDate'>"+result[i].wtdate+"</span>";
          output += "<span"+" class='cmtContent'>"+result[i].content+"</span>";
          if(result[i].writer == logId){
            output += "<button class='btn2' style='float: right;' onclick='deleteReply()'>삭제</button>"
//             output += "<button class='btn2' style='float: right;'>수정</button>";
          }
          output += "</span>";
          output += "</li>";
          output += "</ul>";
        }
        $(".cmtList-box").html(output);
      }
    });
  } //getCommentList end

 function commentWrite(){
   var bno = $(".hdBno").val();
   
  var cmtContent = $(".cmt-area").val();
  
  var writer = '${sessionScope.nickname}'; //el tag session영역의 객체를 참조 할 때
  
  var distinction = 1;//임시

  if(cmtContent == ""){ //유효성 검사
     alert("댓글 내용을 입력하세요");
     return false;
  }
  if(writer== ""){
     alert("댓글을 작성 하시려면 로그인 해주세요");
     return false;

  }

  var cdData ={
     bno:bno
     ,writer:writer
     ,content:cmtContent
     ,distinction:distinction//임시
  }
  $.ajax({
     type : "post"
     ,url : "comment.do"
     ,data : cdData
     ,success : function(result){
        if(result == 1){
           $(".cmt-area").val("");
           getCommentList(); //작성하고 리스트 뿌리기
        }else{
           alert("댓글 작성 실패");
        }
     }
  });
 }
</script>
<body>

	<!-- 
 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->



	<!-- sub contents -->


	<div class="container">
		<div class="board_view">

			<h2>${pview.title }</h2>
			<p class="info">
				<span class="user">${pview.nickname}</span>
				<span> ${pview.category }</span>
				<!-- <i class="fa fa-eye"></i> --> 
			</p>
			<div class="board_body">
					
						<div class="text_wrap">
							
							<span class="info"> <span class="blue_text"></span> <i class="bar"></i>
								
								</span>
						<div class="img_wrap">
								<img
									src="${pageContext.request.contextPath}/upload/${pview.imgurl}"
									alt="">
							</div>
							<span class="text"> ${pview.content} </span>
							
							 <input type="hidden" value="${pview.bno }" class="hdBno">
							 
						</div>
					
			</div>
			<!-- 댓글기능  -->
<div class="cmt-container">
    <p class="cmtCount">Comments ${detail.commentcount}<p>
    <div class="cmt-box">
      <textarea class="cmt-area" rows="4" cols="" placeholder="댓글을 입력하세요"></textarea>
    </div>
    <div class="cmt-buttons">
      <button type="button"  id="btnCmt" class="info cmt-insert" onclick="commentWrite();">댓 글 등 록</button>
<!--       <input type="button" value="댓글등록" class="btn_list" onClick=""> -->
    </div>
     <div class="cmtList-box">
      <ul id="addcmt">
     <%--  <c:forEach var="clist" items="${cview}">
        <li class="reply">
          <span>
        	<span class="cmtWriter">${cview.writer }</span>
            <span class="cmtDate">${cview.wtdate }</span>
            <span class="cmtContent">${cview.content}</span> 
          </span>
        </li>
      </c:forEach> --%>
      </ul>
     </div>
  </div>
			
			
			
			
			<div class="prev_next">
				<a href="" class="btn_prev"><i class="fa fa-angle-left"></i> <span
					class="prev_wrap"> <strong>이전글</strong><span>이전글제목표시</span>
				</span> </a>
				<div class="btn_3wrap">
					<a href="portfolio.do">목록</a>
					
					<a href="portfolio_modify.html">수정</a>
					<a href="protfolioDelete.do"	onClick="return confirm('삭제하시겠어요?')">삭제</a>
					
				</div>
				<a href="" class="btn_next"> <span class="next_wrap"> <strong>다음글</strong><span>다음글제목표시</span>
				</span> <i class="fa fa-angle-right"></i></a>
			</div>
		</div>
	</div>
	<!-- end contents -->
	
	  <!-- comment -->
	  
 
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
	</script>


	<%@ include file="../footer2.jsp"%>
</body>
</html>









