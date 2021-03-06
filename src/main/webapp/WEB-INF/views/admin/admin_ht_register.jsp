<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style type="text/css">
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
 
 h2 { font-family: NanumBrush; }
 .text-primary { font-family: NanumBrush;   }

 form { font-family: NanumBrush; font-size:20px;}
 .btn { font-family: NanumBrush; }

 .section-title { font-family: NanumPen; }

 .table-responsive th{
  background-color: #B3D1DE;
  
  text-align: center;
 } 

</style>


<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

<script type="text/javascript">
$( function() {
	/* if("${msg}" != null && "${msg}" != ''){
		alert("${msg}");
	}
	 */
	
    $("#calorieregist").click(function(){
    	/*
    	if ($("#id").val().length <= 0){
    		alert("ID를 입력해야 합니다.");
    		$("#id").focus();
    		return false;
    	}
		if ($("#pwd").val().length <= 0){
    		alert("패스워드를 입력해야 합니다.");
    		$("#pwd").focus();
    		return false;
    	}
    	if ($("#name").val().length <= 0){
    		alert("이름을 입력해야 합니다.");
    		$("#name").focus();
    		return false;
    	}
		if ($("#phone").val().length <= 0){
    		alert("핸드폰번호를 입력해야 합니다.");
    		$("#phone").focus();
    		return false;
    	}
		if ($("#email").val().length <= 0){
    		alert("이메일을 입력해야 합니다.");
    		$("#email").focus();
    		return false;
    	}
		*/
		//$("#insertfrm").attr("action","sign_act.do").submit();
		//alert("저장");
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

</script>

    <section class="site-section border-bottom" id="Dictionary">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-md-5 text-left">
            <h2 class="section-title mb-3">관리자 페이지&nbsp;<span class="icon-book"></span></h2>
          </div>
        </div>
       
  
 
         <!-- DataTables Example -->
         <form name="registerhtfrm" id="registerhtfrm" action="/admin/register_ht.do" method="post"  enctype="multipart/form-data" class="needs-validation" novalidate>
				<div class="card mb-3">

				<div class="card-header">
						<h3 class="text-primary">홈트레이닝 등록</h3>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover" >
								<tbody>
							<tr>
							<th>제목</th>
							<td colspan="6"><div class="col-xs-2">
                           <input type="text" class="form-control" id="htname" name="htname" required>
  								<div class="invalid-feedback">Please writing name</div>
  							</div>
  							
  							</td>	
							<tr>
							 <th>상태</th>
							 <td colspan="2"><select class="form-control" id="state" name="state">
								<option value="New">New</option>
								<option value="Hot" >Hot</option>
							</select></td>
							 <th>분류</th>
							 <td colspan="3"><select class="form-control" id="kind" name="kind">
								<option value="요가">요가</option>
								<option value="댄스">댄스</option>
								<option value="휘트니스">휘트니스</option>
							</select></td>
							</tr>
							<tr>
							<th>운동 분석</th>
							<th class="child_item">시간</th>
							<td>
							<div class="input-group">
							<input type="number" class="form-control" min="1" max="60" id="exertimemin" name="exertimemin" required>분
							<div class="invalid-feedback">Please writing minute</div>
							<input type="number" class="form-control"  min="1" max="60" id="exertimesec" name="exertimesec" >초
							</div>
							</td>
							<th class="child_item">난이도</th>
							<td><select class="form-control" id="htlevel" name="htlevel">
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하" >하</option>
							</select></td>
							<th class="child_item">소모칼로리</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" aria-describedby="basic-addon2" id="burn_cal" name="burn_cal" required>
                           <div class="invalid-feedback">Please writing calorie</div>
  							</div><span class="input-group-addon" id="basic-addon2">&nbsp;kcal</span>
							</div></td>
							</tr>
								<tr>
							<th>썸네일</th>
							<td colspan="6">
							    <input type="file" id="img" name="file1" required>
							    <div class="invalid-feedback">Please choose img</div>
							</td>
							</tr>
							<tr>
							 <th>영상</th>
							 <td colspan="6">
			                 <input type="text" class="form-control" placeholder="youtube script " id="hturl" name="hturl" required>
			                 <div class="invalid-feedback">Please writing url</div> 
                            </td>
                            </tr>
							<tr>
							<th>소개글</th>
							<td colspan="6"><textarea class="form-control rounded-0" id="summary" name="summary" rows="5" required></textarea>
							<div class="invalid-feedback">Please writing summary</div>
							</td></tr>
							<tr>
							<th>본문</th>
							<td colspan="6"><textarea class="form-control rounded-0"id="contents" name="contents" rows="5" required></textarea>
							<div class="invalid-feedback">Please writing contents</div>
									</td></tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="container" align="right">

						<div class="container-fluid pull-right">

							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
								<!-- <a href="/admin/admin_ht_list.jsp" class="btn btn-primary mr-2 mb-2">목록</a> -->
						     	<div class="pull-right">
								<input type="button" value="목록" class="btn btn-primary btn-md text-white" onclick="location.href='/customer/DMDetail.do'">
								<input type="submit" value="등록" id="htregist" class="btn btn-primary btn-md text-white" >
							</div><p>
							
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