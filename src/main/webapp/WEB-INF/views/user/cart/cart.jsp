<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<jsp:include page="/common/menu" />
<html lang="ko">
<head>
<title>장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var tbl = $("#cart_table");
    $(":checkbox:first", tbl).click(function(){
        if($(this).is(":checked")){
            $(":checkbox", tbl).attr("checked", "checked");
        }else {
          	$(":checkbox", tbl).removeAttr("checked");
        }
        $(":checkbox", tbl).trigger("change");
    });
});

$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

function CheckForm(Join){
	var chk = false;
	var arr_cruid = document.getElementsByName("cr_uid");
	
	for(var i = 0; i < arr_cruid.length; i++){
	    if(arr_cruid[i].checked == true) {
	        chk = true;
	        break;
	    }
	}
	
	if(!chk){
	    alert("상품을 한개 이상 선택해주세요.");
	    return false;
	}
}

function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else {
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
		alert("숫자만 입력 가능합니다");
		return false;
    }
}
</script>
</head>
<body>
	<c:choose>
	<c:when test="${empty sessionScope.userUID}">
		<script>
			alert("로그인이 되어있지 않습니다");
			location.href = "${pageContext.request.contextPath}/member/login.do";
		</script>
	</c:when>
	<c:when test="${empty list || fn.length(list) == 0 }">
		<script>
			alert("장바구니가 비어있습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

	<form action="cartconfirm.do" onSubmit="return CheckForm(this)" method="post" 
		class="ftco-section ftco-cart">
		<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
		<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
			<div class="cart-list">
				<table class="table" id="cart_table">
					<thead class="thead-primary">
						<tr class="text-center">
							<th><input type="checkbox"></th>
							<th>&nbsp;</th>
							<th>상품명</th>
							<th>색상</th>
							<th>단가</th>
							<th>수량</th>
							<th>총 가격</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${gilist }" var="gi" varStatus="status">
					<tr class="text-center">
	          			<td><input type="checkbox" name="cr_uid" value="${list[status.index].cr_uid }"></td>
						<td class="image-prod"><div class="img">
							<img class="img" src="${pageContext.request.contextPath}/img/goods/${glist[status.index].g_img }">
						</div></td>
						<td class="product-name">${glist[status.index].g_name }</td>						
						<td>
						<select name="${list[status.index].cr_uid }in_color">
							<c:forEach items="${gi}" var="i">
								<c:choose>
									<c:when test="${i.in_color == colorselect[status.index] }">
									    <option value="${i.in_color }" selected="selected">${i.in_color }</option>
									</c:when>
									<c:otherwise>
									    <option value="${i.in_color }">${i.in_color }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<td class="price">${glist[status.index].g_price }</td>
						<td class="quantity">
							<div class="quantityBox">
							<span class="input-group-btn mr-2 cart_btn">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span>
							<input type="text" id="quantity" name="quantity" class="cart_input form-control input-number" 
								value="${list[status.index].cr_amount }" onkeyup='return onlyNumber(event)'>
							<span class="input-group-btn ml-2 cart_btn">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
							</div>						
						</td>							
						<td class="total">${glist[status.index].g_price * list[status.index].cr_amount }</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		<p>
		<!-- -----------------------변경하기 온클릭 걸기----------------------------- -->
			<input type="submit" class="selectBtn selectBtn2 mr-3" value="선택상품 변경하기" onclick=""/>
			<input type="submit" class="selectBtn selectBtn2" value="선택상품 삭제하기" onclick="javascript: form.action='cartdelete.do';"/>
		</p>
		
		<!-- 총 결산 부분 화면  -->
		<div class="row justify-content-end">
			<div class="col cart-wrap ftco-animate">
				<div class="cart-total mb-2">
					<h3>총 구매 상품</h3>
					<p class="d-flex">
		<!---------------------------- 달러표시된 곳 수정해주세요(총 3곳) ---------------------->
						<span>가격</span> 
						<span>$0.00</span>
					</p>
					<p class="d-flex">
						<span>배송비</span> 
						<span>$0.00</span>
					</p>
					<hr>
					<p class="d-flex total-price">
						<span>최종 가격</span> 
						<span>$0.00</span>
					</p>
				</div>
				<p class="text-center">
					<input type="submit" class="selectBtn" value="선택상품 구매하기"/>
				</p>
			</div>
		</div>
	</div>
	</form>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#A91F24" /></svg>
	</div>


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
		e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        $('#quantity').val(quantity + 1);
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
</c:otherwise>
</c:choose>
</body>
</html>
<jsp:include page="/common/footer" />