<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>시리즈</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>
<c:forEach var="series" items="${series }">
<h1 class="text-center"> ${series.sr_subject }</h1>
<hr>
<br><br>
<img src="../img/goods/${series.sr_img}">
<div id="categorybody" class="container col-md-10 col-md-offset-1">
	<c:forEach var="dto" items="${dto }">	
		<c:if test="${series.sr_uid == dto.sr_uid}">
			<div id="mom" class="col-md-3 col-xs-10 col-md-offset-0 col-xs-offset-1">
				<div id=mom2 onclick="location.href = '#'">
					<div id="imgbox"><img src="../img/goods/${dto.g_img}"></div>
					<div id="goodsName">${dto.g_name }</div>
					<div id="goodsPrice">${dto.g_price } 원</div>
					<div id="goodsLikeIcon"></div>
					<div id="goodsLike">${dto.g_likecnt }</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</c:forEach>
</body>
<link rel="stylesheet" type="text/css" href="../css/category/category.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/category/js/category.js"></script>
</html>

