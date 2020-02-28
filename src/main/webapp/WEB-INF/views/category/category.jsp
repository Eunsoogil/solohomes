<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>
<h1 class="text-center"> ${typeName } </h1>	

<hr>
<div id="sortdivt" class="col-md-10 col-md-offset-1">
	<div id ="sortdiv" class="col-md-2 col-xs-12 pull-right">
	    <select class="form-control" id="sortSelect">
	        <option value="0" selected>신상품</option>
	        <option value="1">가격순</option>
	        <option value="2">추천순</option>
	    </select>
	</div>
</div>
<br><br>
<div id="categorybody" class="container col-md-10 col-md-offset-1">
	<c:choose>
	<c:when test="${empty gdto || fn.length(gdto) == 0 }">
		품목이 없습니다<br>
	</c:when>
	<c:otherwise>
		<c:forEach var="gdto" items="${gdto }">	
			<div id="mom" class="col-md-3 col-xs-10 col-md-offset-0 col-xs-offset-1">
				<div id=mom2 onclick="location.href = '${pageContext.request.contextPath}/user/productInfo.do/${gdto.g_uid}/4'">
					<div id="imgbox"><img src="../img/goods/${gdto.g_img}"></div>
					<div id="goodsName">${gdto.g_name }</div>
					<div id="goodsPrice">${gdto.g_price } 원</div>
					<div id="goodsLikeIcon"></div>
					<div id="goodsLike">${gdto.g_likecnt }</div>
				</div>
			</div>
			</c:forEach>
	</c:otherwise>
</c:choose>
</div>

</body>
<link rel="stylesheet" type="text/css" href="../css/category/category.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/category/js/category.js"></script>
<script>
$(document).ready(function(){
	
	$("select#sortSelect").change(function(){
		var sortType = parseInt($("select#sortSelect").val());
		
		$.ajax({
			url: "${pageContext.request.contextPath}/Cajax/typeCheck.do/" +sortType + "/" + ${g_type},
			type: "GET",
			cache : false,
			success: function(data, status){
				if(status == "success"){
					upDateList(data);
				}
			}
		});
	
	});
	
});

function upDateList(jsonObj){
	var result = "";
	var count = jsonObj.count;
	var list = jsonObj.list;
	var status = jsonObj.status;
	
	if(status == "success"){
		for(var i = 0; i < count; i++){
			result += "<div id='mom' class='col-md-3 col-xs-10 col-md-offset-0 col-xs-offset-1'>";
			result += "<div id=mom2 onclick='location.href = '#''>";
			result += "<div id='imgbox'><img src='../img/goods/"+list[i].g_img+"'></div>";
			result += "<div id='goodsName'>"+list[i].g_name+"</div>";
			result += "<div id='goodsPrice'>"+list[i].g_price+" 원</div>";
			result += "<div id='goodsLikeIcon'></div>";
			result += "<div id='goodsLike'>"+list[i].g_likecnt+"</div>";
			result += "</div>";
			result += "</div>";
		}
		
	} else {
		result = "정렬 실패";
	}
	
	$("div#categorybody").html("");
	$("div#categorybody").html(result);
}

function movePage(uid) {
	location.href = "#?uid=" + uid;
}
</script>
</html>
