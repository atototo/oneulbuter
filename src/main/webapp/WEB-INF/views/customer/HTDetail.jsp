<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<script type="text/javascript">
  $(window).resize(function(){resizeYoutube();});
  $(function(){resizeYoutube();});
  function resizeYoutube(){ $("iframe").each(function(){ if( /^https?:\/\/www.youtube.com\/embed\//g.test($(this).attr("src")) ){ $(this).css("width","100%"); $(this).css("height",Math.ceil( parseInt($(this).css("width")) * 480 / 854 ) + "px");} }); }
</script>
<style type="text/css">
@font-face { font-family: 'NanumGothic'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype'); }
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
 
.btn{
font-family: NanumBrush;
}
a{
font-family: NanumBrush;
}
.section-title {
font-family: NanumBrush;
}
.htinform {
font-family: NanumPen;

}
em {
font-family:NanumPen;

}


 </style>
<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

  <div class="site-section cta-big-image" id="about-section">
      <div class="container" style="padding-top: 50px;">
      <!-- 유투브 영상 -->
     <div class="row" style="padding-left: 15%;">
      ${hovo.hturl }
       </div>     
		</div>  
    </div>
       <section class="Detail-section border-bottom bg-light" id="Detail-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
          <!--  제목 -->
            <h1 class="section-title mb-3">${hovo.htname }</h1>
          </div>
        </div>
        <div class="row align-items-stretch">
          <div class="col-md-3 col-lg-3 mb-3 mb-lg-3" data-aos="fade-up">
            <div class="unit-4 d-flex">
              <div class="unit-4-icon mr-4"><span class="text-primary icon-timer"></span></div>
              <div><!--  소요시간-->
                <h2 class="htinform">${hovo.exertimemin }분 ${hovo.exertimesec }초</h2>
                
              </div>
            </div>
          </div>
          <div class="col-md-3 col-lg-3 mb-3 mb-lg-3" data-aos="fade-up" data-aos-delay="100">
            <div class="unit-4 d-flex">
              <div class="unit-4-icon mr-4"><span class="text-primary icon-fitness_center"></span></div>
              <div><!-- 종류 -->
                <h2 class="htinform">${hovo.kind }</h2>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-lg-3 mb-3 mb-lg-3" data-aos="fade-up" data-aos-delay="200">
            <div class="unit-4 d-flex">
              <div class="unit-4-icon mr-4"><span class="text-primary icon-sort"></span></div>
              <div><!-- 난이도 -->
                <h2 class="htinform">${hovo.htlevel }</h2>
              </div>
            </div>
          </div>


          <div class="col-md-3 col-lg-3 mb-3 mb-lg-3" data-aos="fade-up" data-aos-delay="300">
            <div class="unit-4 d-flex">
              <div class="unit-4-icon mr-4"><span class="text-primary icon-fire"></span></div>
              <div><!-- 소모 칼로리  -->
                <h2 class="htinform">${hovo.burn_cal } kcal</h2>
                
              </div>
            </div>
          </div>
         </div>
         
         <div class="jumbotron">
    <div class="container">
      <blockquote class="mb-5"><!-- 본문 -->
      <h1><em>&ldquo;${hovo.contents }&ldquo;</em></h1>
    </blockquote>
    </div>
</div>
 <c:if test="${ sessionScope.loginUser != null}" > 
			 <div class="container" style="margin-left: 80%; padding-bottom: 5%;">
			 <input type="hidden" value="${calvo.fseq }" name="fseq">
			<input type="button" id="calorieupdate" value="홈트레이닝 수정" class="btn btn-primary btn-md text-white"
			onclick="location.href='/admin/admin_htupform.do?htseq=${hovo.htseq }'" >
	        </div>
	        </c:if>
      </div>
    </section>


<%@ include file="/WEB-INF/views/common/Footer.jsp" %>
</html>