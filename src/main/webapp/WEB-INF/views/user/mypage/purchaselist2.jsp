<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%!
   int writePages = 5;
%>
<%!
   int mb_uid = 2;
%>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
		<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css"/>
		<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/ripples.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/bootstrap-material-datetimepicker.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/imagebox.css" />
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/puchaselist.css">
		
		<script src="https://code.jquery.com/jquery-1.12.3.min.js" integrity="sha256-aaODHAgvwQW1bFOGXMeX+pC4PZIPsvn2h1sArYOhgXQ=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/ripples.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/js/material.min.js"></script>
		<script type="text/javascript" src="https://rawgit.com/FezVrasta/bootstrap-material-design/master/dist/js/material.min.js"></script>
		<script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/user/bootstrap-material-datetimepicker.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
</head>


<script type="text/javascript">
// TODO
$(document).ready(function(){
	$('#searchStartDate').bootstrapMaterialDatePicker({
	    weekStart: 0, 
	    format: 'YYYY-MM-DD', 
	    time: false , 
	    shortTime : false, 
	    minDate: null, 
	    maxDate: null
	}).on('change', function(e, date) {
	    $('#searchEndDate').bootstrapMaterialDatePicker('setMinDate', date);
	});
		
	
	$('#searchEndDate').bootstrapMaterialDatePicker({
	    weekStart: 0, 
	    format: 'YYYY-MM-DD', 
	    time: false , 
	    shortTime : false,
	});
	

   
   $("input#page").val(1); // 페이지 최초 로딩되면 1페이지로
   
   //TODO : n Page 읽어오기
   loadPage(1, searchStartDate, searchEndDate, keyword);
   
   //[이전] 버튼 눌렀을때
   $("button#prev").click(function(){
      // 현재 페이지 정보
      var curPage = parseInt($("input#page").val())
      // 첫페이지였다면
      if(curPage == 1){
         alert("이전 페이지가 없습니다");
         return;
      }
      // 첫페이지 아니라면 이전페이지 로딩
      loadPage(curPage-1, searchStartDate, searchEndDate, keyword);
   });
   
   //[다음] 버튼 눌렀을때 
   $("button#next").click(function(){
      var curPage = parseInt($("input#page").val())
      
      loadPage(curPage+1, searchStartDate, searchEndDate, keyword);
 
   });
   
   // 닫기버튼 눌렀을 때
   $(".closePop").click(function() {		
		$("#popUp").css("display", "none");
		return false;
	});
   
   
});




