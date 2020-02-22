<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 1}">
	<script>
		alert("입력이 잘못 되었습니다. 다시 입력해 주세요!");
		history.back();
	</script>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이메일 보내기</title>
</head>
<body>

</body>
</html>