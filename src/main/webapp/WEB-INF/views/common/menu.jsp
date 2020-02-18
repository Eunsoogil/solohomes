<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HoloHomes</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="../css/menu.css">

</head>
<body>
	<header class="header">
		<div class="container">
			<div class="pc">
				<a id="menuBtn"><i class="fas fa-bars"></i></a>
				<a id="brand" href="main.do"><img src="../img/logo.png"></a>
			</div>
			<div class="pc mo_none">
				<form>
					<input type="text" class="searchTxt">
					<button type="submit" class="searchBtn"><i class="fas fa-search"></i></button>
				</form>
			</div>
			<div class="pc mo_none"><a id="login" href="#">로그인</a></div>
		</div>
	</header>

	<ul class="mo_menu">
		<li><a class="f">가구 <i class="fas fa-sort-down"></i></a></li>
		<ul class="f_sub">
			<li><a href="#">서랍장</a></li>
			<li><a href="#">옷장</a></li>
			<li><a href="#">의자</a></li>
			<li><a href="#">책상</a></li>
			<li><a href="#">책장</a></li>
			<li><a href="#">침대</a></li>
			<li><a href="#">테이블</a></li>
			<li><a href="#">화장대</a></li>
		</ul>
		<li><a href="#">시리즈</a></li>
		<li><a class="mypage">마이페이지 <i class="fas fa-sort-down"></i></a></li>
		<ul class="my_sub">
			<li><a href="#">장바구니</a></li>
			<li><a href="#">구매목록</a></li>
			<li><a href="#">좋아요한 상품</a></li>
			<li><a href="#">1:1문의</a></li>
			<li><a href="#">회원정보수정</a></li>
		</ul>
		<li><a href="#">로그인</a></li>
	</ul>

	<div class="menu" id="myModal">
		<div class="modal-content">
			<ul class="right">
				<h3>가구</h3>
				<li><a href="#">서랍장</a></li>
				<li><a href="#">옷장</a></li>
				<li><a href="#">의자</a></li>
				<li><a href="#">책상</a></li>
				<li><a href="#">책장</a></li>
				<li><a href="#">침대</a></li>
				<li><a href="#">테이블</a></li>
				<li><a href="#">화장대</a></li>
			</ul>
			<ul>
				<h3>시리즈</h3>
				<li><a href="#">시리즈</a></li>
			</ul>
			<ul class="left">
				<h3>마이페이지</h3>
				<li><a href="#">장바구니</a></li>
				<li><a href="#">구매목록</a></li>
				<li><a href="#">좋아요한 상품</a></li>
				<li><a href="#">1:1문의</a></li>
				<li><a href="#">회원정보수정</a></li>
			</ul>
			<span class="close"><i class="fas fa-times"></i></span>
		</div>
	</div>


	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/menu.js" type="text/javascript"></script>

</body>
</html>