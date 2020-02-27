<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int mb_uid = 2;
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <script>
	function chkSubmit(){
		frm = document.forms["frm"];
		
		var mb_pw = frm["mb_pw"].value.trim();
	    if (mb_pw == "") {
	        alert("비밀번호를 입력해주세요");
	        frm["mb_pw"].focus();
	        return false;
	    }
	    
	    return true;
	} // end chkSubmit()
  </script>

<body>

<form name="frm" action="${pageContext.request.contextPath }/user/mypage/memberCheckOk.do" method="post" onsubmit="return chkSubmit()">
	<input type="hidden" name="mb_uid" value="<%=mb_uid%>"/> 
	비밀번호 확인 :
	<input type="text" id="mb_pw" name="mb_pw"/>
	<input type="submit" value="확인" />
</form>


</body>
</html>