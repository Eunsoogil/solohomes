<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.suggest{
	display: none;
	position: absolute;
	left: 10px;
	top: 40px;
}
</style>
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
	if(count > 0){
		keywordList = resultArray[1].split(",");
		var html = "";
		for (var i = 0; i < keywordList.length; i+=2) {
			if(1 <= parseInt(keywordList[i+1]) && parseInt(keywordList[i+1]) <= 10){
				html += "<a href='category.do?g_uid=" +
				keywordList[i+1] + "'>" +
				keywordList[i] + "/카테고리" + "</a><br>";				
			} else {
				html += "<a href='detail.do?g_uid=" +
				keywordList[i+1] + "'>" +
				keywordList[i] + "</a><br>";		
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
<form action="searchOk.do" name="myForm" method="POST">
<input type="text" id="userKeyword" name="userKeyword" onkeyup="sendKeyword();"/>
<input type="submit" value="검색"/>
<div id="suggestDiv" class="suggest">
	<div id="suggestListDiv"></div>
</div>
</form>
</body>
</html>