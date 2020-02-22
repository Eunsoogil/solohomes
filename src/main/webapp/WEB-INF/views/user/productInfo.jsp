<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
<c:when test="${empty dto }">
	<script>
		alert("해당 상품은 품절처리되었거나 삭제된 상품입니다.");
		history.back();
	</script>
</c:when>
<c:otherwise>

<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="images/menu-2.jpg" class="image-popup"><img
						src="images/product-1.jpg" class="img-fluid"
						alt="Colorlib Template"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>Young Woman Wearing Dress</h3>
					<p class="price">
						<span>$120.00</span>
					</p>
					<p>A small river named Duden flows by their place and supplies
						it with the necessary regelialia. It is a paradisematic country,
						in which roasted parts of sentences fly into your mouth.</p>
					<p>On her way she met a copy. The copy warned the Little Blind
						Text, that where it came from it would have been rewritten a
						thousand times and everything that was left from its origin would
						be the word "and" and the Little Blind Text should turn around and
						return to its own, safe country. But nothing the copy said could
						convince her and so it didn’t take long until a few insidious Copy
						Writers ambushed her, made her drunk with Longe and Parole and
						dragged her into their agency, where they abused her for their.</p>
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
</body>
</html>
<jsp:include page="/common/footer" />

</c:otherwise>
</c:choose>