function popUp(py_uid, option) {

	var mb_uid = <%=mb_uid%>;
	var g_name = "";
	var py_amount = "";
	var g_uid = "";
	var co_uid = "";
	var reviewProduct = "";
	var reviewBtn = ""; 
	var reviewUpdateBtn="";
	var value = "";
	
	var urlText = "${pageContext.request.contextPath}/mypageAjax/purchaseProductInfo.ajax/"+ py_uid;
	
	 $.ajax({
	      url : urlText,
	      type : "GET",
	      cache : false,
	      success : function(data, status){
	         if(status == "success"){
	           	g_name = data.dto.g_name;
	           	py_amount = data.dto.py_amount;
	           	g_uid = data.dto.g_uid;
	           	co_uid = data.dto.co_uid;
	         }
	      }
	   });

	
	 
setTimeout(function() {
	 
	if(option == 1){
		
		$('#title').html("리뷰수정");
		$("#popUp").css("display", "block"); // 띄우기
		
		 reviewProduct += "<label>구매상품: "+g_name+"</label><br>";
		 reviewProduct += "<label>구매수량: "+py_amount+"</label>"; 
		 
		 $('#flag').html(reviewProduct);

		reviewUpdateBtn += "<button id='update' class='popBtn accept'>수정</button>";
		reviewUpdateBtn += "<button class='popBtn closePop'>취소</button>";
		
		$('.popBtnBox').html(reviewUpdateBtn);		
		
		var urlText = "${pageContext.request.contextPath}/mypageAjax/reviewUpdate.ajax/" + co_uid;
		
		$.ajax({
	         url : urlText,
	         type : "GET",
	         cache : false,
	         success : function(data, status){
	            if(status == "success"){
	            	
	            	$('#co_subject').val(data.dto.co_subject); 
	            	$('#co_content').val(data.dto.co_content);
            	
	            }else{
	            	$.alert({
					    title: 'Alert!',
					    content: '리뷰 불러오기 실패!',
					});
	        	 return false;
	            }
	         }
	      });
	

		$("#update").click(function() {  // 확인버튼 눌렀을 때
			
			var co_subject = $('#co_subject').val();
			var co_content = $('#co_content').val();
		
			var urlText = "${pageContext.request.contextPath}/mypageAjax/reviewUpdateOk.ajax";
			
			$.ajax({
		         url : urlText,
		         type : "POST",
		         data : {
		        	"co_uid" : co_uid,
		        	"co_subject" : co_subject,
		        	"co_content" : co_content
		         },
		         cache : false,
		         success : function(data, status){
		            if(status == "success"){
		            	alert("리뷰 수정 완료");
		           		return false;
		            }else{
		            	alert("리뷰 수정 실패");
		            	return false;
		            }
		         }
		      });
			
			loadPage(1, searchStartDate, searchEndDate, keyword);
			return true;
		});
		
	}else if(option == 0){

		 reviewProduct += "<label>구매상품: "+g_name+"</label><br>";
		 reviewProduct += "<label>구매수량: "+py_amount+"</label>"; 		 
		 $('#flag').html(reviewProduct);
		
		reviewBtn += "<button id='regist' class='popBtn accept'>등록</button>";
		reviewBtn += "<button class='popBtn closePop'>취소</button>";
		$('.popBtnBox').html(reviewBtn);

		$('#title').html("리뷰 작성");
		$("#popUp").css("display", "block"); // 띄우기
		
		
		
		$("#regist").click(function() {  // 확인버튼 눌렀을 때

			var co_subject =  $('#co_subject').val();
			var co_content = $('#co_content').val();
		
			if(co_subject == ""){
				
				$.alert({
				    title: 'Alert!',
				    content: '제목을 작성해주세요!'
				});
				
				return false;

			}else if(co_content == ""){
				
				$.alert({
				    title: 'Alert!',
				    content: '내용을 작성해주세요!'
				});
				
				return false;
			}
					
			console.log("co_subject: " + co_subject+",  co_content: "+co_content);
			
			var urlText =  "${pageContext.request.contextPath}/mypageAjax/reviewWriteOk.ajax";
			
			$.ajax({
		         url : urlText,
		         type : "POST",
		         data : {
		        	"mb_uid" : mb_uid,
		        	"g_uid" : g_uid,
		        	"py_uid" : py_uid,
		        	"co_subject" : co_subject,
		        	"co_content" : co_content
		         },
		         cache : false,
		         success : function(data, status){
		            if(status == "success"){
		            	alert("리뷰작성 완료");
		               loadPage(1, searchStartDate, searchEndDate, keyword);
		            }else{
		            	alert("리뷰작성 실패");
		            }
		         }
		      });
		
	});
		
		return true;
	}
}, 300);
}


function loadPage(page, searchStartDate, searchEndDate, keyword){
	
   var urlText;   
   var searchStartDate = $('#searchStartDate').val();
   var searchEndDate = $('#searchEndDate').val();
   var keyword = $('#keyword').val();

   if(searchStartDate == "" && searchEndDate == "" && keyword == ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/memberPurchaseList.ajax/<%= mb_uid%>/<%= writePages%>/" + page;
   }else if(searchStartDate != "" || searchEndDate != ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/searchDate.ajax/<%= mb_uid%>/" + searchStartDate + "/" + searchEndDate + "/<%= writePages%>/" + page;
   }else if(keyword != ""){
      urlText = "${pageContext.request.contextPath}/mypageAjax/searchKeyword.ajax/<%= mb_uid%>/" + keyword + "/<%= writePages%>/" + page;
   }
   
   $.ajax({
      url : urlText,
      type : "GET",
      cache : false,
      success : function(data, status){
         if(status == "success"){
            if(updateList(data)){
               // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
               $("input#page").val(page);
            }
         }
      }
   });
} 
 


function pyConfrim(py_uid){
   
	urlText = "${pageContext.request.contextPath}/mypageAjax/purchaseConfirm.ajax/<%= mb_uid%>/"+ py_uid;
	
	$.confirm({
	    title: 'Confirm!',
	    content: '해당 주문의 구매를 확정하시겠습니까?',
	    buttons: {
	        confirm: function () { 
	            $.ajax({
	               url : urlText,
	               type : "GET",
	               cache : false,
	               success : function(data, status){
	                  if(status == "success"){
	                  	$.alert({
	      				    title: 'Alert!',
	      				    content: '구매 확정 완료!',
	      				});
	                     loadPage(1, searchStartDate, searchEndDate, keyword);
	                  }
	               }
	            });
	           
	        },
	        cancel: function () {
	        	 history.back();
	        }
	    }
	});
	
}

