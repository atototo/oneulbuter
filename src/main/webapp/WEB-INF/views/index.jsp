<%@page import="com.ko.diet.common.Vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%
MemberVo memvo = (MemberVo)session.getAttribute("loginUser");

%>
<meta charset="UTF-8">

<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

<style type="text/css">
@font-face { font-family: 'NanumGothic'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
h1{
 margin-left:15%;
 font-family: NanumGothic;
}
.mb-6{
font-family: NanumPen;
font-size: 30px;
}
</style>

 <div class="site-wrap" style="width:100%">
 	<div class="site-blocks-cover overlay" style="background-image: url(/include/images/obtindex.jpg);" data-aos="fade" id="ObtIndex">
      <div class="container">
        <div class="row align-items-center "> <!-- align-items 부트스트랩 새로 정렬 -->

          
              <div class="col-md-10 mt-lg-5 text-left">
                <h1>오늘부터</h1>
                <div class="intro-text text-left">
                <p class="mb-6">내일이 아닌 오늘부터 시작</p>
                </div>
                <div>
                  <a href="/login/login.do" class="btn btn-primary mr-2 mb-2">Get Started</a>
                </div>
              </div>
            
        </div>
      </div>
    </div>  
  </div>
<%@ include file="/WEB-INF/views/common/Footer.jsp" %>

</html>