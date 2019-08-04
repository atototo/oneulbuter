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
         <form name="registerdmfrm" id="registerdmfrm" action="/admin/register_dm.do" method="post"  enctype="multipart/form-data" class="needs-validation" novalidate>
				<div class="card mb-3">

					<div class="card-header">
						<h3 class="text-primary">다이어트 식단 팁 등록</h3>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover" >
							
								<tr>
						     <th>제목</th>
							 <td colspan="2"><div class="col-xs-2">
                           <input type="text" class="form-control" id="title" name="title" required>
                           	<div class="invalid-feedback">Please writing a title</div>
  							</div></td>
							 <th>상태</th>
							 <td colspan="3">
							<select class="form-control" id="state" name="state">
								<option value="New">New</option>
								<option value="Hot">Hot</option>
							</select></td>
						    </tr>
						    	<tr>
							 <th>대표 이미지</th>
							 <td colspan="6">
							<div class="form-group">
							    <input type="file" id="img" name="file1">
  								</div>
                            </td>
                            </tr>
							<tr>
							 <th>상세 이미지</th>
							 <td colspan="6">
							<div class="form-group">
							    <input type="file" id="detail_img" name="file2">
  								</div>
                            </td>
                            </tr>
							<tr>
							<th>본문1</th>
							<td colspan="6"><textarea class="form-control rounded-0" id="contents1" name="contents1"rows="5" required></textarea>
								<div class="invalid-feedback">Please writing contents</div></td>
									</tr>
							<tr>
							<th>강조문단</th>
							<td colspan="6"><textarea class="form-control rounded-0" id="imp_contents" name="imp_contents" rows="5" required></textarea>
								<div class="invalid-feedback">Please writing contents</div></td>
									</tr>
							<tr>
							<th>본문2</th>
							<td colspan="6"><textarea class="form-control rounded-0" id="contents2" name="contents2" rows="5" required></textarea>
								<div class="invalid-feedback">Please writing contents</div></td>
									</tr>
								</tbody>
							
							</table>
						</div>
					</div>
					<div class="container" align="right">

						<div class="container-fluid pull-right">

							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
								<input type="button" value="목록" class="btn btn-primary btn-md text-white" onclick="location.href='/customer/DMDetail.do'">
								<input type="submit" value="등록" id="dmregist" class="btn btn-primary btn-md text-white" >
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
<form name="insertfrm" id="insertfrm" action="sign_act.do" method="post" class="needs-validation" novalidate >
<!-- 꿀맛 레시피  레시피 1 추가 모달 modal 시작 -->
<div class="modal" id="recipe_add">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
     <input type="text" id="rname"class="form-control" name="rname" placeholder="이름입력" ><span class="text-primary icon-restaurant_menu"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <label class="text-primary">특징</label><h5>
         <input type="text" id="recipe1_feature" name="recipe1_feature" class="form-control" placeholder="특징"></h5> 
       	   <div class ="ingredients">
       	   <h4>재료</h4>
       	   <table class="table">
                <tr>
                    <th> <input type="text" id="recipe1_ingre1" name="recipe1_ingre1" class="form-control" placeholder="재료" > </th>
                    <td><div class="input-group">
                           <input type="text"  id="recipe1_amt1" name="recipe1_amt1" class="form-control" placeholder="질량(개수)">
  							<span class="input-group-addon" id="basic-addon2">
  							<select class="form-control" id="amtunit1">
								<option value="g">g</option>
								<option value="ml">ml</option>
								<option value="개">개</option>
								</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="recipe1_ingre2" name="recipe1_ingre2" class="form-control" placeholder="재료" ></th>
                    <td><div class="input-group">
                           <input type="text" id="recipe1_amt2" name="recipe1_amt2" class="form-control" placeholder="질량(개수)">
  							<span class="input-group-addon"  id="amtunit2">
  							<select class="form-control" >
								<option>g</option>
								<option>ml</option>
								<option>개</option>
								</select>
  							</span>
							</div>
							</td>
                    </tr>
                <tr>
                    <th><input type="text" id="recipe1_ingre3" name="recipe1_ingre3" class="form-control" placeholder="재료" ></th>
                   <td><div class="input-group">
                           <input type="text" id="recipe1_amt3" name="recipe1_amt3" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" id="amtunit3">
  							<select class="form-control" >
								<option>g</option>
								<option>ml</option>
								<option>개</option>
								</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="recipe1_ingre4" name="recipe1_ingre4" class="form-control" placeholder="재료" ></th>
                    <td><div class="input-group">
                           <input type="text" id="recipe1_amt4" name="recipe1_amt4" class="form-control" placeholder="질량(개수)">
  							<span class="input-group-addon" id="amtunit4">
  							<select class="form-control" >
								<option>g</option>
								<option>ml</option>
								<option>개</option>
								</select>
  							</span>
							</div>
							</td>
                    </tr>
                <tr>
                    <th><input type="text" id="recipe1_ingre5" name="recipe1_ingre5" class="form-control" placeholder="재료"></th>
                    <td><div class="input-group">
                           <input type="text" id="recipe1_amt5" name="recipe1_amt5" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" id="amtunit5">
  							<select class="form-control" >
								<option>g</option>
								<option>ml</option>
								<option>개</option>
								</select>
  							</span>
							</div>
							</td>
                    <th><input type="text" id="recipe1_ingre6" name="recipe1_ingre6" class="form-control" placeholder="재료" ></th>
                    <td><div class="input-group">
                           <input type="text" id="recipe1_amt6" name="recipe1_amt6" class="form-control" placeholder="질량(개수)" >
  							<span class="input-group-addon" id="amtunit6">
  							<select class="form-control" >
								<option>g</option>
								<option>ml</option>
								<option>개</option>
								</select>
  							</span>
							</div>
							</td>
                   
                    </tr>
                
          </table>
        </div><hr>
        <div class="jumbotron">
         <table class="table">
        	<tr><th>1</th><td>
			<textarea class="form-control rounded-0" id="recipe1_htm1" name="recipe1_htm1" rows="5"></textarea>
			<input type="file" id="recipe1_img1" name="recipe1_img1">
  			</td>
        	<th>2</th>
			<td>
			<textarea class="form-control rounded-0" id="recipe1_htm2" name="recipe1_htm2" rows="5"></textarea>
			<input type="file" id="recipe1_img2" name="recipe1_img2">
  			</td>
  			</tr>
        	<tr><th>3</th><td>
			<textarea class="form-control rounded-0" id="recipe1_htm3" name="recipe1_htm3" rows="5"></textarea>
		    <input type="file" id="recipe1_img3" name="recipe1_img3">
  			</td>
  			
        	<th>4</th><td>
			<textarea class="form-control rounded-0" id="recipe1_htm4" name="recipe1_htm4" rows="5"></textarea>
			<input type="file" id="recipe1_img4" name="recipe1_img4"></td>
			</tr>
        	<tr><th>5</th><td colspan="3">
			<textarea class="form-control rounded-0" id="recipe1_htm5" name="recipe1_htm5" rows="5"></textarea>
            <input type="file" id="recipe1_img5" name="recipe1_img5">
			</td>
			</tr>	        	
        	</table>
        	</div>
        </div>
        <div class="container" align="right">
        <button type="button" id="save" class="btn btn-danger" onclick="saveaction()" >저장</button>
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