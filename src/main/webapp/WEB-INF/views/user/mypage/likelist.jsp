<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%!
	int writePages = 10;
%> 
<%!
	int mb_uid = 2;
%>       
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
  <head>
    <title>좋아요 목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
	
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/style.css">
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/mypage-date.css"/>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- datepicker 한국어로 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	
  
  </head>  
  <body>
  	<!-- 대문 -->
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">찜목록</h1>
					<p class="breadcrumbs">
						
					</p>
				</div>
			</div>
		</div>
	</div>
		
		<section class="ftco-section bg-light">
    	<div class="container-fluid">
    		<div class="row" id="pr">
    		
    		
    			
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	</div>
    </section>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

	
	<script>
	$(document).ready(function(){
	
		$("input#page").val(1); // 페이지 최초 로딩되면 1페이지로
		//TODO : n Page 읽어오기
		loadPage(1);
		
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
			loadPage(curPage-1);
		});
		
		//[다음] 버튼 눌렀을때 
		$("button#next").click(function(){
			var curPage = parseInt($("input#page").val())
			loadPage(curPage+1);
		});
		
		
		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']); 	
	
		// Datepicker			
		$(".datepicker").datepicker({
			showButtonPanel: true,
			dateFormat: "yy-mm-dd",
			onClose : function ( selectedDate ) {
			
				var eleId = $(this).attr("id");
				var optionName = "";

				if(eleId.indexOf("StartDate") > 0) {
					eleId = eleId.replace("StartDate", "EndDate");
					optionName = "minDate";
				} else {
					eleId = eleId.replace("EndDate", "StartDate");
					optionName = "maxDate";
				}

				$("#"+eleId).datepicker( "option", optionName, selectedDate );		
				$(".searchDate").find(".chkbox2").removeClass("on"); 
			}
		}); 
		
		$(".dateclick").dateclick();	// DateClick
		$(".searchDate").schDate();		// searchDate
		 
	});
	
	
	// page번째 페이지 목록 로딩
	// TODO
	function loadPage(page){
		$.ajax({
			url : "${pageContext.request.contextPath}/mypageAjax/memberLikeList.ajax/<%= mb_uid%>/<%= writePages%>/" + page,
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					// TODO : 페이지 업데이트
					if(updateList(data)){
					   // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
					   $("input#page").val(page);
					}
				}	
			}
		});
	} // end loadPage()
	 
	
	// TODO
	function updateList(jsonObj){
		result = "";
		
		if(jsonObj.status == "OK"){
			
			var count = jsonObj.count; // 글 개수
			var items = jsonObj.list; // 글 목록
			
			
			var i;
			for(i = 0; i < count; i++){
				
				result += "<div class='col-sm col-md-6 col-lg-3'>";
				result += "<div class='product'>";
				result += "<a href='#' class='img-prod'>";
				result += "<img class='img-fluid' src='${pageContext.request.contextPath}/img/goods/"+ items[i].g_img +"' alt='Colorlib Template' />";
				result += "</a>";
				result += "<div class='text py-3 px-3'>";
				result += "<h3><a href='#'>"+ items[i].g_name +"</a></h3>";
				result += "<div class='d-flex'>";
				result += "<div class='pricing'>";
				result += "<p class='price'><span class='price-sale'>"+ items[i].g_price +"</span></p>"
				result += "</div>";			
				result += "<div class='rating'>";
				result += "<p class='text-right'>";
				result += "<a href='#' onclick=delzzim('"+items[i].gl_uid+"') class='ml-auto'><span><i class='material-icons'>favorite</i></span></a>";
				result += "<span>"+items[i].g_likecnt+"</span>";
				result += "</p>";
				result += "</div>"		
				result += "</div>"
				result += "<hr>"; 		
				result += "<p class='bottom-area d-flex'>";
				result += "<a href='#' class='add-to-cart'><span>Add to cart<i class='material-icons'>add_shopping_cart</i></span></a></p>";		
				result += "</div>"
				result += "</div>"
				result += "</div>";
			}
			
			$("#pr").append(result);

			return true;

		}else{
			alert("내용이 없습니다.")
			return false;
		}
		
		return false;
	}
	
	
	
	function delzzim(gl_uid){
	
			if(confirm("해당 찜을 삭제하시겠습니까?")){
				$.ajax({
					url : "${pageContext.request.contextPath}/mypageAjax/memberLikeDelete.ajax/"+gl_uid,
					type : "GET",
					cache : false,
					success : function(data){
						if(data != 0){
							alert("찜 삭제 완료");
							loadPage(1);
						}else{
							alert("찜 삭제 실패");
							loadPage(1);
						}
					}
				});
			}else{
				history.back();
			}		
	}

	</script>
	

	
	<script src="${pageContext.request.contextPath }/js/user/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery-migrate-3.0.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/aos.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/jquery.animateNumber.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/scrollax.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/user/main.js"></script>
	
   <input type="hidden" id="page"/>
  </body>
</html>
<jsp:include page="/common/footer" />