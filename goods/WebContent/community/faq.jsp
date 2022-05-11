<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../header2.jsp" %>
  <link href="../css/font-awesome.min.css" rel="stylesheet">
  <link href="../css/common.css" rel="stylesheet">
  <link href="../css/layout.css" rel='stylesheet'>
  <script src="../js/jquery-3.3.1.min.js"></script>
<body id="page-top">

 <section class="content-section bg-primary1 text-white text-center" id="services">
            <div class="container px-4 px-lg-5">
                <div class="content-section-heading">
                    <h3 class="text-secondary mb-0">YOUsed goodS</h3>
                    <h2 class="mb-5" style="color:#000;">특징
                    </h2>
                </div>
                
                
                
                <!-- 예시 -->
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
         <a href="faq_write.html" class="btn_write">글쓰기</a>
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
      });
   </script>
                <!-- 예시 -->
                
                
            </div>
        </section>
</body>

<%@ include file = "../footer2.jsp" %>