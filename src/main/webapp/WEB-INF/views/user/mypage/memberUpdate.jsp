<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>회원정보수정</title>
  </head>
  
  <script>
	function chkSubmit(){
		frm = document.forms["frm"];
		
		var mb_nn = frm["mb_nn"].value.trim();
		var mb_pw = frm["mb_pw"].value.trim();
		var mb_pwCheck = frm["mb_pwCheck"].value.trim();
		var mb_email = frm["mb_email"].value.trim();
		var mb_zipcode = frm["mb_zipcode"].value.trim();
		var mb_addr = frm["mb_addr"].value.trim();
		var mb_addr2 = frm["mb_addr2"].value.trim();
		var mb_phone = frm["mb_phone"].value.trim();
		
	    if (mb_nn == "") {
	        alert("닉네임을 입력해주세요");
	        frm["mb_nn"].focus();
	        return false;
	    }
	    
	    if (mb_pw == "") {
	        alert("비밀번호을 입력해주세요");
	        frm["mb_pw"].focus();
	        return false;
	    }
	    
	    if (mb_pwCheck == "") {
	        alert("비밀번호 확인을 입력해주세요");
	        frm["mb_pwCheck"].focus();
	        return false;
	    }
	    
	    if (mb_email == "") {
	        alert("이메일을 입력해주세요");
	        frm["mb_email"].focus();
	        return false;
	    }
	    
	    if (mb_zipcode == "") {
	        alert("우편번호를 입력해주세요");
	        frm["mb_zipcode"].focus();
	        return false;
	    }
	    
	    if (mb_addr == "") {
	        alert("주소를 입력해주세요");
	        frm["mb_addr"].focus();
	        return false;
	    }
	    
	    if (mb_addr2 == "") {
	        alert("상세 주소를 입력해주세요");
	        frm["mb_addr2"].focus();
	        return false;
	    }
	    
	    if (mb_phone == "") {
	        alert("연락처를 입력해주세요");
	        frm["mb_phone"].focus();
	        return false;
	    }
	    
	    if (mb_pw != pb_pwCheck) {
	        alert("비밀번호 확인이 일치하지 않습니다.");
	        frm["mb_pwCheck"].focus();
	        return false;
	    }
	    
	    // 비밀번호 정규표현식 체크
	    // 이메일 정규표현식 체크
	    // 연락처 정규표현식도 체크
	    
	    return true;
	} // end chkSubmit()
  </script>
  
  <body>


<form name="frm" action="${pageContext.request.contextPath }/user/mypage/memberUpdateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="mb_uid" value="${dto.mb_uid }"/>
닉네임:
<input type="text" name="mb_nn" value="${dto.mb_nn }"/><br>
비밀번호:
<input type="text" name="mb_pw"/><br>
비밀번호확인:
<input type="text" name="mb_pwCheck"/><br>
이메일:
<input type="text" name="mb_email" value="${dto.mb_email }"/><br>
주소:
<input type="text" id="sample6_postcode" value="${dto.mb_zipcode }" name="mb_zipcode" placeholder="우편번호" readonly="readonly"/>
<input class="addr-btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/></br>
<input class="addr" type="text" id="sample6_address" value="${dto.mb_addr }" name="mb_addr" placeholder="주소" readonly="readonly"/></br>
<input class="addr" type="text" id="sample6_detailAddress" value="${dto.mb_addr2 }" name="mb_addr2" placeholder="상세주소"/></br>
<input class="addr" type="text" id="sample6_extraAddress" style="display: none;" placeholder="상세주소"/></br>
연락처:
<input type="text" name="mb_phone" value="${dto.mb_phone }"/><br>
<br><br>
<input type="submit" value="수정"/>
</form>
 
 
 
 	<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress").focus();
						}
					}).open();
		}
	</script>
  </body>
</html>