<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<META http-equiv="Expires" content="-1"> 
 <META http-equiv="Pragma" content="no-cache"> 
 <META http-equiv="Cache-Control" content="No-Cache"> 
<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>
<style type="text/css">
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
 
 h2 { font-family: NanumBrush; }
 h3 { font-family: NanumBrush; }
 h4 { font-family: NanumBrush; }
 p { font-family: NanumBrush; }
 form { font-family: NanumBrush; font-size:25px;}
 .btn { font-family: NanumBrush; font-size: 20px; }
 .modal { font-family: NanumBrush; font-size:23px;}

</style>

<script type="text/javascript">
/*  $(function(){
	$("#save_comment").click(function(){
		var n = $("#nickname").val();
		var con = $("#contents").val();
		/*코멘트 내용 바로 추가되고 화면에 바로 출력 되도록  */
		//alert(n + con);
	//}); 

// });
 $(function(){
	   var cnt = 0;
	   var cnt2 = 0;
	   var cnt3 = 0;
	   var cnt4 = 0;
	   var cnt5 = 0;
	   var recnt = 0;
	   var recnt1 = 0;
	   var recnt2 = 0;
	   var recnt3 = 0;
	   var recnt4 = 0;
	   var recnt5 = 0;
   $('#recipedetail').on('show.bs.modal', function (e) {
    	$("#rname").html($(e.relatedTarget).data('rname'));
    	$("#feature").html($(e.relatedTarget).data('feature'));
    	
    	$("#ingre1").html($(e.relatedTarget).data('ingre1'));
    	$("#amt1").html($(e.relatedTarget).data('amt1'));
    	$("#unit1").html($(e.relatedTarget).data('unit1'));
    	
    	$("#ingre2").html($(e.relatedTarget).data('ingre2'));
    	$("#amt2").html($(e.relatedTarget).data('amt2'));
    	$("#unit2").html($(e.relatedTarget).data('unit2'));
    
    	$("#ingre3").html($(e.relatedTarget).data('ingre3'));
    	$("#amt3").html($(e.relatedTarget).data('amt3'));
    	$("#unit3").html($(e.relatedTarget).data('unit3'));
 
    	$("#ingre4").html($(e.relatedTarget).data('ingre4'));
    	$("#amt4").html($(e.relatedTarget).data('amt4'));
    	$("#unit4").html($(e.relatedTarget).data('unit4'));
 
    	$("#ingre5").html($(e.relatedTarget).data('ingre5'));
    	$("#amt5").html($(e.relatedTarget).data('amt5'));
    	$("#unit5").html($(e.relatedTarget).data('unit5'));

    	$("#ingre6").html($(e.relatedTarget).data('ingre6'));
    	$("#amt6").html($(e.relatedTarget).data('amt6'));
    	$("#unit6").html($(e.relatedTarget).data('unit6'));
 
    	
    	$("#htm1").html($(e.relatedTarget).data('htm1'));
    	$("#htmimg1").val($(e.relatedTarget).data('htm_img1'));
    	if($(e.relatedTarget).data('htm_img1') != ""){
    	 if(cnt == 0){
    		var img = $('<img id="hhtmimg1">'); //Equivalent: $(document.createElement('img'))
    		img.attr('src', $(e.relatedTarget).data('htm_img1'));
    		img.attr('alt', "Image");
    		img.attr('class', "Img-fluid");
    		img.attr('style', "width:100%;");
    		img.appendTo('#htm_img1');
    		$("#hhtmimg1").show();  
    		cnt++;
       	 }else{
       		 $("#hhtmimg1").attr('src',$(e.relatedTarget).data('htm_img1')); 
       		$("#hhtmimg1").show();  
       	 }
       	}else{
    			$("#hhtmimg1").hide();  
    	}   
    	/* $( "#htmimg1" ).attr( 'value', $(e.relatedTarget).data('htm_img1') ); */
    	/* $("#htm_img1").attr('src',$(e.relatedTarget).data('htm_img1')); */
   
    	$("#htm2").html($(e.relatedTarget).data('htm2'));
    	if($(e.relatedTarget).data('htm_img2') != ""){
    		 if(cnt2 == 0){
    		var img2 = $('<img id="hhtmimg2">'); //Equivalent: $(document.createElement('img'))
    		img2.attr('src', $(e.relatedTarget).data('htm_img2'));
    		img2.attr('alt', "Image");
    		img2.attr('class', "Img-fluid");
    		img2.attr('style', "width:100%;");
    		img2.appendTo('#htm_img2');
    		$("#hhtmimg2").show();  
    		cnt2++;
       	 }else{
       		 $("#hhtmimg2").attr('src',$(e.relatedTarget).data('htm_img2')); 
       		$("#hhtmimg2").show();  
       	 }
       	}else{
    			$("#hhtmimg2").hide();  
    	}   
    	$("#htm3").html($(e.relatedTarget).data('htm3'));
    	if($(e.relatedTarget).data('htm_img3') != ""){
    		if(cnt3 == 0){
    		var img3 = $('<img id="hhtmimg3">'); //Equivalent: $(document.createElement('img'))
    		img3.attr('src', $(e.relatedTarget).data('htm_img3'));
    		img3.attr('alt', "Image");
    		img3.attr('class', "Img-fluid");
    		img3.attr('style', "width:100%;");
    		img3.appendTo('#htm_img3');
    		$("#hhtmimg3").show();  
    		cnt3++;
       	 }else{
       		 $("#hhtmimg3").attr('src',$(e.relatedTarget).data('htm_img3')); 
       		$("#hhtmimg3").show();  
       	 }
       	}else{
    			$("#hhtmimg3").hide();  
    	}
    	  
    	$("#htm4").html($(e.relatedTarget).data('htm4'));
    	if($(e.relatedTarget).data('htm_img4') != ""){
    		if(cnt4 == 0){
    		var img4 = $('<img id="hhtmimg4">'); //Equivalent: $(document.createElement('img'))
    		img4.attr('src', $(e.relatedTarget).data('htm_img4'));
    		img4.attr('alt', "Image");
    		img4.attr('class', "Img-fluid");
    		img4.attr('style', "width:100%;");
    		img4.appendTo('#htm_img4');
    		$("#hhtmimg4").show();  
    		cnt4++;
       	 }else{
       		 $("#hhtmimg4").attr('src',$(e.relatedTarget).data('htm_img4')); 
       		$("#hhtmimg4").show();  
       	 }
       	}else{
    			$("#hhtmimg4").hide();  
    	}
    	  
    	$("#htm5").html($(e.relatedTarget).data('htm5'));
    	if($(e.relatedTarget).data('htm_img5') != ""){
    		if(cnt5 == 0){
    		var img5 = $('<img id="hhtmimg5">'); //Equivalent: $(document.createElement('img'))
    		img5.attr('src', $(e.relatedTarget).data('htm_img5'));
    		img5.attr('alt', "Image");
    		img5.attr('class', "Img-fluid");
    		img5.attr('style', "width:100%;");
    		img5.appendTo('#htm_img5');
    		$("#hhtmimg5").show();  
    		cnt5++;
       	 }else{
       		 $("#hhtmimg5").attr('src',$(e.relatedTarget).data('htm_img5')); 
       		$("#hhtmimg5").show();  
       	 }
       	}else{
    			$("#hhtmimg5").hide();  
    	}
    	   
    	});
   
   $('#recipeupdatemodal').on('show.bs.modal', function (e) {
    
	   $("#rerseq").val($(e.relatedTarget).data('rerseq'));
	   $("#refseq").val($(e.relatedTarget).data('refseq'));
	   $("#rername").val($(e.relatedTarget).data('re_rname'));
	   	  
	   
   	$("#re_rname").html($(e.relatedTarget).data('re_rname'));
   	$("#refeature").val($(e.relatedTarget).data('refeature'));
   	
	$("#unitlist").attr('items',$(e.relatedTarget).data('unitlist'));
	$("#reingre1").val($(e.relatedTarget).data('reingre1'));
	$("#reamt1").val($(e.relatedTarget).data('reamt1'));
	$("#reunit1").val($(e.relatedTarget).data('reunit1'));
	
	$("#reingre2").val($(e.relatedTarget).data('reingre2'));
	$("#reamt2").val($(e.relatedTarget).data('reamt2'));
	$("#reunit2").val($(e.relatedTarget).data('reunit2'));

	$("#reingre3").val($(e.relatedTarget).data('reingre3'));
	$("#reamt3").val($(e.relatedTarget).data('reamt3'));
	$("#reunit3").val($(e.relatedTarget).data('reunit3'));

	$("#reingre4").val($(e.relatedTarget).data('reingre4'));
	$("#reamt4").val($(e.relatedTarget).data('reamt4'));
	$("#reunit4").val($(e.relatedTarget).data('reunit4'));

	$("#reingre5").val($(e.relatedTarget).data('reingre5'));
	$("#reamt5").val($(e.relatedTarget).data('reamt5'));
	$("#reunit5").val($(e.relatedTarget).data('reunit5'));

	$("#reingre6").val($(e.relatedTarget).data('reingre6'));
	$("#reamt6").val($(e.relatedTarget).data('reamt6'));
	$("#reunit6").val($(e.relatedTarget).data('reunit6'));
/* 
	if($(e.relatedTarget).data('reimg') == "undefined"){
		$("#flagimg").attr('test',$(e.relatedTaret).data('reimg') );
	}else{
		$("#flagimg").attr('test',$(e.relatedTaret).data('reimg') );
	    $("#reimg").attr('src',$(e.relatedTarget).data('reimg'));
	}
 */
    
	if($(e.relatedTarget).data('reimg') != ""){
   	 if(recnt == 0){
   		var img = $('<img id="rehtmimg">'); //Equivalent: $(document.createElement('img'))
   		img.attr('src', $(e.relatedTarget).data('reimg'));
   		img.attr('alt', "Image");
   		img.attr('class', "Img-fluid");
   		img.attr('style', "width:40%;");
   		img.appendTo('#refimg');
   		$("#rehtmimg").show(); 
   		recnt++;
   	 }else{
   		 $("#rehtmimg").attr('src',$(e.relatedTarget).data('reimg')); 
   		$("#rehtmimg").show();  
   	 }
   	}else{
			$("#rehtmimg").hide();  
	}
 
	$("#rehtm1").html($(e.relatedTarget).data('rehtm1'));

	if($(e.relatedTarget).data('rehtm_img1') != ""){
	   	 if(recnt1 == 0){
	   		var img = $('<img id="rehtmimg1">'); //Equivalent: $(document.createElement('img'))
	   		img.attr('src', $(e.relatedTarget).data('rehtm_img1'));
	   		img.attr('alt', "Image");
	   		img.attr('class', "Img-fluid");
	   		img.attr('style', "width:100%;"); 
	   		img.appendTo('#refimg1');
	   		$("#rehtmimg1").show();  
		   	
	   		recnt1++;
	   	 }else{
	   		 $("#rehtmimg1").attr('src',$(e.relatedTarget).data('rehtm_img1')); 
	   		$("#rehtmimg1").show();  
	   	 }
	   	}else{
   			$("#rehtmimg1").hide();  
   	}
	
	$("#rehtm2").html($(e.relatedTarget).data('rehtm2'));
	
	if($(e.relatedTarget).data('rehtm_img2') != ""){
	   	 if(recnt2 == 0){
	   		var img = $('<img id="rehtmimg2">'); //Equivalent: $(document.createElement('img'))
	   		img.attr('src', $(e.relatedTarget).data('rehtm_img2'));
	   		img.attr('alt', "Image");
	   		img.attr('class', "Img-fluid");
	   		img.attr('style', "width:100%;"); 
	   		img.appendTo('#refimg2');
	   		$("#rehtmimg2").show();  
	   		recnt2++;
	   	 }else{
	   		 $("#rehtmimg2").attr('src',$(e.relatedTarget).data('rehtm_img2')); 
	   		$("#rehtmimg2").show();  
	   	 }
	   	}else{
   			$("#rehtmimg2").hide();  
   	}
	
	$("#rehtm3").html($(e.relatedTarget).data('rehtm3'));
	if($(e.relatedTarget).data('rehtm_img3') != ""){
	   	 if(recnt3 == 0){
	   		var img = $('<img id="rehtmimg3">'); //Equivalent: $(document.createElement('img'))
	   		img.attr('src', $(e.relatedTarget).data('rehtm_img3'));
	   		img.attr('alt', "Image");
	   		img.attr('class', "Img-fluid");
	   		img.attr('style', "width:100%;"); 
	   		img.appendTo('#refimg3');
	   		$("#rehtmimg3").show();  
	   		recnt3++;
	   	 }else{
	   		 $("#rehtmimg3").attr('src',$(e.relatedTarget).data('rehtm_img3')); 
	   		$("#rehtmimg3").show();  
	   	 }
	   	}else{
	   		
   			$("#rehtmimg3").hide();  
   		
   	}
	
	$("#rehtm4").html($(e.relatedTarget).data('rehtm4'));
	if($(e.relatedTarget).data('rehtm_img4') != ""){
	   	 if(recnt4 == 0){
	   		var img = $('<img id="rehtmimg4">'); //Equivalent: $(document.createElement('img'))
	   		img.attr('src', $(e.relatedTarget).data('rehtm_img4'));
	   		img.attr('alt', "Image");
	   		img.attr('class', "Img-fluid");
	   		img.attr('style', "width:100%;"); 
	   		img.appendTo('#refimg4');
	  		$("#rehtmimg4").show();  
	   		recnt4++;
	   	 }else{
	   		 $("#rehtmimg4").attr('src',$(e.relatedTarget).data('rehtm_img4')); 
	   		$("#rehtmimg4").show();  
	   	 }
	   	}else{
	   		
   			$("#rehtmimg4").hide();  
   		
   	}
	
	$("#rehtm5").html($(e.relatedTarget).data('rehtm5'));
	  
	if($(e.relatedTarget).data('rehtm_img5') != ""){
	   	 if(recnt5 == 0){
	   		var img = $('<img id="rehtmimg5">'); //Equivalent: $(document.createElement('img'))
	   		img.attr('src', $(e.relatedTarget).data('rehtm_img5'));
	   		img.attr('alt', "Image");
	   		img.attr('class', "Img-fluid");
	   		img.attr('style', "width:100%;"); 
	   		img.appendTo('#refimg5');
	   		$("#rehtmimg5").show();  
	   		recnt5++;
	   		
	   	 }else{
	   		 $("#rehtmimg5").attr('src',$(e.relatedTarget).data('rehtm_img5')); 
	   		$("#rehtmimg5").show();  
 
	   	 }
	   	}else{
	   			$("#rehtmimg5").hide();  
	   	}
	
    
 });
 
   $('#recipedellist').on('show.bs.modal', function (e) {
	   $("#recipelist").attr('items',$(e.relatedTarget).data('recipelist'));
   });
   
   
    $('#btncmtupdate').click(function(){
	  
    	if(	$("#upchkpwd").val() == $("#uppwd").val()){
    		
	    $("#upcmtfrm").attr("action","/customer/upcomment_act.do").submit();  
    	}else{
    		var fseq = $("#upcofseq").val();
    		alert("비밀번호가 틀렸습니다");
    		$("#upcmtfrm").attr("action","/customer/FoodDetail.do?fseq="+fseq).submit();  
        	
    	}
    	
   }); 

   
   
   
   $('#delcmtmodal').on('show.bs.modal', function (e) {
	 
   	$("#id").val($(e.relatedTarget).data('id'));
   	$("#reid").val($(e.relatedTarget).data('id'));
   	$("#pwd").val($(e.relatedTarget).data('pwd'));
   	$("#cofseq").val($(e.relatedTarget).data('cofseq'));
   	$("#coindex").val($(e.relatedTarget).data('coindex'));
   	
   	});
   
   $('#updatecmtmodal').on('show.bs.modal', function (e) {
	   
   	$("#upid").val($(e.relatedTarget).data('upid'));
   	$("#upchkpwd").val($(e.relatedTarget).data('uppwd'));
   	$("#upcofseq").val($(e.relatedTarget).data('upcofseq'));
   	$("#upcoindex").val($(e.relatedTarget).data('upcoindex'));
   	
   	});
   
   
   
 });
    
	
	(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    // Fetch all the forms we want to apply custom Bootstrap validation styles to
		    var forms = document.getElementsByClassName('needs-validation');
		    // Loop over them and prevent submission
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
	
	  function delfun(){
		   var str = "";  
		   if( $("input:checkbox:checked").length==0 ){
			    alert("삭제할 항목을 하나이상 체크해주세요.");
			    return;
			  }
		    $("input:checkbox:checked").each(function (index) {  
		        str += $(this).val() + ",";   
		     }); 
		   
		   $("#deletefrm").attr("action","/admin/delrecipe_act.do").submit();
	  }
	
</script>
  <form name="frm" method="post" action="/uploadfoodimg.do" enctype="multipart/form-data" class="needs-validation" novalidate>
    <section class="site-section" id="foodDetail">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-md-5 ml-auto mb-5 order-md-2" data-aos="fade">
            <div class="owl-carousel slide-one-item-alt" style="padding-top: 18%;">
             <!-- 이미지 들어가는 곳 -->
              <img src="${calvo.img }" alt="Image" class="img-fluid">
            </div>
                <c:if test="${ sessionScope.loginUser != null}" > 
                <div class="row" style="padding-top: 30px; margin-left: 10%;">
	            
	              <input type="file" name="file1" class="btn btn-primary text-white" style="width: 220px;" required>&nbsp;&nbsp;&nbsp;
	               	<div class="invalid-feedback">Please choose a userpwd.</div>
	               <input type="submit" id="calimgupdate" value="이미지 업로드" class="btn btn-primary text-white" >
	             </div>
                </c:if>
          </div>
          
          <div class="col-md-6 order-md-1" data-aos="fade">
            <div class="row">
              <!-- 식품 이미지, 상세정보 -->
              <div class="col-12 mb-4">
              <!-- 음식 이름 들어가는 곳 -->
                <h2 class="section-title mb-3" >${calvo.fname }</h2>
              </div>
              <div class="col-md-12 mb-md-5 mb-0 col-lg-6">
                <div class="unit-4">
               <div class="jumbotron">
                  <div class="unit-4-icon mr-4 mb-3"><span class="icon-star" style="color: #85D1DD;"></span></div>
                  <div>
                  <!-- 특징  -->
                    <h3 class="font-weight-bold">${calvo.feature }</h3>
                    <!-- 1개 기준 질량 칼로리  -->
                    <p>1개(${calvo.amounts }${calvo.unit })기준 : ${calvo.cal }Kcal</p>
                  </div>
                </div>
                </div>
              </div>
              <div class="col-md-12 mb-md-5 mb-0 col-lg-6">
                <div class="unit-4">
               <div class="jumbotron">
                  <div class="unit-4-icon mr-4 mb-3"><span class=" icon-assignment" style="color: #85D1DD;"></span></div>
                  <div>
                     <h3 class="font-weight-bold">영양 분석</h3>
                    <!-- 탄/단/지 정보 들어가는 곳 -->
                    <p>탄수화물 : ${calvo.carbo } g</p>
                    <p>단백질 : ${calvo.protein } g</p>
                    <p>지방 : ${calvo.fat } g</p>
                  </div>
                </div>
               </div>
              </div>
              <div class="col-md-12 mb-md-5 mb-0 col-lg-6">
                <div class="unit-4 jumbotron">
                  <div class="unit-4-icon mr-4 mb-3"><span class="icon-fitness_center" style="color: #85D1DD;"></span></div>
                  <div>
                  <!-- 운동 정보-->
                    <h3 class="font-weight-bold">칼로리 소모 운동량</h3>
                    <p>걷기 : ${calvo.exer1 } 분</p>
                    <p>달리기 : ${calvo.exer2 }분</p>
                    <p>줄넘기 : ${calvo.exer3 } 분</p>
                  </div>
                </div>
              </div>
              <div class="col-md-12 mb-md-5 mb-0 col-lg-6">
                <div class="unit-4 jumbotron">
               
                  <div class="unit-4-icon mr-4 mb-3"><span class="icon-directions_bike" style="color: #85D1DD;"></span></div>
                  <div>
                    <p>수영 :${calvo.exer4 } 분</p>
                    <p>자전거 : ${calvo.exer5 } 분</p>
                  </div>
                </div>
               
              </div>
           
            </div>
          </div>
          
        </div>
      </div>
        <c:if test="${ sessionScope.loginUser != null}" > 
			 <div class="container" style="margin-left: 70%;">
			 <input type="hidden" value="${calvo.fseq }" name="fseq">
			<input type="button" id="calorieupdate" value="칼로리 수정" class="btn btn-primary btn-md text-white"
			onclick="location.href='/admin/update_calform.do?fseq=${calvo.fseq }'" >
	        </div>
	        </c:if>
    </section>
    </form>
    
   <section class="site-section bg-light" id="comment-recipe-section">
	<div class="container">
		<div class="row">
				<!-- 한 줄 review -->
			<div class="col-md-7 mb-5" id="comment">
 <form id="commentFrm" method="post" action="/customer/insert_comments.do" class="needs-validation" novalidate >  
				<div class="p-5 bg-white">
					<h2 class="h4 text-black mb-5 font-weight-bold">Comments
						<span class="text-primary icon-gratipay"></span></h2>
				<div class="jumbotron">
					<div class="row form-group" >
						<!-- <div class="col-md-12"> -->
						 <input type="hidden" value="${calvo.fseq }" name="fseq">
						 <input type="hidden" value="${calvo.fname }" name="fname">
						 
						<p class="mb-0 font-weight-bold">닉네임</p>
						   <div class="col-md-4">
                              <input type="text" class="form-control" id="nickname" name="nickname" required>
                              	<div class="invalid-feedback">Please choose a nickname</div>
                           </div>
                        <p class="mb-0 font-weight-bold">비밀번호</p>
                            <div class="col-md-4">
                               <input type="password" class="form-control" id="pwd" name="pwd" required>
                               	<div class="invalid-feedback">Please choose a password</div>
  							</div>
  						</div>
  						
  						
  						<div class="row form-group" >
						<p class="mb-0 font-weight-bold">한줄 평</p>
							 <input type="text"  class="form-control" id="contents"name="contents" style="width: 480px;" required>
							 	<div class="invalid-feedback">Please choose a comments</div>
					 </div>
					 </div>
					<div class="row form-group">
						<div class="col-md-12" style="margin-left: 65%;">
							<input type="submit" value="한줄평 등록" id="save_comment"
								class="btn btn-primary text-white" >
						</div>
					</div><hr>

					<div class="row form-group">
						<div class="col-md-12 ">
							<label class="text-black" for="message">Reviews</label>
							
							<!-- c태그로 DB에 의견이 있는 만큼 반복문 돌리는 구간 // 스크롤 기능 추가 -->
							<div class="p-3 mb-3 " style="border-radius:5%; height: auto; background-color:#85D1DD;
    							max-height: 400px; overflow-x: auto;">
    							<c:choose>
				                <c:when test="${fn:length(commentslist) == 0}">
				                   <div class="p-1 mb-3 bg-white" style="background-color: #F0F2F2; border-radius: 5%;">
									   <p class="mb-0 font-weight-bold ">작성자 없음</p>
									   <p class="mb-4">등록된 코멘트가 없습니다</p>
									   
									</div>
								</c:when>
								<c:otherwise>
							   		<c:forEach items="${commentslist }" var="commentVO">						
							   			<div class="p-1 mb-3" style="background-color: #F0F2F2; border-radius: 5%;">
										<p class="mb-0 font-weight-bold "><span class="text-danger icon-person "></span> ${commentVO.nickname } </p><hr>
										<b><span class="text-danger icon-quote-left "></span></b>
										<span class="mb-4">${commentVO.contents }</span>
										<b><span class="text-danger icon-quote-right "></span></b>
										<div style="margin-left:80%;">
										<span class="text-danger icon-edit " style="cursor:pointer; font-size: 20px;"
										 data-toggle="modal" data-target="#updatecmtmodal" data-backdrop="static" 
										  data-upid="${commentVO.nickname  }" data-uppwd="${commentVO.pwd  }" 
										  data-upcoindex="${commentVO.coindex }" data-upcofseq="${commentVO.fseq }"
										 ></span>&nbsp;
										<span class="text-danger icon-trash-o" style="cursor:pointer; font-size: 20px;" 
										 data-toggle="modal" data-target="#delcmtmodal" data-backdrop="static" 
										  data-id="${commentVO.nickname  }" data-pwd="${commentVO.pwd  }"
										  data-coindex="${commentVO.coindex }" data-cofseq="${commentVO.fseq }"
										></span>
										</div>
										</div>
									</c:forEach>
								</c:otherwise>
								</c:choose>
         				
							</div>
						</div>
					</div>
			 <c:if test="${ sessionScope.loginUser != null}" > 
              <c:if test="${fn:length(commentslist) != 0}">
			 <div class="container" style="margin-left: 70%;">
			 <input type="hidden" value="${calvo.fseq }" name="fseq">
			<input type="button" id="commentlist" value="코멘트 리스트" class="btn btn-primary btn-md text-white"
			onclick="location.href='/admin/comment_listform.do?fseq=${calvo.fseq }'" >
	        </div>
	         </c:if>
	        </c:if>
				</div>
			</form>
			</div>
			<!--레시피  -->
			<div class="col-md-5" id="recipe">
				<div class="p-4 mb-3 bg-white" style="height:94%">
					<div class="slide-one-item home-slider owl-carousel">
								
			<!-- <form method="post" action="/uploadrecipe.do" enctype="multipart/form-data">
			 -->
				<c:choose>
				 <c:when test="${fn:length(recipelist) == 0}">
					<div>
					  <div class="testimonial">
							<blockquote class="mb-5">
								<p class="mb-0 font-weight-bold">꿀맛 레시피
								  <span class="text-primary icon-gratipay"></span>
								</p>
							</blockquote>
									<div>
										<img src="/include/uploadimg/noimage.jpg" alt="Image" 
										name="egg_recipe1" class="img-fluid"  >
									</div>
									<!-- 레시피 이름 : rname  -->
									<h3><p>Comming Soon</p></h3>
							      <c:if test="${ sessionScope.loginUser != null}" > 
					                 <input type="hidden" value="${calvo.fseq }" name="fseq">
					                 
					                 <input type="button" id="recipeinsert" value="레시피 업로드" class="btn btn-primary btn-md text-white"
					                    data-toggle="modal" data-target="#recipe_add" data-backdrop="static" >
	               				 </c:if>
               				 </div>
						</div>
					</c:when>
					
				  <c:otherwise>	
						<c:forEach items="${recipelist }" var="recipeVO">			
						<div>
							<div class="testimonial">

								<blockquote class="mb-5">
									<p class="mb-0 font-weight-bold">꿀맛 레시피
									<span class="text-primary icon-gratipay"></span>
									</p>
								</blockquote>
									<div>
										<img src="${recipeVO.img }" alt="Image" style="cursor:pointer;"
										name="egg_recipe1" class="img-fluid" data-toggle="modal" data-target="#recipedetail"
									    data-rname="${recipeVO.rname }" data-feature="${recipeVO.feature }"
									    data-ingre1="${recipeVO.ingre1 }" data-amt1="${recipeVO.amt1 }" data-unit1="${recipeVO.unit1 }" 
									    data-ingre2="${recipeVO.ingre2 }" data-amt2="${recipeVO.amt2 }" data-unit2="${recipeVO.unit2 }" 
									    data-ingre3="${recipeVO.ingre3 }" data-amt3="${recipeVO.amt3 }" data-unit3="${recipeVO.unit3 }" 
									    data-ingre4="${recipeVO.ingre4 }" data-amt4="${recipeVO.amt4 }" data-unit4="${recipeVO.unit4 }" 
									    data-ingre5="${recipeVO.ingre5 }" data-amt5="${recipeVO.amt5 }" data-unit5="${recipeVO.unit5 }" 
									    data-ingre6="${recipeVO.ingre6 }" data-amt6="${recipeVO.amt6 }" data-unit6="${recipeVO.unit6 }" 
									    data-htm1="${recipeVO.htm1 }" data-htm_img1="${recipeVO.htm_img1 }" data-rseq="${recipeVO.rseq }"
									    data-htm2="${recipeVO.htm2 }" data-htm_img2="${recipeVO.htm_img2 }"
									    data-htm3="${recipeVO.htm3 }" data-htm_img3="${recipeVO.htm_img3 }"
									    data-htm4="${recipeVO.htm4 }" data-htm_img4="${recipeVO.htm_img4 }"
									    data-htm5="${recipeVO.htm5 }" data-htm_img5="${recipeVO.htm_img5 }"
									    >
								
									</div>
									<!-- 레시피 이름 : rname  -->
									<h2><p>${recipeVO.rname }</p></h2>
									<!-- 레시피 특징 : feature  -->
									<h3><p>${recipeVO.feature }</p></h3>
								
							</div>
							  <c:if test="${ sessionScope.loginUser != null}" > 
						          <div style="padding-left: 18%;">
						              <input type="hidden" value="${calvo.fseq }" name="fseq">
						              <input type="button" id="recipeinsert" value="레시피 업로드" class="btn btn-primary btn-md text-white"
						              data-toggle="modal" data-target="#recipe_add" data-backdrop="static" >
						              
						              <input type="button" id="recipeupbtn" value="레시피 수정" class="btn btn-primary btn-md text-white"
						                data-toggle="modal" data-target="#recipeupdatemodal" data-backdrop="static" 
						                data-re_rname="${recipeVO.rname }" data-refeature="${recipeVO.feature }"
									    data-reingre1="${recipeVO.ingre1 }" data-reamt1="${recipeVO.amt1 }" data-reunit1="${recipeVO.unit1 }" 
									    data-reingre2="${recipeVO.ingre2 }" data-reamt2="${recipeVO.amt2 }" data-reunit2="${recipeVO.unit2 }" 
									    data-reingre3="${recipeVO.ingre3 }" data-reamt3="${recipeVO.amt3 }" data-reunit3="${recipeVO.unit3 }" 
									    data-reingre4="${recipeVO.ingre4 }" data-reamt4="${recipeVO.amt4 }" data-reunit4="${recipeVO.unit4 }" 
									    data-reingre5="${recipeVO.ingre5 }" data-reamt5="${recipeVO.amt5 }" data-reunit5="${recipeVO.unit5 }" 
									    data-reingre6="${recipeVO.ingre6 }" data-reamt6="${recipeVO.amt6 }" data-reunit6="${recipeVO.unit6 }" 
									    data-rehtm1="${recipeVO.htm1 }" data-rehtm_img1="${recipeVO.htm_img1 }"  data-rerseq="${recipeVO.rseq }"
									    data-rehtm2="${recipeVO.htm2 }" data-rehtm_img2="${recipeVO.htm_img2 }"  data-refseq="${recipeVO.fseq }"
									    data-rehtm3="${recipeVO.htm3 }" data-rehtm_img3="${recipeVO.htm_img3 }"
									    data-rehtm4="${recipeVO.htm4 }" data-rehtm_img4="${recipeVO.htm_img4 }"
									    data-rehtm5="${recipeVO.htm5 }" data-rehtm_img5="${recipeVO.htm_img5 }"
									    data-unitlist="${unitlist }" data-reimg="${recipeVO.img }"
						              >
						              </div>
                			</c:if>
						</div>
             
              
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
						 <c:if test="${ sessionScope.loginUser != null && fn:length(recipelist) != 0 }" > 
			 <div class="container" style="margin-left: 60%; padding-top: 20%;">
			 <input type="hidden" value="${calvo.fseq }" name="fseq">
			<input type="button" id="recipedel" value="레시피  리스트" class="btn btn-primary btn-md text-white"
			 data-toggle="modal" data-target="#recipedellist" data-backdrop="static" 
			 data-recipelist="${recipelist }" 
			 ></div></c:if>
				</div>
			</div>
	       
		</div>
	</div>
</section>
 
        

 <!-- modal 팝업 정보 ID mymodal 참고 시작 -->

<div class="modal" id="recipedetail">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- ModalHeader -->
      <div class="modal-header">
        <h4 class="modal-title mb-3"  id="rname"><span class="text-primary icon-restaurant_menu"></span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <h5><label class="text-primary">특징</label></h5>
          <span id="feature"></span>
       	   <div class ="ingredients">
       	   <table class="table">
                <tr>
                    <th><p id="ingre1"></p></th>
                    <td><span id="amt1"></span><span id="unit1"></span></td>
                    <th><p id="ingre2"></p></th>
                    <td><span id="amt2"></span><span id="unit2"></span></td>
                    </tr>
                <tr>
                     <th><p id="ingre3"></p></th>
                    <td><span id="amt3"></span><span id="unit3"></span></td>
                    <th><p id="ingre4"></p></th>
                    <td><span id="amt4"></span><span id="unit4"></span></td>
                    </tr>
                <tr>
                     <th><p id="ingre5"></p></th>
                    <td><span id="amt5"></span><span id="unit5"></span></td>
                    <th><p id="ingre6"></p></th>
                    <td><span id="amt6"></span><span id="unit6"></span></td>
                    </tr>
                
          </table>
        </div><hr>
        <div class="jumbotron">
        	<div class="recipe">
        	<ol>
        	<li><span id="htm1"></span>
        	 <div id="htm_img1"></div> 		
        	<li><span id="htm2"></span>
			<div id="htm_img2"></div>
        	<li><span id="htm3"></span>
				<div id="htm_img3"></div>
        	<li><span id="htm4"></span>
		    <div id="htm_img4"></div>
        	<li><span id="htm5"></span>
			<div id="htm_img5"></div>
           </ol>
        	</div>
        </div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- modal 팝업 정보 ID mymodal 참고 끝 -->

<!-- 꿀맛 레시피  레시피  추가 모달 modal 시작 -->
<form name="insertfrm" id="insertfrm" action="/uploadrecipe.do" method="post" class="needs-validation" novalidate enctype="multipart/form-data">
<div class="modal" id="recipe_add">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
     
     <span class="text-primary icon-upload"></span>&nbsp;
     <input type="text" id="rname"class="form-control" name="rname" placeholder="이름입력" required>
     	<div class="invalid-feedback">Please choose a recipe name</div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <h5><label class="text-primary">특징</label></h5>
         <input type="text" id="recipe1_feature" name="feature" class="form-control" placeholder="특징" required>
         	<div class="invalid-feedback">Please choose a feature</div>
         
          <input type="hidden" value="${calvo.fseq }" name="fseq">
			<label class="text-primary">대표이미지</label>
			<input type="file" name="file1" required>
			<div class="invalid-feedback">Please choose a image</div>
       	   <div class ="ingredients">
       	   <h4>재료</h4>
       	   <table class="table">
                <tr>
                    <th> <input type="text" id="ingre1" name="ingre1" class="form-control" placeholder="재료" required>
                    <div class="invalid-feedback">Please choose a ingredient</div> </th>
                    <td><div class="input-group">
                           <input type="text"  id="amt1" name="amt1" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="unit1" name="unit1">
								<option value="">단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
							</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="ingre2" name="ingre2" class="form-control" placeholder="재료" required>
                    <div class="invalid-feedback">Please choose a ingredient</div></th>
                    <td><div class="input-group">
                           <input type="text" id="amt2" name="amt2" class="form-control" placeholder="질량(개수)">
  							<span class="input-group-addon"  >
  							<select class="form-control" id="unit2" name="unit2">
							<option value="">단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span>
							</div>
							</td>
                    </tr>
                <tr>
                    <th><input type="text" id="ingre3" name="ingre3" class="form-control" placeholder="재료" required>
                    <div class="invalid-feedback">Please choose a ingredient</div></th>
                   <td><div class="input-group">
                           <input type="text" id="amt3" name="amt3" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" >
  							<select class="form-control" id="unit3" name="unit3">
									<option value="">단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="ingre4" name="ingre4" class="form-control" placeholder="재료" ></th>
                    <td><div class="input-group">
                           <input type="text" id="amt4" name="amt4" class="form-control" placeholder="질량(개수)">
  							<span class="input-group-addon" >
  							<select class="form-control" id="unit4" name="unit4">
								<option value="">단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span>
							</div>
							</td>
                    </tr>
                <tr>
                    <th><input type="text" id="ingre5" name="ingre5" class="form-control" placeholder="재료"></th>
                    <td><div class="input-group">
                           <input type="text" id="amt5" name="amt5" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" >
  							<select class="form-control" id="unit5" name="unit5">
								<option value="" >단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="ingre6" name="ingre6" class="form-control" placeholder="재료" ></th>
                    <td><div class="input-group">
                           <input type="text" id="amt6" name="amt6" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" >
  							<select class="form-control" id="unit6" name="unit6">
					      	<option value="">단위</option>
							     <c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span>
							</div>
							</td>
                   
                    </tr>
          </table>
        </div><hr>
                
        <div class="htm">
         <div class ="ingredients">
        <h5><label class="text-primary">레시피</label></h5>
       	  <table class="table">
      	<tr><th>1</th>
        	<td>
			<textarea class="form-control" id="htm1" name="htm1" rows="5" required></textarea>
			<div class="invalid-feedback">Please choose a introduction</div>
			<input type="file" id="recipe1_img1" name="file2">
  			</td>
        	<th>2</th>
			<td>
			<textarea class="form-control rounded-0" id="htm2" name="htm2" rows="5"></textarea>
			<input type="file" id="recipe1_img2" name="file3">
  			</td>
  			</tr>
  			<tr><th>3</th>
        	<td>
			<textarea class="form-control rounded-0" id="htm3" name="htm3" rows="5"></textarea>
		    <input type="file" id="recipe1_img3" name="file4">
  			</td>
  			
        	<th>4</th>
        	<td>
			<textarea class="form-control rounded-0" id="htm4" name="htm4" rows="5"></textarea>
			<input type="file" id="recipe1_img4" name="file5">
			</td>
			</tr>
        	<tr><th>5</th>
        	<td colspan="3">
			<textarea class="form-control rounded-0" id="htm5" name="htm5" rows="5"></textarea>
            <input type="file" id="recipe1_img5" name="file6">
			</td>
			</tr>	        	
        	</table> 
        	        	 </div>
        	</div> 
       
       </div>
       
        <div class="container" align="right">
        <button type="submit" id="save" class="btn btn-danger" >저장</button>
        </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
    </form>
    
    
    <!-- 꿀맛 레시피 수정 modal 시작 -->
<form name="updatefrm" id="updatefrm" action="/updaterecipe.do" method="post" class="needs-validation" novalidate enctype="multipart/form-data">
<div class="modal" id="recipeupdatemodal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- ModalHeader -->
      <div class="modal-header">
       <input type="hidden" id="refseq" name="fseq">
       <input type="hidden" id="rerseq" name="rseq">
       <input type="hidden" id="rername" name="rname">
        <h4 class="modal-title" id="re_rname" ><span class="text-primary icon-upload"></span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <div class="featurename" style="background-color: #BED9DE;">
          <label class="text-primary">특징</label>
       </div>
       <div class="clearfix"></div>
         <input type="text"id="refeature" name="feature" class="form-control" ><br>
	             <label class="text-primary">대표이미지</label>
			     <div id ="refimg"></div>
			  <input type="file" name="file1">
       	   <div class ="ingredients">
       	    <div class="featurename" style="background-color: #BED9DE;">
       	   <h4>재료</h4>
       	   </div>
          <div class="clearfix"></div>
       	   <table class="table">
              <tr>
                    <th> <input type="text" id="reingre1" name="ingre1" class="form-control" > </th>
                    <td><div class="input-group"><input type="text" id="reamt1" name="amt1" class="form-control" >
                    <span class="input-group-addon" id="basic-addon2">
  							<input type="hidden" id="unitlist">
  							<select class="form-control" id="reunit1" name="unit1">
  							<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                    <th><input type="text"id="reingre2" name="ingre2" class="form-control"  ></th>
                    <td><div class="input-group"><input type="text" id="reamt2" name="amt2" class="form-control" >
                    <span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="reunit2" name="unit2">
  							<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                    </tr>
                <tr>
                    <th><input type="text" id="reingre3" name="ingre3"class="form-control" ></th>
                    <td><div class="input-group"><input type="text" id="reamt3" name="amt3" class="form-control" >
                    <span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="reunit3" name="unit3">
  							<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                    <th><input type="text" id="reingre4" name="ingre4"class="form-control" ></th>
                    <td><div class="input-group"><input type="text" id="reamt4" name="amt4" class="form-control" >
                    <span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="reunit4" name="unit4">
  							<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                    </tr>
                <tr>
                    <th><input type="text" id="reingre5" name="ingre5"class="form-control"></th>
                    <td ><div class="input-group"><input type="text"id="reamt5" name="amt5" class="form-control">
                    <span class="input-group-addon" id="basic-addon2">
  						<select class="form-control" id="reunit5" name="unit5">
  							<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                    <th><input type="text" id="reingre6" name="ingre6"class="form-control" ></th>
                    <td ><div class="input-group"><input type="text" id="reamt6" name="amt6" class="form-control" >
                    <span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="reunit6" name="unit6">
  						<option value="">단위</option>
  							<c:forEach items="${unitlist }" var="unitvo">
									<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
								 </c:forEach>
								</select>
  							</span></div></td>
                   
                    </tr>
                
          </table>
        </div><hr>
           <div class="featurename" style="background-color: #BED9DE;">
          <h4><label class="text-primary">레시피</label></h4>	
          </div>
        <div class="jumbotron">
       <div class ="ingredients">
           <table class="table">
            <tr><th>1</th><td>
			<textarea class="form-control rounded-0" id="rehtm1" 
			name="htm1" rows="5"></textarea>
			  <div id ="refimg1"></div><br>
			<input type="file" id="file2" name="file2">
  			</td>
        	<th>2</th>
			<td>
			<textarea class="form-control rounded-0" id="rehtm2" name="htm2" rows="5"></textarea>
			 <div id ="refimg2"></div><br>
			<input type="file" id="file3" name="file3">
  		    </td>
  			</tr>
        	<tr><th>3</th><td>
			<textarea class="form-control rounded-0" id="rehtm3" name="htm3" rows="5"></textarea>
			<div id ="refimg3"></div><br>
			<input type="file" id="file4" name="file4">
  		    </td>
        	<th>4</th><td>
			<textarea class="form-control rounded-0" id="rehtm4" name="htm4" rows="5"></textarea>
			<div id ="refimg4"></div><br>
			<input type="file" id="file5" name="file5">
			</td>
			</tr>
        	<tr><th>5</th><td colspan="3">
			<textarea class="form-control rounded-0" id="rehtm5" name="htm5" rows="5"></textarea>
			<div id ="refimg5"></div><br>
			<input type="file" id="file6" name="file6" >
  		    </td>
			</tr>	        	
        	</table>
        	</div>
        <div class="container" align="right">
        <!-- <button type="button" id="modalsave" class="btn btn-danger" >저장</button> -->
      <button type="submit" id="updatebtn" class="btn btn-danger"  >수정</button>
         </div>
         </div>
         </div>
         
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
       </div>
      
    </div>
  </div>

</form>
<!-- modal 팝업 정보 ID mymodal 참고 끝 -->
    
    <!--  /////////////////////////  -->
  <!-- modal 팝업 정보 ID mymodal 참고 시작 -->

<div class="modal" id="recipedellist">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

           <form name="deletefrm" id="deletefrm"  method="post">
      <!-- ModalHeader -->
      <div class="modal-header">
        <h4 class="modal-title"><span class="text-primary icon-delete_sweep"></span>&nbsp;레시피 리스트</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
                   	<input type="hidden" id="reipcelist">
       	   <table class="table">
              <thead>  
                <tr>
                    <th>IDX</th>
                    <th>레시피명</th>
                    <th>특징</th>
                    <th>선택</th>
                  </tr>
                 </thead> 
                   	<tbody>
					 <c:forEach items="${recipelist }" var="revo">
						<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'" >
						<td >${revo.rseq }</td>
						<td >${revo.rname }</td>
						<td >${revo.feature }</td>
						<td>삭제 ( <input type="checkbox" id="del" name="delid" value="${revo.rseq } "> )</td>
						</tr>
						<input type="hidden" name="fseq" value="${revo.fseq }">
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
       
       
       <form name="insertfrm" id="insertfrm" action="sign_act.do" method="post" class="needs-validation" novalidate >
<div class="modal" id="memregister">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
          관리자 등록<span class="text-primary icon-restaurant_menu"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <div >
      <label class="text-primary" for="id">ID</label>
      <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해주세요" required>
       <div class="invalid-feedback">
          Please choose a userid.
      </div>
      </div>
        <div>
      <label class="text-primary" for="pwd">비밀번호</label>
      <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요" required>
       <div class="invalid-feedback">
          Please choose a userpwd.
      </div>
      </div>
      <div>
      <label class="text-primary" for="name">이름</label>
      <input type="text" id="name" name="name" class="form-control" placeholder="아름을 입력해주세요" required>
       <div class="invalid-feedback">
          Please choose a username.
      </div>
      </div>
      <div>
      <label class="text-primary" for="phone">핸드폰번호</label>
      <input type="tel" id="phone" name="phone" class="form-control" placeholder="핸드폰번호를 입력해주세요" required>
      <div class="invalid-feedback">
          Please choose a userphone.
      </div>
      </div>
      <div>
      <label class="text-primary" for="email">이메일</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" required>
       <div class="invalid-feedback">
          Please choose a useremail.
        </div>     
        </div>
        </div>
        <div class="container" align="right">
        <button type="submit" id="membersave" class="btn btn-danger" >등록</button>
        </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
    </form>
  <!-- 코멘트 삭제  -->
  <form name="delcmtfrm" id="delcmtfrm" action="/customer/delcomment_act.do" method="post" class="needs-validation" novalidate>
  <div class="modal" id="delcmtmodal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
          코멘트를 삭제하시겠습니까?<span class="text-primary icon-restaurant_menu"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

      
      <label class="text-primary">ID</label>
      <input type="hidden" id="id" name="nicknames">
      <input type="text" id="reid" name="nickname" class="form-control" readonly="readonly">
     <div>
      <label class="text-primary" for="up_pwd">비밀번호</label>
      <input type="password" id="chkpwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요" required>
       <small class="invalid-feedback">작성시 등록 한 비밀번호를 입력해주세요</small>
      <input type="hidden" id="cofseq" name="fseq"> 
      </div>
      
        </div>
        <div class="container" align="right">
        <button type="submit" id="btndelcmtdelete" class="btn btn-danger" >삭제</button>
        </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
</form>
      
 <form name="upcmtfrm" id="upcmtfrm"  method="post" class="needs-validation" novalidate>
  <div class="modal" id="updatecmtmodal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
                  코멘트 수정<span class="text-primary icon-restaurant_menu"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

      
          <label class="text-primary">ID</label>
      <input type="text" id="upid" name="nickname" class="form-control" readonly="readonly">
     <div>
      <label class="text-primary" for="up_pwd">비밀번호</label>
      <input type="password" id="uppwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요" required>
      <input type="hidden" id="upchkpwd" name="pwd">
       <small class="invalid-feedback">작성시 등록 한 비밀번호를 입력해주세요</small>
      <input type="hidden" id="upcofseq" name="fseq"> 
      <label class="text-primary" for="up_pwd">한줄 평 수정</label>
      <input type="text" id="upcontents" name="contents" class="form-control" required>
       <small class="invalid-feedback">수정 할 한줄 평을 남겨주세요</small>
      <input type="hidden" id="upcoindex" name="coindex">
      </div>
      
        </div>
        <div class="container" align="right">
        <button type="submit" id="btncmtupdate" class="btn btn-danger" >수정</button>
        </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
</form>
</html>
 <%@ include file="/WEB-INF/views/common/Footer.jsp" %>