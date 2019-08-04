<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style type="text/css">
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
 
 h2 { font-family: NanumBrush; font-size:20px;}
 h3 { font-family: NanumBrush; }
 h4 { font-family: NanumBrush; }
 p { font-family: NanumBrush; font-size:25px;}
 form { font-family: NanumBrush; font-size:25px;}
 .btn { font-family: NanumBrush; font-size: 30px; }
 .modal { font-family: NanumBrush; font-size:23px;}
 .section-title { font-family: NanumPen; }
a{
font-family: NanumPen; 

}

a:hover { font-weight:bold;color:#FF0000; }

</style>

<script type="text/javascript">
  $(window).resize(function(){resizeYoutube();});
  $(function(){resizeYoutube();});
  function resizeYoutube(){ $("iframe").each(function(){ if( /^https?:\/\/www.youtube.com\/embed\//g.test($(this).attr("src")) ){ $(this).css("width","100%"); $(this).css("height",Math.ceil( parseInt($(this).css("width")) * 480 / 854 ) + "px");} }); }

  
  function delfun(){
	   var str = "";  
	  var str2 = "";
	   if( $("input:checkbox:checked").length==0 ){
		    alert("삭제할 항목을 하나이상 체크해주세요.");
		    return;
		  }
	    $("input:checkbox:checked").each(function (index) {  
	        str += $(this).val() + ",";
	      
	        alert(str);
	     }); 
	  
	   $("#deletefrm").attr("action","/admin/deltip_act.do").submit();
}

  function showht(ht){
	
      location.href="/customer/diettipkind.do?tipkind="+ht ;
  }
  function showdm(dm){
	
      location.href="/customer/diettipkind.do?tipkind="+dm ;
  }
  
</script>

<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>
<section class="site-section" id="DietTip">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h3 class="section-sub-title">Tips</h3>
            <h2 class="section-title mb-3">다이어트 꿀팁</h2>
          </div>
              <div class="container" style="margin-left: 60%;">
              <c:if test="${ sessionScope.loginUser != null}" >  
            <input type="button" id="htregister" value="홈트레이닝 등록" class="btn btn-primary btn-md text-white" 
             style="font-size:20px;"onclick="location.href='/admin/insert_htform.do'" > &nbsp;
            <input type="button" id="dmregister" value="식단 팁 등록" class="btn btn-primary btn-md text-white" 
            style="font-size:20px;" onclick="location.href='/admin/insert_dmform.do'"> &nbsp;
            </c:if>
            <c:if test="${ sessionScope.loginUser != null && fn:length(tiplist) != 0 }" > 
			
			<input type="button" id="caloriedel" value="팁  리스트" class="btn btn-primary btn-md text-white"
			 data-toggle="modal" data-target="#tiplist" data-backdrop="static" style="font-size:20px;"
			 data-tiplist="${tiplist }" 
			 ></c:if>
			 </div>
             <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
                <a id="showhtbtn"  class="navbar-brand text-danger"  style="font-size: 30px;" href="#" onclick="showht('ht')">홈트레이닝</a>
                <a class="navbar-brand text-danger" href="#" style="font-size: 30px;" onclick="showdm('dm')">식단</a>
                <a class="navbar-brand text-danger" style="font-size: 30px;" href="/customer/DietTip.do">전체보기</a>
              </nav>
        </div>
              
    
       <section class="home-training"  class="tips">   
       <!-- div row 특징 ? 영역 안에 col-md6클래스 있는만큼 자동 정렬 되고 있음  -->
       <div class="row">
           <c:forEach items="${tiplist }" var="tipvo">
								
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" id="${tipvo.tipkind }" >
            <div class="h-entry">
            <c:choose>
            <c:when test="${tipvo.tipkind == 'ht' }">
			  <a href="/customer/HTDetail.do?htseq=${tipvo.idx }"><img src="${tipvo.img }" alt="Image" style="height:290px;"  class="img-fluid"></a>
			  <h2 class="font-size-regular"> <!--타이틀    -->
                 <a href="/customer/HTDetail.do?htseq=${tipvo.idx }" style="font-size: 30px;">${tipvo.title }</a></h2>
              <div class="meta mb-4">
                 <span class="mx-2"><!--등록일--></span>
                 <fmt:formatDate value="${tipvo.indate }" /> <span class="mx-2">&bullet;</span>
                  <!-- 상태 -->
                   <a class="text-danger"href="/customer/HTDetail.do?htseq=${tipvo.idx }">${tipvo.state }</a>
               </div>
               <!-- 소개글 -->
                <c:choose>
                 		<c:when test="${fn:length(tipvo.summary) > 25}">
            				<p><c:out value="${fn:substring(tipvo.summary,0,24)}"/>...</p>
           				</c:when>
          					 <c:otherwise>
            					<p><c:out value="${tipvo.summary}"/>...</p>
           					</c:otherwise> 
          				</c:choose>
			     <p><a href="/customer/HTDetail.do?htseq=${tipvo.idx }">Continue Reading...</a></p>
			  </c:when>
			  
			  <c:otherwise>
			    <a href="/customer/DMDetail.do?dmseq=${tipvo.idx }"><img src="${tipvo.img }"  style="height:290px;" alt="Image" class="img-fluid"> 
			  </a>
              <!--타이틀    -->  
              <h2 class="font-size-regular">
              <a href="/customer/DMDetail.do?dmseq=${tipvo.idx }" style="font-size: 30px;">
              ${tipvo.title }</a></h2>
             <div class="meta mb-4">
                 <span class="mx-2"><!--등록일--></span>
                 <fmt:formatDate value="${tipvo.indate }" /> <span class="mx-2">&bullet;</span>
              
              <!-- 상태 -->
               <a class="text-danger" href="/customer/DMDetail.do?dmseq=${tipvo.idx }">${tipvo.state }</a></div>
               <!-- 소개글 -->
                  <c:choose>
                 		<c:when test="${fn:length(tipvo.summary) > 25}">
            				<p><c:out value="${fn:substring(tipvo.summary,0,24)}"/>...</p>
           				</c:when>
          					 <c:otherwise>
            					<p><c:out value="${tipvo.summary}"/>...</p>
           					</c:otherwise> 
          				</c:choose>
              <p><a  href="/customer/DMDetail.do?dmseq=${tipvo.idx }">Continue Reading...</a></p>
			</c:otherwise>
			</c:choose>
            </div> 
          </div>
          </c:forEach> 
          <!--반복문 종료  -->
        
       </div>
       </section>
       
      </div>
    </section>
<%@ include file="/WEB-INF/views/common/Footer.jsp" %>

<div class="modal" id="tiplist">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

           <form name="deletefrm" id="deletefrm"  method="post">
      <!-- ModalHeader -->
      <div class="modal-header">
        <h4 class="modal-title"><span class="text-primary icon-playlist_add_check">&nbsp;다이어트팁 리스트</span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
                   	<input type="hidden" id="tiplist">
       	   <table class="table">
              <thead>  
                <tr>
                    <th>종류</th>
                    <th>상태</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>선택</th>
                  </tr>
                 </thead> 
                   	<tbody>
					  <c:forEach items="${tiplist }" var="tipvo">
					  <c:choose>
					   <c:when test="${tipvo.tipkind == 'dm' }">
						<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'" 
						onclick="location.href='/customer/DMDetail.do?dmseq=${tipvo.idx }'">
						<td >${tipvo.tipkind }</td>
						<td >${tipvo.state }</td>
						<td >${tipvo.title }</td>
						<td >   <fmt:formatDate value="${tipvo.indate }" /> </td>
						<td>삭제 ( <input type="checkbox" id="del" name="delid" value="${tipvo.tipkind }&${tipvo.idx } "> )</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'" 
						onclick="location.href='/customer/HTDetail.do?htseq=${tipvo.idx }'">
						<td >${tipvo.tipkind }</td>
						<td >${tipvo.state }</td>
						<td >${tipvo.title }</td>
						<td >   <fmt:formatDate value="${tipvo.indate }" /> </td>
						<td>삭제 ( <input type="checkbox" id="del" name="delid" value="${tipvo.tipkind }&${tipvo.idx } "> )</td>
						</tr>
						</c:otherwise>
						</c:choose>
						
						<input type="hidden" name="delstate" value="${tipvo.state }">
						</c:forEach> 
							</tbody>
          </table>
       	</div>
        <div class="container" align="right">
        <!-- <button type="button" id="modalsave" class="btn btn-danger" >저장</button> -->
      <button type="button" id="update" class="btn btn-danger" onclick="delfun()" >선택 삭제</button>
         </div>
         
         
         
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </form>
      </div>
      </div>
       </div>
<!-- modal 팝업 정보 ID mymodal 참고 끝 -->



</html>