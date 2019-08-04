<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>
<script type="text/javascript">
 $(function(){
	$("#save_comment").click(function(){
		var n = $("#nickname").val();
		var con = $("#contents").val();
		/*코멘트 내용 바로 추가되고 화면에 바로 출력 되도록  */
		alert(n + con);
	});
 });

</script>
<form name="form" method="post">
   <section class="site-section bg-light" id="comment-recipe-section">
	<div class="container" style="padding-top: 30px;">
		<div class="row">


				<!-- 한 줄 review -->
			<div class="col-md-7 mb-5" id="comment">
				<div class="p-5 bg-white">

					<h2 class="h4 text-black mb-5 font-weight-bold">Comments
						<span class="text-primary icon-gratipay"></span></h2>
					<div class="row form-group">
						<div class="col-md-12">
							<label class="text-black" for="subject" >닉네임</label>
						   <div class="col-xs-2">
                           <input type="text" class="form-control" id="nickname" name="nickname">
  							</div>
							<label class="text-black" for="subject">한 줄 평 등록</label>
							 <input type="text"  class="form-control" id="contents"name="contents">
						</div>
					</div>
					 
					<div class="row form-group">
						<div class="col-md-12" style="margin-left: 65%;">
							<input type="button" value="한줄평 등록" id="save_comment"
								class="btn btn-primary btn-md text-white" onclick="save_comment()">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12 ">
							<label class="text-black" for="message">Reviews</label>
							
							<!-- c태그로 DB에 의견이 있는 만큼 반복문 돌리는 구간 // 스크롤 기능 추가 -->
							<div class="p-3 mb-3 bg-primary" style="border-radius:5%; height: auto;
    							max-height: 400px; overflow-x: auto;">
							<%-- <c:forEach items="${commentList }" var="commentVO"></c:forEach> --%>									
							   <div class="p-1 mb-3 bg-white" style="background-color: #F8F9FA; border-radius: 5%;">
								<p class="mb-0 font-weight-bold "><%-- ${commentVO.nickname } --%>영은</p>
								<p class="mb-4"><%-- ${commentVO.contents } --%>삶은달걀은 다이어트 영혼의 단짝...ㅎㅎ</p>
								</div>
         							<!--여기까지 반복구간  -->
							   <div class="p-1 mb-3 bg-white" style="background-color: #F8F9FA; border-radius: 5%;">
								<p class="mb-0 font-weight-bold ">아토</p>
								<p class="mb-4">포만감으론 계란이 최고!!</p>
								</div>
							   <div class="p-1 mb-3" style="background-color: #F8F9FA; border-radius: 5%;">
								<p class="mb-0 font-weight-bold ">Address</p>
								<p class="mb-4">203 Fake St. Mountain View, San Francisco,
									California, USA</p>
								</div>
							
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		</div>
</section>
</form>  
         

</html>
 <%@ include file="/WEB-INF/views/common/Footer.jsp" %>