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
<body>
<c:forEach var="series" items="${series }">
	<div onclick="location.href = '${pageContext.request.contextPath}/series/detail.do?sr_uid=${series.sr_uid }'">                   
		<div class="text-center"> ${series.sr_subject }</div>
		<img src="../img/goods/${series.sr_img}">
	</div>
</c:forEach>
</body>
</html>

