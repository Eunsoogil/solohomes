<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="../css/user/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/user/animate.css">
<link rel="stylesheet" href="../css/user/owl.carousel.min.css">
<link rel="stylesheet" href="../css/user/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/user/magnific-popup.css">
<link rel="stylesheet" href="../css/user/aos.css">
<link rel="stylesheet" href="../css/user/ionicons.min.css">
<link rel="stylesheet" href="../css/user/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/user/jquery.timepicker.css">
<link rel="stylesheet" href="../css/user/flaticon.css">
<link rel="stylesheet" href="../css/user/icomoon.css">
<link rel="stylesheet" href="../css/user/style.css">

<script>
function doShow(imgSrc) {
	document.getElementById("bigImg").src = imgSrc;
}
</script>
</head>
<body>
	<section class="ftco-section bg-light">
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
					<h3>가구이름</h3>
					<p class="price">
						<span>200000원</span>
					</p>
					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="" id="" class="form-control">
										<option value="">Small</option>
										<option value="">Medium</option>
										<option value="">Large</option>
										<option value="">Extra Large</option>
									</select>
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
							</span> <input type="text" id="quantity" name="quantity"
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
						<a href="cart.html" class="btn btn-primary py-3 px-5">Add to
							Cart</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

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
});
</script>
</body>
</html>
<jsp:include page="/common/footer" />