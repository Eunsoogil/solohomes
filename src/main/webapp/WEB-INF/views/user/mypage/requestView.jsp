<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
    
 <%!
	int mb_uid = 2;
%>      
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
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
   
   
    <!-- 표 -->
    <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/main.css">
	<!--===============================================================================================-->

	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/user/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user/mypage/css/mypage.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 대문 -->
	<div class="hero-wrap hero-bread">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">1:1 문의</h1>
					<p class="breadcrumbs">
						<span class="mr-2">
							<a href="${pageContext.request.contextPath}/user/requestlist.do">문의목록 가기</a>
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>



	<!-- 문의목록 테이블 -->
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div>
						<table>
						
							<tr class="row100 head">
								<th class="cell100 column11">문의제목</th>
								<td class="cell100 column12">${dto.rq_subject}</td>
							</tr>

							<tr class="row100 head">
								<th class="cell100 column11">문의내용</th>
								<td class="cell100 column12">${dto.rq_content}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




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
	
	<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/js/popper.js"></script>
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script>
			$('.js-pscroll').each(function(){
				var ps = new PerfectScrollbar(this);
	
				$(window).on('resize', function(){
					ps.update();
				})
			});	
		</script>
	<!--===============================================================================================-->
		<script src="${pageContext.request.contextPath }/css/user/mypage/js/main.js"></script>

</body>
</html>
<jsp:include page="/common/footer" />