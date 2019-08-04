<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <script src="/include/js/jquery-3.3.1.min.js"></script>
  <script src="/include/js/jquery-ui.min.js"></script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body> 
<script type="text/javascript"> 
var message = '${msg}'; 
var returnUrl = '${url}'; 
alert(message); 
//location.reload(-2);
location.href=returnUrl;
</script></body></html> 