// TODO
function updateList(jsonObj){
   result = "";
   if(jsonObj.status == "OK"){
      
      var count = jsonObj.count; // 글 개수
      var items = jsonObj.list; // 글 목록
      
      var i;
      for(i = 0; i < count; i++){
	  
         result += "<tr>\n";

         result += "<td>" + items[i].py_uid +"</td>\n";
         result += "<td>" + items[i].in_img +"</td>\n";
         result += "<td>" + items[i].g_name +"</td>\n";

         // Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현
         var regDate = new Date(items[i].py_regdate);
         var strDate = regDate.getFullYear() + "-" +
                  (regDate.getMonth() + 1) + "-" +     // +1 해추어어야 한다 
                  regDate.getDate();
         
         result += "<td>" +strDate + "</td>\n";
         result += "<td>" + items[i].py_amount +"</td>\n";
         result += "<td>" + items[i].in_color +"</td>\n";
         result += "<td>" + items[i].py_price +"</td>\n";
         
         
         if(items[i].py_confirm == 1){
            result += "<td>구매 확정 완료</td>\n";
         }else{
            result += "<td><input type='button' name='py_uid' value='구매확정' onclick='pyConfrim("+items[i].py_uid+")'/></td>\n";
         }
         
         if(items[i].co_uid == "" ){
        	items[i].co_uid = 0;

            result += "<td><input type='button' class='writeBtn' onclick = 'popUp("+items[i].py_uid+", 0)' value='작성하기'/></td>\n";  
         }else{
            result += "<td><input type='button' class='updateBtn' onclick = 'popUp("+items[i].py_uid+", 1)' value='수정'/></td>\n";
         }
         
         
     	 result += "</tr>\n";
      }
      
      $("table#list tbody").html(result); // 테이블 내용 업데이트
      
      return true;
      
   }else{
      alert("내용이 없습니다.")
      return false;
   }
   
   return false;
}


function searchDate(){
   
   var searchStartDate = $('#searchStartDate').val();
   var searchEndDate = $('#searchEndDate').val();
   var keyword = "";

   if(searchStartDate == '' || searchEndDate == ''){
      alert("검색기간을 입력해주세요");
      return;
   }      

   loadPage(1, searchStartDate, searchEndDate, keyword);
}

function searchKeyword(){
   
   var searchStartDate = "";
   var searchEndDate = "";
   var keyword = $('#keyword').val();
   

   if(keyword == ''){
      alert("검색어를 입력해주세요");
      return;
   }   
   
   loadPage(1, searchStartDate, searchEndDate, keyword);
}


</script>   


<body>
<input type="hidden" id="page"/>
<jsp:include page="/common/menu" />
		
			<div id=test>
				으아아ㅏ아아아ㅏ아ㅏ아악
			</div>
		
					
			<div class="col-md-3">
				<div class="form-control-wrapper">
					<input type="text" id="searchStartDate" class="form-control floating-label" placeholder="Start Date">
				</div>
			</div>
		
		
			<div class="col-md-3">
				<div class="form-control-wrapper">
					<input type="text" id="searchEndDate" class="form-control floating-label" placeholder="End Date">
				</div>
			</div>
			<button type="button" onclick=searchDate()>검색</button>
	
    
	
      <div class="col-md-9">
      <input type="text" name="keyword" id="keyword"/>
      <input type="button" name="keyword_search_btn" id="keyword_search_btn" value="검색" onclick="searchKeyword()"/>
      </div>
      
      
     
      <div class="col-md-9">  
	      <table id="list">
	         <thead>
	            <th>no.</th>
	            <th>구매상품</th>
	            <th>상품명</th>
	            <th>구매일</th>
	            <th>구매수량</th>
	            <th>색상</th>
	            <th>단가</th>
	            <th>구매확정</th>
	            <th>리뷰작성</th>
	         </thead>
	         <tbody>
	         
	         </tbody>
	      </table>
      </div>   
      <div class="col-md-9">
      <button type="button" id="prev">이전페이지</button>
      <button type="button" id="next">다음페이지</button>
     </div>
     
      
      <div id="popUp">
		<form class="modal-notify" name="writeFrm" action="" method="post">
			<p id="title">
				 
			</p>
		
			<div class="moBox">
				
				<div class="txtBox">
					 <label id="flag"></label>				 
					 <input type="text" id="co_subject" class="form-control" placeholder="Subject"/>
					 <textarea id="co_content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>	
				</div>
								
			</div>	
			<div class="popBtnBox">
				
			</div>
			
		</form>
	</div>
	

      
    <script src="${pageContext.request.contextPath }/js/user/date.js"></script>     
	<script src="${pageContext.request.contextPath }/js/user/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/aos.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/main.js"></script>

</body>
</html>
<jsp:include page="/common/footer" />