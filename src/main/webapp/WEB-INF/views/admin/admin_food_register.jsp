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
         <form name="insertcalfrm" id="insertcalfrm" action="/admin/register_cal.do" method="post" class="needs-validation" novalidate>
				<div class="card mb-3">

					<div class="card-header">
						<h3 class="text-primary">칼로리 등록</h3>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover" >
								<tbody>
							<tr>
							 <th class="active">식품명</th>
								<td class="success" colspan="2">
									<input type="text" class="form-control" id="fname" placeholder="식품명 입력" name="fname"  required>
									<div class="invalid-feedback">Please writing a food</div>
								</td>
							 <th style="width: 7%;">식품군</th>
							 <td colspan="3"><select class="form-control" name="kseq" id="kseq" required>
						      <option value="">분류</option>
								  <c:forEach items="${kseqlist }" var="kseqrvo">
								  <option value=" ${kseqrvo.kseq }" > ${kseqrvo.kind }</option>	
								</c:forEach> 
							</select></td>
							</tr>
							<tr>
							<th>특징</th>
							<td class="success" colspan="2">
								<input type="text" class="form-control"placeholder="특징" id="feaure" name="feature" required>
								<div class="invalid-feedback">Please writing a feature</div>
			                </td>
							<th>질량</th>
							<td><div class="input-group">
                            <input type="text" id="amounts" class="form-control" placeholder="질량(개수)" name="amounts" required>
                            <div class="invalid-feedback">Please writing the amounts</div>
  							<span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="unit" name="unit" required>
								<option value="">단위</option>
							 <c:forEach items="${unitlist }" var="unitvo">
						<option value=" ${unitvo.unitname }" > ${unitvo.unitname }</option>	
					</c:forEach>
								</select>
  							</span>
							</div>
							</td>
							<th >cal</th>
							<td colspan="2" style="width: 25%;"><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" id="cal"placeholder="칼로리" name="cal" required>
                           <div class="invalid-feedback">Please writing a cal</div>
  							</div><span class="input-group-addon" id="basic-addon2">&nbsp;kcal</span>
							</div>
							</td>
							</tr>
							<tr>
							<th>영양 분석</th>
							<th class="child_item" >탄수화물</th>
							<td style="width: 25%;"><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" id="carbo" placeholder="탄수화물  구성비율" name="carbo" required>
                           <div class="invalid-feedback">Please writing a carbo</div>
  							</div><span class="input-group-addon">&nbsp;g</span>
							</div>
							</td>
							<th class="child_item">단백질</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="단백질 구성비율" name="protein" id="protein" required>
                           <div class="invalid-feedback">Please writing a protein</div>
  							</div><span class="input-group-addon" >&nbsp;g</span>
							</div>
							</td>
							<th class="child_item">지방</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="지방 구성비율" name="fat" id="fat" required>
                           <div class="invalid-feedback">Please writing a fat</div>
  							</div><span class="input-group-addon" >&nbsp;g</span>
							</div>
							</td>
							</tr>
							<tr>
							<th rowspan="2">칼로리소모 운동량</th>
							<th class="child_item">걷기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer1" id="exer1" required>
                           <div class="invalid-feedback">Please writing a minute</div>
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th class="child_item">달리기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer2" id="exer2" required>
                           <div class="invalid-feedback">Please writing a minute</div>
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th class="child_item" style="width: 6%;">줄넘기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer3" id="exer3" required>
                           <div class="invalid-feedback">Please writing a minute</div>
  							</div><span class="input-group-addon" >&nbsp;분</span>
							</div>
							</td>
	  						</tr>
							 <tr>
							<th class="child_item">수영</th>
							<td colspan="2"><div class="input-group" >
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer4" id="exer4" required>
                           <div class="invalid-feedback">Please writing a minute</div>
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th  class="child_item">자전거</th>
							<td colspan="2"><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer5" id="exer5" required>
                           <div class="invalid-feedback">Please writing a minute</div>
  							</div><span class="input-group-addon" >&nbsp;분</span>
							</div>
							</td>
							 </tr>
			       </tbody>
							</table>
						</div>
					</div>
					<div class="container" align="right">

						<div class="container-fluid pull-right">

							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
								<input type="button" value="목록" class="btn btn-primary btn-md text-white" onclick="location.href='/customer/Dictionary.do'"
								style="font-size: 20px;">
								<input type="submit" value="등록" id="calorieregist" class="btn btn-primary btn-md text-white"  style="font-size: 20px;">
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