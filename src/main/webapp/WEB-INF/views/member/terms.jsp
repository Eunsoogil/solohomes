<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/menu" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>약관체크</title>
<!-- bootstrap css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu_2.css">
<!-- height 길이 조절 자바스크립트  -->
<script>
$(document).ready(function(){
	var menu = 90;
	var dHeight = $(document).height() - menu;
	
	$(document).resize(function() {
		dHeight = $(document).height() - menu;
	});
	
	$("#heightBox").css('min-height', dHeight);
});
</script>
</head>
<body>
<div id="heightBox">
<div id="loginBox">
<div id="terms">
	<p id="p1">약관 동의</p>
	<p id="p2">정보 입력</p>
	<p id="p3">가입 완료</p>
        <div id="policy">
		<h3>회원 약관 동의</h3>
                <textarea id="content" readonly="readonly" >1. 개인정보의 처리 목적 (‘HoloHomes.com’이하 ‘HoloHomes’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등


2. 개인정보의 처리 및 보유 기간

① (‘HoloHomes.com’이하 ‘HoloHomes’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.

② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.
고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년


3. 개인정보의 제3자 제공에 관한 사항

① ('HoloHomes.com'이하 'HoloHomes')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

4. 개인정보처리 위탁

① ('HoloHomes')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

② ('HoloHomes.com'이하 'HoloHomes')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.

① 정보주체는 HoloHomes(‘HoloHomes.com’이하 ‘HoloHomes') 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구


6. 처리하는 개인정보의 항목 작성

① ('HoloHomes.com'이하 'HoloHomes')은(는) 다음의 개인정보 항목을 처리하고 있습니다.

회원가입과 위치 기반 서비스
- 필수항목 : 이메일, 현재 위치


7. 개인정보의 파기('HoloHomes')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.

-파기절차
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.

-파기기한
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.


8. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항

①HoloHomes 은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.


9. 개인정보 보호책임자 작성


① HoloHomes(‘HoloHomes.com’이하 ‘HoloHomes') 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자
성명 :HoloHomes
직책 :HoloHomes
직급 :HoloHomes
연락처 :01010101010, HoloHomes.@HoloHomes.HoloHomes, 01010101010
※ 개인정보 보호 담당부서로 연결됩니다.

② 정보주체께서는 HoloHomes(‘HoloHomes.com’이하 ‘HoloHomes') 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. HoloHomes(‘HoloHomes.com’이하 ‘HoloHomes') 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.


10. 개인정보 처리방침 변경

①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.

11. 개인정보의 안전성 확보 조치 ('HoloHomes')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.

1. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

2. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

            </textarea>   
        </div>
<a href="login.do" id="tback">이전으로</a><br>
<a href="insertInfo.do" id="tpass">동의하기</a>
</div>
</div>
</div>
</body>
<link rel="stylesheet" type="text/css" href="../css/login/loginCss.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../css/login/js/login_1.js"></script>
</html>
<jsp:include page="/common/footer" />