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
	var color = $("#color option:selected").val();
	var buy = $("#quantity").val();
	var storage = document.getElementById(color).value;
}
</script>

<script>
function likeCnt(){
	$.ajax({
		url : "${pageContext.request.contextPath}/user/like/" + ${goods.g_uid},
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){

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
					<a href="http://placehold.it/300x300" class="image-popup">
						<img id="bigImg" src="http://placehold.it/300x300" class="img-fluid">
					</a>
					<ul class="subImgbox">
						<li class="subImg">
							<img src="http://placehold.it/300x300" onclick="doShow(this.src)">
						</li>
						<li class="subImg">
							<img src="http://placehold.it/200x200" onclick="doShow(this.src)">
						</li>
						<li class="subImg">
							<img src="http://placehold.it/100x100" onclick="doShow(this.src)">
						</li>
					</ul>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${goods.g_name }</h3>
					<p class="price">
						<span>${goods.g_price}원</span>						
					</p>
					<span class="like">
						<i class="ion-ios-heart"></i> ${goods.g_likecnt }
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
											<option value="${gInfo.in_color }">${gInfo.in_color }</option>
										</c:forEach>
									</select>
									<c:forEach var="gInfo" items="${gInfo }">
										<input type="hidden" id="${gInfo.in_color }" value="${gInfo.in_inv }">									
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
						<a onclick="likeCnt();" class="btn likeBtn"><i class="ion-ios-heart-empty"></i></a>
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
			$(".likeBtn").css('border-color','#f1b8c4');
		}
		
		else{
			$(".likeBtn > i").attr('class','ion-ios-heart-empty');
			$(".likeBtn").css('border-color','#eee');
		}
	});
});
</script>
</body>
</html>
<jsp:include page="/common/footer" />
</c:otherwise>
</c:choose>