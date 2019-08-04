<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">


<style type="text/css">
@font-face { font-family: 'NanumBrush'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumBrush.ttf) format('truetype'); }
@font-face { font-family: 'NanumPen'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype'); }
@font-face { font-family: 'NanumGothic'; src: url(/include/fonts/NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype'); }
.search{
 width: 100%;
 margin-top: 10px;
 margin-bottom: 20px;
}
.formsearch{
  width: 500px;
  height: 43px;
  border-radius: 30px;
  /* font-family: "Roboto", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; */ }
  .formsearch:active, .formsearch:focus {
    border-color: #e81050; }
      .formsearch:hover, .formsearch:active, .formsearch:focus {
    -webkit-box-shadow: none !important;
    box-shadow: none !important; }
}

 
 h2 { font-family: NanumBrush; }
 option { font-family: NanumBrush; }

 .mb-0 { font-family: NanumBrush; }
 .btn { font-family: NanumPen;  }
 .modal-title { font-family: NanumBrush; font-size:23px;}
 .section-title { font-family: NanumPen; font-size:23px;}
 .formsearch { font-family: NanumBrush; font-size:23px;}
 .modal { font-family: NanumGothic;}
td{font-family: NanumGothic; }

a{
font-family: NanumPen; 
}
</style>


<%@ include file ="/WEB-INF/views/common/Header.jsp"  %>

<script type="text/javascript">
$( function() {
    var availableTags = [
      "각종 과일",
      "각종 야채",
      "견과류",
      "보충제",
      "영양제",
      "각종 음식",
      "그냥 밥",
      "굶기",
      "삶은 계란"
    ];
    $( "#inputAutocomplete" ).autocomplete({
      source: availableTags
    });
    
    $('#findbtn').click(function(){
    	if($("#kind").val() == ''){
    		 alert("카테고리를 선택하세요.");
    		 return false;
    	}else{
    		
    		
    		var idx = $("#kind option").index( $("#kind option:selected") )-1;

    		//var k = $("#kseqlist option:selected").val();
    		var serchname = $("#inputAutocomplete").val();
    		
    		
    		location.href="/customer/find_cal.do?kseq="+idx+"&fname="+serchname ;
    				
    	/*  $("#frm").attr("action", "customer/find_cal.do?kseq="+idx+"&fname="serchname) */
    	}
  	 
  	});
    
    $('#calregister').click(function(){
    	$("#frm").attr("action","/admin/insert_cal.do").submit();
    });
    
    $('#caldellist').on('show.bs.modal', function (e) {
 	   $("#calorielist").attr('items',$(e.relatedTarget).data('calorielist'));
    });
    
  } );


function delfun(){
	   var str = "";  
	   if( $("input:checkbox:checked").length==0 ){
		    alert("삭제할 항목을 하나이상 체크해주세요.");
		    return;
		  }
	    $("input:checkbox:checked").each(function (index) {  
	        str += $(this).val() + ",";   
	     }); 
	   
	   $("#deletefrm").attr("action","/admin/delcalorie_act.do").submit();
}


</script>
<form name="form" id="frm" method="post">
    <section class="site-section border-bottom" id="Dictionary">
      <div class="container" style="padding-top: 30px;">
        <div class="row mb-5">
          <div class="col-12 text-center" >
            <h2 class="section-title mb-3" >칼로리 사전  <span class="icon-book"></span></h2>
            
          </div>
        </div>
        
	    <div class="search align-items-center">
	    <div class="row">
       <select class="form-control col-md-2" name="kind" id="kind">
			 	<option value="" >분류</option> 
				  <c:forEach items="${kseqlist }" var="kseqrvo">
						<option value=" ${kseqrvo.kseq }" > ${kseqrvo.kind }</option>	
					</c:forEach> 
				</select> &nbsp; 
            <input type="text" id="inputAutocomplete" class="formsearch" placeholder="검색어 입력" name="serchname">
            <input type="button" id="findbtn" value="검색" class="btn btn-primary btn-md text-white" 
            style="font-size: 20px;"onclick="find()">&nbsp;
            
            <c:if test="${ sessionScope.loginUser != null}" >  
            <input type="button" id="calregister" value="칼로리등록" class="btn btn-primary btn-md text-white"
            		style="font-size: 20px;" > &nbsp;
            </c:if>
            <c:if test="${ sessionScope.loginUser != null && fn:length(calorielist) != 0 }" > 
			
			<input type="button" id="caloriedel" value="칼로리  리스트" class="btn btn-primary btn-md text-white"
			style="font-size: 20px;"
			 data-toggle="modal" data-target="#caldellist" data-backdrop="static" 
			 data-calorielist="${calorielist }" 
			 ></c:if>
			
        </div></div>
	    
        <div class="row">
        
        <!-- 반복구간 -->
	   <c:forEach items="${calorielist }" var="calorieVO">
          <div class="col-md-6 col-lg-3 mb-4">
            <div class="team-member" id="food">
              <figure>
          
                <img src="${calorieVO.img }" alt="Image" style="cursor:pointer; height:300px; width:600px;" class="img-fluid" name="banana" onclick="location.href='/customer/FoodDetail.do?fseq=${calorieVO.fseq }'">
              </figure>
              <div class="p-3" style="text-align: center; color:#17A2B8;">
               <h3 class="mb-0 font-weight-bold" style="color:#17A2B8;">${calorieVO.fname }</h3>
                <input type="hidden" name="fname" value="${calorieVO.fname }">
                <input type="hidden" name="kseq" value="${calorieVO.kseq }">
              </div>
            </div>
          </div>
         </c:forEach>
          
        </div>
      </div>
    </section>
</form>

<%@ include file="/WEB-INF/views/common/Footer.jsp" %>
<div class="modal" id="caldellist">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

           <form name="deletefrm" id="deletefrm"  method="post">
      <!-- ModalHeader -->
      <div class="modal-header">
        <h4 class="modal-title"><span class="text-primary icon-playlist_add_check"></span>&nbsp;칼로리 리스트</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
                   	<input type="hidden" id="reipcelist">
       	   <table class="table">
              <thead>  
                <tr>
                    <th>IDX</th>
                    <th>식품명</th>
                    <th>특징</th>
                    <th>칼로리</th>
                    <th>선택</th>
                  </tr>
                 </thead> 
                   	<tbody>
					  <c:forEach items="${calorielist }" var="calorieVO">
						<tr  style="cursor:pointer;" onmouseover="this.style.background='#C5DFE3'" onmouseout="this.style.background='white'"
						onclick="location.href='/customer/FoodDetail.do?fseq=${calorieVO.fseq }'">
						<td >${calorieVO.fseq }</td>
						<td >${calorieVO.fname }</td>
						<td >${calorieVO.feature }</td>
						<td >${calorieVO.cal }&nbsp;kcal</td>
						<td>삭제 ( <input type="checkbox" id="del" name="delid" value="${calorieVO.fseq } "> )</td>
						</tr>
						<input type="hidden" name="fseq" value="${calorieVO.fseq }">
						</c:forEach> 
							</tbody>
          </table>
       	</div>
        <div class="container" align="right">
        <!-- <button type="button" id="modalsave" class="btn btn-danger" >저장</button> -->
      <button type="button" id="update" class="btn btn-danger" onclick="delfun()" >선택 삭제</button>
         </div>
         
         
         
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      </form>
      </div>
      </div>
       </div>
<!-- modal 팝업 정보 ID mymodal 참고 끝 -->
</html>