<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/include/css/bootstrap.min.css">
<link rel="stylesheet" href="/include/css/loginform.css">
<script src="/include/js/bootstrap.min.js"></script>
<script src="/include/js/jquery-3.3.1.min.js"></script>
<head>
<script>
$(document).ready(function(){			
	alert("세션이 만료되어 로그아웃 됩니다.");	
	$("#postform").attr("target","_top").submit();
});
</script>
</head>
<body>
	<form id="postform" action="/" method="GET" >				
	</form>
</body>
</html>