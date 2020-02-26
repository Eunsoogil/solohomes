<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HoloHomes</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function sendKeyword(){
	var userKeyword = document.getElementById("userKeyword").value;
	if(userKeyword == ""){
		hide();
		return;
	}
	var params = "userKeyword=" + userKeyword;
	$.ajax({
		url : "${pageContext.request.contextPath}/searchAJAX/searchOk.ajax?" + params,		
		type : "GET",
		cache : false,
		success : function(data, status) {
			if(status == "success"){
				displaySuggest(data);
			}
		}
	});
}

function displaySuggest(data){
	var resultText = data;
	var resultArray = resultText.split("|");
	var count = parseInt(resultArray[0]);
	var keywordList = null;
	var start = document.getElementById("userKeyword").value;
	if(count > 0){
		keywordList = resultArray[1].split(",");
		var html = "";
		for (var i = 0; i < keywordList.length; i+=2) {
			if(keywordList[i] == ""){
				break;
			}
			if(1 <= parseInt(keywordList[i+1]) && parseInt(keywordList[i+1]) <= 10){
				html += "<a style='text-decoration: none' href='category.do?g_uid=" +
				keywordList[i+1] + "'>" +
				"<span style='color:#A91F24'><b>" + start + "</b></span>" + 
				"<span style='color:grey'><b>" + keywordList[i].substring(start.length, keywordList[i].length) + 
				"/카테고리" + "</b></span>" + "</a><br>";				
			} else {
				html += "<a style='text-decoration: none' href='detail.do?g_uid=" +
				keywordList[i+1] + "'>" +
				"<span style='color:#A91F24'><b>" + start + "</b></span>" + 
				"<span style='color:grey'><b>" + keywordList[i].substring(start.length, keywordList[i].length) + 
				"</b></span>" + "</a><br>";	
			}
		}
		var suggestListDiv = document.getElementById("suggestListDiv");
		suggestListDiv.innerHTML = html;
		show();
	} else {
		hide();
	}
}


function select(selectKeyword){
	document.myFrom.userKeyword.value = selectKeyword;
	hide();
}

function show(){
	var suggetDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display = "block";
}

function hide(){
	var suggetDiv = document.getElementById("suggestDiv");
	suggestDiv.style.display = "none";
}
	
</script>
</head>
<body>
	<header class="header">
		<div class="container">
			<div class="pc">
				<a id="menuBtn"><i class="fas fa-bars"></i></a>
				<a id="brand" href="${pageContext.request.contextPath}/user/main.do">
					<img src="${pageContext.request.contextPath}/img/logo.png">
				</a>
			</div>
			<div class="pc mo_none">
				<form action="${pageContext.request.contextPath}/user/searchOk.do" name="myForm" method="POST" autocomplete="off">
					<input type="text" class="searchTxt" id="userKeyword" name="userKeyword" onkeyup="sendKeyword();" autocomplete="off"/>
					<button type="submit" class="searchBtn"><i class="fas fa-search"></i></button>
					<div id="suggestDiv" class="suggest">
						<div id="suggestListDiv"></div>
					</div>
				</form>
			</div>
			<div class="pc mo_none">
				<a id="login" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
			</div>
		</div>
	</header>

	<ul class="mo_menu">
		<li><a class="f">가구 <i class="fas fa-sort-down"></i></a></li>
		<ul class="f_sub">
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=5">거실장</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=3">서랍장</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=4">쇼파</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=6">옷장</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=8">의자</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=9">책상</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=10">책장</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=1">침대</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=7">테이블</a></li>
			<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=2">화장대</a></li>
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
		<li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
		<li><a href="#">검색</a></li>
	</ul>

	<div class="menu" id="myModal">
		<div class="modal-content">
			<ul class="right">
				<h3>가구</h3>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=5">거실장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=3">서랍장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=4">쇼파</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=6">옷장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=8">의자</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=9">책상</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=10">책장</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=1">침대</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=7">테이블</a></li>
				<li><a href="${pageContext.request.contextPath}/category/category.do?g_type=2">화장대</a></li>
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
	<script src="${pageContext.request.contextPath}/js/menu.js" type="text/javascript"></script>

</body>
</html>