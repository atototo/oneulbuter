<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style type="text/css">
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
 
 h2 { font-family: NanumBrush; }
 .text-danger { font-family: NanumBrush; }
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
         <form name="updmfrm" id="updmfrm" action="/admin/update_dm.do" method="post"  enctype="multipart/form-data" class="needs-validation" novalidate>
				<div class="card mb-3">

				<div class="card-header">
						<h3 class="text-danger">다이어트 식단 수정</h3>
							<input type="hidden" id="dmseq" name="dmseq" value="${dmvo.dmseq }">
					</div>

					<div class="card-body">
						<div class="table-responsive" id="uptable">
							<table class="table table-bordered table-hover" >
								<tbody>
							<tr>
							<th >제목</th>
							<td colspan="3">
							<input type="text"  class="form-control" value="${dmvo.title}" name="title">
							</td>	
							<tr>
							 <th>상태</th>
							 <td ><select class="form-control" id="state" name="state">
							<c:choose>
							<c:when test="${dmvo.state == 'Hot'}">
							<option value="Hot" selected="selected">Hot</option>
							<option value="New" >New</option>
							</c:when>
							<c:otherwise>
							<option value="Hot" >Hot</option>
							<option value="New"selected="selected">New</option>
							</c:otherwise>
							</c:choose>
				            </select> </td>
							 <th class="active">등록번호</th>
							 <td  class="success" >${dmvo.dmseq }</td>
							</tr>
						    <tr>
							 <th>대표 이미지</th>
							 <td colspan="3">
							<img src="${dmvo.img }" alt="Image" class="img-fluid">
							<div class="form-group">
							  <input type="file" id="img" name="file1">
  								</div>
                            </td>
                            </tr>
							<tr>
							 <th>상세 이미지</th>
							 <td colspan="3">
							<img src="${dmvo.detail_img }" alt="Image" class="img-fluid">
							<div class="form-group">
							    <input type="file" id="detail_img" name="file2">
  								</div>
                            </td>
                            </tr>
							<tr>
							<th>본문1</th>
							<td colspan="3"><textarea class="form-control rounded-0" id="contents1" 
							rows="5" name="contents1">${dmvo.contents1 }</textarea></td>
									</tr>
							<tr>
							<th>강조문단</th>
							<td colspan="6"><textarea class="form-control rounded-0" id="imp_contents"
							 rows="5" name="imp_contents">${dmvo.imp_contents }</textarea></td>
							</tr>
							<tr>
							<th>본문2</th>
							<td colspan="3"><textarea class="form-control rounded-0" id="contents2"
							 rows="5" name="contents2">${dmvo.contents2 }</textarea></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
					<div class="container" align="right">

						<div class="container-fluid pull-right">

							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
						     	<div class="pull-right">
								<input type="button" value="취소" class="btn btn-primary btn-md text-white" onclick="location.href='/customer/DMDetail.do?dmseq=${dmvo.dmseq}'">
								<input type="submit" value="수정" id="htupdate" class="btn btn-primary btn-md text-white" >
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