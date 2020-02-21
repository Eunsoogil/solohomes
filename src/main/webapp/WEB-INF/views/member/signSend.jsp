<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == -1 }">
	<script>
		alert("정상적인 접근이 아닙니다");
		location.href = "login.do";
	</script>
</c:if>
<c:if test="${result == -2 }">
	<script>
		alert("이미 인증된 회원입니다. 로그인해 주세요");
		location.href = "login.do";
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script>
		alert("인증 메일 발송이 실패하였습니다. 다시 작성해주세요");
		history.back();
	</script>
</c:if>
<c:if test="${result == 0 }">

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이메일 사인 잘 보네짐</title>
</head>
<body>
<div id="sendPage">
	<p id="p1">약관 동의</p>
	<p id="p2">정보 입력</p>
	<p id="p3">가입 완료</p>
		<h2>메일 인증</h2>
	<div id="sendtext">
		<p id="p4">&nbsp&nbsp고객님의 메일함으로</p>
		<p id="p5">인증 메일을 보넸습니다</p>
		<p id="p6">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp확인해주세요</p>
	</div>


</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/login/loginCss.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/login/js/login_1.js"></script>
</html>

</c:if>