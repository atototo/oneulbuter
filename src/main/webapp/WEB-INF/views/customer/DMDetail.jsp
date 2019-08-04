<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<style type="text/css">

@font-face { font-family: 'NanumGothic'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype'); }
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
 

#calorieupdate{
font-family: NanumBrush;
font-size: 20px;
}
a{
font-family: NanumBrush;
}
.section-title {
font-family: NanumBrush;

}
.contents {
font-family: NanumPen;
}
.text-danger {
font-family: NanumPen;
}

</style>

<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>
  <section class="site-section bg-light" id="contact-section" style="border-radius: 15%;" >
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-12 text-center bg-light" style="border-radius: 15%;">
            <h3 class="section-sub-title">Tips</h3>
            <!-- 제목 -->
            <h1 class="section-title mb-5">${dmvo.title }</h1>
          </div>
        </div>

        <div class="row bg-light" style="border-radius:15%;">
     
          <div class="col-md-7 mb-5">
            
            <div  class="p-5 "><!--  이미지-->
               <img src="${dmvo.detail_img }" alt="Image" class="img-fluid"><p><hr>
            <!-- 본문1 --> 
            <h5 class="contents font-weight-bold"  style="line-height:1.5em">${dmvo.contents1 }</h5> 
                         </div>
            
          </div>
			<div class="col-lg-5 ml-auto">
            <c:if test="${ sessionScope.loginUser != null}" > 
			 <div class="container" style="margin-left: 65%; padding-bottom: 20px;">
			<input type="button" id="calorieupdate" value="다이어트 식단 수정" class="btn btn-primary btn-md text-white"
			onclick="location.href='/admin/admin_dmupform.do?dmseq=${dmvo.dmseq }'" >
	        </div>
	        </c:if>
				<!--강조  -->
				<h4 class="text-danger mb-0 font-weight-bold" style="line-height:1.5em">${dmvo.imp_contents }</h4><p>
					<!--  본문2-->
				 <h5 class="contents font-weight-bold" style="line-height:1.5em">${dmvo.contents2 } </h5>
				

			</div>
		</div>
        </div>
		 
      
 </section>
<%@ include file="/WEB-INF/views/common/Footer.jsp" %>
</html>