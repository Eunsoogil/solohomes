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
<div id="sortdivt">
	<div id ="sortdiv" class="col-md-2 col-sm-4 col-xs-12 pull-right">
	    <select class="form-control pull-right row b-none" id="sortSelect">
	        <option value="0" selected>신상품</option>
	        <option value="1">가격순</option>
	        <option value="2">추천순</option>
	    </select>
	</div>
</div>
<br><br>
<div id="categorybody" class="container col-sm-10 col-md-offset-1">
<!--  OnClick="location.href='#' -->
	<c:choose>
	<c:when test="${empty gdto || fn.length(gdto) == 0 }">
		품목이 없습니다<br>
	</c:when>
	<c:otherwise>
		<c:forEach var="gdto" items="${gdto }">	
				<div id="unit" class="col-md-3 col-xs-12 row">
				<div id="unit2">
				
					<div id="imgdiv" class="col-md-12"  style="background-image:url(../img/goods/${gdto.g_img});"></div>
			<br><p id="name">${gdto.g_name }</p>
					<p id ="price">${gdto.g_price } 원</p>
					<p id="like">${gdto.g_likecnt }</p>
					<p id="likeicon"></p>
				 	
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
			result += "<div id='unit' class='col-md-3' OnClick='movePage(" + list[i].g_uid + ")'>";
			result += "<div id='imgdiv' style='background-image:url(../css/category/img/"+list[i].g_img +"); background-size : cover;'></div>";
			result += "<br><p id='name'>"+list[i].g_name +"</p>";
			result += "<p id ='price'>"+ list[i].g_price+" 원</p>";
			result += "<p id='like'>"+list[i].g_likecnt+"</p>";
			result += "<p id='likeicon'></p>";
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