<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty goods}">
		<script>
			alert("품절처리되거나 삭제된 가구입니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

<!-- html 시작 -->	
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/imagebox.css">

<script>
function doShow(imgSrc) {
	document.getElementById("bigImg").src = imgSrc;
}

function goCart() {	
	var in_uid = parseInt($("#color option:selected").val());
	var cr_amount = parseInt($("#quantity").val());
	var storage = parseInt(document.getElementById(in_uid).value);
	
	if(confirm("해당 상품을 장바구니에 넣으시겠습니까?")){
		if(cr_amount > storage){
			alert("해당 색상의 재고수량은 " + storage + "개 입니다.\n구매수량을 재고수량보다 작게 선택해주세요.");
		} else{
			location.href="/cartInsert.do/3"+in_uid+"/"+cr_amount;
		}
	}	
}
</script>

<!------ AJAX 자바스크립트 ------>
<script>
var mb_uid = 3;
function likeUp(){
	var url = "${pageContext.request.contextPath}/user/likeup/" + ${goods.g_uid} + "/" + mb_uid;
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var likeCnt = parseInt($('#likeCnt').val());
				alert("좋아요 상품으로 등록되었습니다.");
				$('#likeCnt').val(likeCnt + 1);					
			}
		}		
	});
}

function likeDown(){
	var url = "${pageContext.request.contextPath}/user/likedown/" + ${goods.g_uid} + "/" + mb_uid;
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var likeCnt = parseInt($('#likeCnt').val());
				alert("좋아요 취소되었습니다.");
				$('#likeCnt').val(likeCnt - 1);	
				
			}
		}		
	});
}

</script>
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="${pageContext.request.contextPath}/img/goods/${goods.g_img}" class="image-popup">
						<img id="bigImg" src="${pageContext.request.contextPath}/img/goods/${goods.g_img}" class="img-fluid">
					</a>
					<ul class="subImgbox">
						<li class="subImg">
							<img src="${pageContext.request.contextPath}/img/goods/${goods.g_img}" onclick="doShow(this.src)">
						</li>
					<c:forEach var="gInfo" items="${gInfo }">
						<li class="subImg">
							<img src="${pageContext.request.contextPath}/img/goods/${gInfo.in_img }" onclick="doShow(this.src)">
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${goods.g_name }</h3>
					<p class="price">
						<span>${goods.g_price}원</span>						
					</p>
					<span class="like">
						<i class="ion-ios-heart"></i>
						<input id="likeCnt" type="text" value="${goods.g_likecnt }" disabled>
					</span>
					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="color" id="color" class="form-control">
										<c:forEach var="gInfo" items="${gInfo }">
											<option value="${gInfo.in_uid }">${gInfo.in_color }</option>
										</c:forEach>
									</select>
									<c:forEach var="gInfo" items="${gInfo }">
										<input type="hidden" id="${gInfo.in_uid }" value="${gInfo.in_inv }">									
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span>
							<input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
						</div>
					</div>
					<p>
						<a onclick="goCart();" class="btn btn-primary py-3 px-5">장바구니</a>
						<c:choose>
							<c:when test="${empty likeYN}">
								<a class="btn likeBtn"><i class="ion-ios-heart-empty"></i></a>
							</c:when>
							<c:otherwise>
								<a class="btn likeBtn pink"><i class="ion-ios-heart"></i></a>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</section>	
	
<script src="${pageContext.request.contextPath}/js/user/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/aos.js"></script>
<script src="${pageContext.request.contextPath}/js/user/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/user/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user/main.js"></script>

<script>
$(document).ready(function(){
	var quantitiy=0;
	$('.quantity-right-plus').click(function(e){
		// Stop acting like a button
		e.preventDefault();
		// Get the field name
		var quantity = parseInt($('#quantity').val());
		// If is not undefined
		
		$('#quantity').val(quantity + 1);		
		// Increment
		});
	
	$('.quantity-left-minus').click(function(e){
		e.preventDefault();
		var quantity = parseInt($('#quantity').val());
		if(quantity>0){
			$('#quantity').val(quantity - 1);
		}
	});		    
	
	$(".likeBtn").click(function() {
		var className = $(".likeBtn > i").attr('class');
					
		if(className == "ion-ios-heart-empty"){
			$(".likeBtn > i").attr('class','ion-ios-heart');
			$(".likeBtn").addClass('pink');
			likeUp();
		}
		
		else{
			$(".likeBtn > i").attr('class','ion-ios-heart-empty');
			$(".likeBtn").removeClass('pink');
			likeDown();
		}
	});
});
</script>
</body>
</html>
<jsp:include page="/common/footer" />
</c:otherwise>
</c:choose>