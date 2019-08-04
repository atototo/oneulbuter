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
	if("${msg}" != null && "${msg}" != ''){
		alert("${msg}");
	}
	


    
    
     $('#memupdate').on('show.bs.modal', function (e) {
    	$("#up_id").val($(e.relatedTarget).data('id'));
    	$("#up_spanid").html($(e.relatedTarget).data('id'));
    	$("#up_name").val($(e.relatedTarget).data('name'));
    	$("#up_phone").val($(e.relatedTarget).data('phone'));
    	$("#up_email").val($(e.relatedTarget).data('email'));
    	
    	});

     /*비밀번호는 숫자만 입력되도돍 정규식  */
      $("#pwd").keyup( function(event){
    	   //regexp = /[^0-9]{4}/gi;
    	    regexp =  /[^0-9]{4}/g;
    	     //regexp = /[^0-9]{4}/gi;

           v = $(this).val();

           if (regexp.test(v)) {

               alert("숫자만 입력가능 합니다.\n-(하이픈)을 제외한 숫자만 입력하여 주세요.");

               $(this).val(v.replace(regexp, ''));

           }

         } ); 
     /*비밀번호는 숫자만 입력되도록 키보드 키코드로 분류*/
      $("#pwd").keyup( function(event){
    	 var keyVal = event.keyCode;
    	    if(((keyVal >= 48) && (keyVal <= 57)|| ( keyVal >=96 && keyVal <= 105 ))){
                return true;
            }
            else{
                alert("숫자만 입력가능합니다");
                $(this).val("");
                return false;
            }


         } ); 
});
  
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
	   $("#deletefrm").attr("action","del_act.do").submit();
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
										<th>아이디</th>										
										<th>이름</th>
										<th>핸드폰 번호</th>
										<th>이메일</th>
										<th>선택</th>
									</tr>
								</thead>
								<tfoot>
									
								</tfoot>
								<tbody>
								  <c:forEach items="${memlist }" var="membervo">
									<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'" >
									    <td id="memberupdate"  data-toggle="modal" data-target="#memupdate" 
									    data-id="${membervo.id }" data-name="${membervo.name }" data-phone="${membervo.phone }"
                                        data-email="${membervo.email }">${membervo.id }</td>
								        <td id="memberupdate"  data-toggle="modal" data-target="#memupdate" 
									    data-id="${membervo.id }" data-name="${membervo.name }" data-phone="${membervo.phone }"
                                        data-email="${membervo.email }">${membervo.name }</td>
										<td id="memberupdate"  data-toggle="modal" data-target="#memupdate" 
									    data-id="${membervo.id }" data-name="${membervo.name }" data-phone="${membervo.phone }"
                                        data-email="${membervo.email }">${membervo.phone }</td>
										<td id="memberupdate"  data-toggle="modal" data-target="#memupdate" 
									    data-id="${membervo.id }" data-name="${membervo.name }" data-phone="${membervo.phone }"
                                        data-email="${membervo.email }">${membervo.email }</td>
										<td>삭제 ( <input type="checkbox" id="del" name="delid" value="${membervo.id }"> )</td>
									</tr>
						</c:forEach> 
							</tbody>
							</table>
						</div>
					</div>
					<div class="container" align="right">
						<div class="container-fluid pull-right">
							<div class="row-fluid pull-right"></div>
							<div class="pull-right">
								<a href="#" class="btn btn-primary mr-2 mb-2" data-toggle="modal" data-target="#memregister">관리자 등록</a>
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
<form name="insertfrm" id="insertfrm" action="sign_act.do" method="post" class="needs-validation" novalidate >
<div class="modal" id="memregister">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header"><span class="text-primary icon-playlist_add_check">&nbsp;
          관리자 등록</span>
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
       <div class="invalid-feedback" id="pwd_invalid">
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
  
  <form name="updatefrm" id="updatefrm" action="sign_update.do" method="post" class="needs-validation" novalidate>
  <div class="modal" id="memupdate">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header"><span class="text-primary icon-playlist_add_check">&nbsp;
          관리자 수정</span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

      
      <label class="text-primary">ID</label>
      <input type="hidden" id="up_id" name="id" class="form-control" placeholder="아이디를 입력해주세요" ><p id="up_spanid" class="lead"></p>
     <div>
      <label class="text-primary" for="up_pwd">비밀번호</label>
      <input type="password" id="up_pwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요">
       <small class="text-success">미입력 시 기존 비밀번호로 저장 됩니다.</small>
      </div>
      <div>
      <label class="text-primary" for="up_name">이름</label>
      <input type="text" id="up_name" name="name" class="form-control" placeholder="아름을 입력해주세요">
       <div class="invalid-feedback">Please choose a name.</div>
      </div>
      <div>
      <label class="text-primary" for="up_phone">핸드폰번호</label>
      <input type="tel" id="up_phone" name="phone" class="form-control" placeholder="핸드폰번호를 입력해주세요">
       <div class="invalid-feedback">Please choose a phone.</div>
      </div>
      <div>
      <label class="text-primary" for="up_email">이메일</label>
      <input type="email" id="up_email" name="email" class="form-control" placeholder="이메일을 입력해주세요">
       <div class="invalid-feedback">Please choose a email.</div>
      </div>
     
        </div>
        <div class="container" align="right">
        <button type="submit" id="btnmemberupdate" class="btn btn-danger" >수정</button>
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