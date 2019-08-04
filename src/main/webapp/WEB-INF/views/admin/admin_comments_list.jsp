<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style type="text/css">
.search{
 width: 100%;
 margin-top: 10px;
 margin-bottom: 20px;
}
.formsearch{
  width: 500px;
  height: 43px;
  border-radius: 30px;
  font-family: "Roboto", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; }
  .formsearch:active, .formsearch:focus {
    border-color: #e81050; }
      .formsearch:hover, .formsearch:active, .formsearch:focus {
    -webkit-box-shadow: none !important;
    box-shadow: none !important; }
    
  thead>tr>th{
    text-align: center;
    background-color: #83B9CC;
    color: white;
  }

}
</style>


<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

<script type="text/javascript">
$( function() {
	if("${msg}" != null && "${msg}" != ''){
		alert("${msg}");
	}
	
    $("#btnmemberupdate").click(function(){
    	
		/*
    	if ($("#name").val().length <= 0){
    		alert("이름을 입력해야 합니다.");
    		$("#name").focus();
    		return false;
    	}
		*/
		/* if ($("#up_phone").val().length <= 0){
    		alert("핸드폰번호를 입력해야 합니다.");
    		$("#up_phone").focus();
    		return false;
    	}
		if ($("#up_email").val().length <= 0){
    		alert("이메일을 입력해야 합니다.");
    		$("#up_email").focus();
    		return false;
    	} */
		
		/* $("#updatefrm").attr("action","sign_update.do").submit(); */
    });
   /*  $("#delbtn").click(function(){
     var str = "";  
    $("input:checkbox:checked").each(function (index) {  
        str += $(this).val() + ",";   
     }); 
    });  
    */ //return str;  


  } );
  
  function delfun(){
	   var str = "";  
	   if( $("input:checkbox:checked").length==0 ){
		    alert("삭제할 항목을 하나이상 체크해주세요.");
		    return;
		  }
	    $("input:checkbox:checked").each(function (index) {  
	        str += $(this).val() + ",";   
	     }); 
	   alert(str) 
	   $("#deletefrm").attr("action","/admin/delcmt_act.do").submit();
  }

  
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

</script>

    <section class="site-section border-bottom" id="Dictionary">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-md-5 text-left">
            <h2 class="section-title mb-3">관리자 페이지&nbsp;<span class="icon-book"></span></h2>
          </div>
        </div>
       
  
 
         <!-- DataTables Example -->
         <form name="deletefrm" id="deletefrm"  method="post">
				<div class="card mb-3">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" cellspacing="0">
								<thead>
									<tr >
										<th >식품</th>
										<th>닉네임</th>										
										<th>한줄 평</th>
										<th>등록일</th>
										<th>선택</th>
									</tr>
								</thead>
							
								<tbody>
								  <c:forEach items="${colist }" var="covo">
									<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'" >
									    <td >${covo.fname }</td>
									    <td >${covo.nickname }</td>
									    <td >${covo.contents }</td>
									  <td>${covo.indate }</td>
								      <td>삭제 ( <input type="checkbox" id="del" name="delid" value="${covo.coindex } "> )</td>
									</tr>
									<input type="hidden" name="fseq" value="${covo.fseq }">
						</c:forEach> 
							</tbody>
							</table>
						</div>
					</div>
					<div class="container" align="right">
						<div class="container-fluid pull-right">
							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
							
							    <a href="#" class="btn btn-primary mr-2 mb-2" 
							    onclick="location.href='/customer/FoodDetail.do?fseq=${fseq }'">취소</a> 
								<a href="#" id="delbtn" class="btn btn-primary mr-2 mb-2" onclick="delfun()">선택 삭제</a>
							</div>
						</div>
					</div> 
				</div>
				</form>
      <!-- /.container-fluid -->
    <!-- /.content-wrapper -->
           
     </div>
    </section>
<%@ include file="/WEB-INF/views/common/Footer.jsp" %>

</html>