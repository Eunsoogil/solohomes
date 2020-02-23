<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script>
// form 검증
function ckSubmit(){
	frm = document.forms["form1"];
	var id = frm["id"].value.trim();
	var pw = frm["pw"].value.trim();
	
	if(id == ""){
		alert("ID를 입력해 주세요");
		frm["id"].focus();
		return false;
	}
	if(pw == ""){
		alert("비밀번호를 입력해 주세요");
		frm["pw"].focus();
		return false;
	}
	return true;
}
</script>
<body>

<div id="login11">
	
	<form name="form1" action="loginOk.do" method="POST" onsubmit="return ckSubmit()">
		<input type="text" id="id" name="id" placeholder="아이디" required="required"><br>
        <input type="password" id="pw" name="pw" placeholder="비밀번호" required="required"><br>
        <input type="submit" id="submit_button" value="로그인">
	</form>
	<a href="findId.do" id="find">ID / PW 찾기</a>
	<br>
	<a href="terms.do" id="pass">회원가입</a>
	
</div>
<hr>



</body>
<jsp:include page="/common/footer" />
<link rel="stylesheet" type="text/css" href="../css/login/loginCss.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/login/js/login_1.js"></script>
</html>
