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
 .btn { font-family: NanumBrush; font-size: 30px; }

 .section-title { font-family: NanumPen; }
a{
font-family: NanumPen; 

}

 .table-responsive th{
  background-color: #B3D1DE;
  
  text-align: center;
 }  



</style>


<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

<script type="text/javascript">
$( function() {
	
	
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

  
 /*   (function() {
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
  	})();  */

</script>

    <section class="site-section border-bottom" id="Dictionary">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-md-5 text-left">
            <h2 class="section-title mb-3">관리자 페이지&nbsp;<span class="icon-book"></span></h2>
          </div>
        </div>
       
  
 
         <!-- DataTables Example -->
         <form name="updatecalfrm" id="updatecalfrm" action="/admin/update_cal.do" method="post">
				<div class="card mb-3">

					<div class="card-header">
						<h1 class="text-primary">칼로리 수정</h1>
					</div>

					<input type="hidden" id="fseq" name="fseq" value="${calvo.fseq }">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover" id="dataTable" cellspacing="0">
								<tbody>
							<tr>
							 <th class="active">식품명</th>
										<td class="success" colspan="2">
										<input type="text" class="form-control"
											id="fname" placeholder="식품명 입력" name="fname" value="${calvo.fname }" readonly="readonly">
										</td>
										<th>식품군</th>
							 <td colspan="3"><select class="form-control" name="kseq" id="kseq">
						    <option value="">분류</option>
				            <c:forEach items="${kseqlist }" var="kseqvo" varStatus="status">
				            <c:choose>
 	                        <c:when test="${calvo.kseq+1 == status.count}">
	                        <option value="${status.count }"  selected="selected">${kseqvo.kind }</option>
                            </c:when>
                             <c:otherwise>
	                        <option value="${status.count }" >${kseqvo.kind }</option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
				      </select></td>
							</tr>
							<tr>
							<th>특징</th>
							<td class="success" colspan="2">
								<input type="text" class="form-control"placeholder="특징" id="feaure" name="feature" value="${calvo.feature }">
			                </td>
							<th>질량</th>
							<td style="width:20%;"><div class="input-group">
                            <input type="text" id="amounts" class="form-control" placeholder="질량(개수)" name="amounts" value="${calvo.amounts }">
  							<span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="unit" name="unit" >
								<option value="">단위</option>
								
								<c:forEach items="${unitlist }" var="unitvo" varStatus="status">
				            <c:choose>
 	                        <c:when test="${calvo.unitnum+1 == status.count}">
	                        <option value="${status.count }"  selected="selected">${unitvo.unitname}</option>
                            </c:when>
                             <c:otherwise>
	                        <option value="${status.count }" >${unitvo.unitname }</option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
								</select>
  							</span>
							</div>
							</td>
							<th>cal</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" id="cal"placeholder="칼로리" name="cal" value="${calvo.cal }">
  							</div><span class="input-group-addon" >&nbsp;kcal</span>
							</div>
							</td>
							</tr>
							<tr>
							<th>영양 분석</th>
							<th class="child_item">탄수화물</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" id="carbo" placeholder="탄수화물  구성비율" name="carbo" value="${calvo.carbo }">
  							</div><span class="input-group-addon">&nbsp;g</span>
							</div>
							</td>
							<th class="child_item">단백질</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="단백질 구성비율" name="protein" id="protein" ${calvo.protein }>
  							</div><span class="input-group-addon" >&nbsp;g</span>
							</div>
							</td>
							<th class="child_item">지방</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="지방 구성비율" name="fat" id="fat" value="${calvo.fat }">
  							</div><span class="input-group-addon" >&nbsp;g</span>
							</div>
							</td>
							</tr>
							<tr>
							<th rowspan="2">칼로리소모<br> 운동량</th>
							<th class="child_item">걷기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer1" id="exer1" value="${calvo.exer1 }">
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th class="child_item">달리기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer2" id="exer2" value="${calvo.exer2 }">
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th class="child_item">줄넘기</th>
							<td><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer3" id="exer3" value="${calvo.exer3 }">
  							</div><span class="input-group-addon" >&nbsp;분</span>
							</div>
							</td>
	  						</tr>
							 <tr>
							<th class="child_item">수영</th>
							<td colspan="2"><div class="input-group" >
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer4" id="exer4" value="${calvo.exer4 }">
  							</div><span class="input-group-addon">&nbsp;분</span>
							</div>
							</td>
							<th  class="child_item">자전거</th>
							<td colspan="2"><div class="input-group">
							<div class="col-xs-2">
                           <input type="text" class="form-control" placeholder="소요시간" name="exer5" id="exer5" value="${calvo.exer5 }">
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
								<input type="button" value="취소" class="btn btn-primary btn-md text-white" onclick="location.href='/customer/FoodDetail.do?fseq=${calvo.fseq }'">
								<input type="submit" value="수정" id="calorieregist" class="btn btn-primary btn-md text-white" >
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