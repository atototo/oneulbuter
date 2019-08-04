<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/include/css/bootstrap.min.css">
<link rel="stylesheet" href="/include/css/loginform.css">
<script src="/include/js/jquery-3.3.1.min.js"></script>
<script src="/include/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

$(document).ready(function(){
		if("${msg}" != null && "${msg}" != ''){
			alert("${msg}");
		}
	/*
	$("#loginBtn").click(function(){
		
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
		
		$("#loginForm").attr("action","/login/login_act.do").submit();
	});
*/



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
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/include/images/slide_2.jpg" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
  	 <form id="loginForm" method="POST" action="/login/login_act.do" class="needs-validation" novalidate>
     <div>
      	<input type="text" name="id" id="id" class="form-control fadeIn second" placeholder="login" required>
       	<div class="invalid-feedback">Please choose a userid.</div>
     </div>
     <div>
      	<input type="password" name="pwd"  id="pwd" class="form-control fadeIn third" placeholder="password" required>
       	<div class="invalid-feedback">Please choose a userpwd.</div>
     </div>
      <input type="submit" id="loginBtn" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#" data-toggle="modal" data-target="#findpw" data-backdrop="static" >Forgot Password?</a><br>
    </div>

  </div>
</div>
</body>

  <form name="findpwform" id="findpwform" action="/login/resetpw_act.do"   class="needs-validation" novalidate>  
  <div class="modal" id="findpw">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- ModalHeader -->
      <div class="modal-header">
                  비밀번호 초기화<span class="text-primary icon-restaurant_menu"></span>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">

      
     <label class="text-primary">ID</label>
     <input type="text" id="id" name="id" class="form-control" required>
     <small class="invalid-feedback">등록시 작성 한 ID를 입력해주세요</small>
     <div>
     <label class="text-primary">이름</label>
      <input type="text" id="name" name="name" class="form-control" required>
     <small class="invalid-feedback">등록시 작성 한 이름을 입력해주세요</small>
     </div>
     <div>
     <label class="text-primary">전화번호</label>
      <input type="text" id="phone" name="phone" class="form-control" placeholder="전화번호를 입력해주세요"  required>
     <small class="invalid-feedback">등록시 작성 한 전화번호를 입력해주세요</small>
     </div>
     <div>
     <div class="container" align="right">
     <button type="submit" id="btncmtupdate" class="btn btn-danger" >비밀번호 초기화</button>
     </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
    </div>
    </div>
   
  </div>
  </form>
  
  
</html>