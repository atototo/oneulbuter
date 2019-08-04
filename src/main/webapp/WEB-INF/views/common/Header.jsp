<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
<style type="text/css">


@font-face { font-family: 'NanumGothic'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype'); }

.text-info{
font-family: NanumGothic;
}
.nav-link{
    color:#DB005B;
 }
</style>
<script type="text/javascript">
function fn_url(myurl) {
	location.href=myurl;
}
</script>
  <head>
    <title>Onelbuter &mdash; Website by Dieter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/include/css?family=Roboto:300,400,900" rel="stylesheet">
    <link rel="stylesheet" href="/include/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/include/css/bootstrap.min.css">
    <link rel="stylesheet" href="/include/css/jquery-ui.css">
    <link rel="stylesheet" href="/include/css/jquery-ui.structure.min.css">
    <link rel="stylesheet" href="/include/css/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/include/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/include/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/include/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/include/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/include/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/include/css/aos.css">
    <link rel="stylesheet" href="/include/css/style.css">
      <link href="/include/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="/include/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="/include/css/sb-admin.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  
  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo"><a href="/customer/mainindex.do" class="h2 mb-0">Oneulbuter<span class="text-primary">.</span> </a></h1>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block" id="menubar">
              
                <li><a href="#" class="nav-link" onclick="fn_url('/customer/mainindex.do')"><b class="text-info">Home</b></a></li>
                <li><a href="#" class="nav-link" onclick="fn_url('/customer/Dictionary.do')"><b class="text-info" >칼로리 사전</b></a></li>
                <li><a href="#" class="nav-link" onclick="fn_url('/customer/DietTip.do')"><b class="text-info">다이어트 팁</b></a></li>
              <c:if test="${ sessionScope.loginUser != null}" >  

                <li><a href="#" class="nav-link" onclick="fn_url('/admin/adminpage.do')"><b class="text-info">관리자 페이지</b></a></li>
                <li><a href="#" class="nav-link" onclick="fn_url('/login/Logout.do')"><b class="text-danger">logout</b></a></li>
            </c:if>
              </ul>
            </nav>
          </div>
          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black float-right"><span class="icon-menu h3"></span></a></div>
        </div>
      </div>
    </header>
 
  <script src="/include/js/jquery-3.3.1.min.js"></script>
  <script src="/include/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/include/js/jquery-ui.min.js"></script>
  <script src="/include/js/popper.min.js"></script>
  <script src="/include/js/bootstrap.min.js"></script>
  <script src="/include/js/owl.carousel.min.js"></script>
  <script src="/include/js/jquery.stellar.min.js"></script>
  <script src="/include/js/jquery.countdown.min.js"></script>
  <script src="/include/js/bootstrap-datepicker.min.js"></script>
  <script src="/include/js/jquery.easing.1.3.js"></script>
  <script src="/include/js/aos.js"></script>
  <script src="/include/js/jquery.fancybox.min.js"></script>
  <script src="/include/js/jquery.sticky.js"></script>
  <script src="/include/js/main.js"></script> 
 </div>
 </body>
</html>