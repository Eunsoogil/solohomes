<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주문서작성</title>
<style>
.table {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.table th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
}
.table th, .table td {
  padding: 10px;
  border: 1px solid #ddd;
}
.table th:first-child, .table td:first-child {
  border-left: 0;
}
.table th:last-child, .table td:last-child {
  border-right: 0;
}
.table tr td:first-child {
  text-align: center;
}
.img {
	width : 80%;
	height : auto;
	display: block;
	margin: 0px auto;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function chkSubmit(){
	frm = document.forms["form"];
	
	var zipcode = frm["zipcode"].value.trim();
	var addr = frm["addr"].value.trim();
	var addr2 = frm["addr2"].value.trim();
	
	if(zipcode == ""){
		alert("우편번호는 반드시 입력해야 합니다");
		frm["zipcode"].focus();
		return false;
	}
	if(addr == ""){
		alert("주소는 반드시 작성해야 합니다");
		frm["addr"].focus();
		return false;
	}
	if(addr2 == ""){
		alert("상세주소는 반드시 작성해야 합니다");
		frm["addr2"].focus();
		return false;
	}
	
	return true;
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
$(document).ready(function() { 
	$("#sameasmine").on('click', function() { 
		if ( $(this).prop('checked') ) {
			$("[name='zipcode']").val("${member.mb_zipcode}");
			$("[name='addr']").val("${member.mb_addr}");
			$("[name='addr2']").val("${member.mb_addr2}");
		} else { 
			$("[name='zipcode']").val("");
			$("[name='addr']").val("");
			$("[name='addr2']").val("");
		} 
	}); 
});

</script>
</head>
<body>
<table class="table">
	<tr>
		<th>대표이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>색상</th>
		<th>단가</th>
		<th>총가격</th>
		<th>배송비</th>
	</tr>
	<c:forEach items="${list }" varStatus="status">
		<tr>
			<td><img class="img" src="${pageContext.request.contextPath}/img/goods/${glist[status.index].g_img }"></td>
			<td>${glist[status.index].g_name }</td>
			<td>${list[status.index].cr_amount }</td>
			<td>${in_color[status.index] }</td>
			<td>${glist[status.index].g_price }</td>
			<td class="costlist">${glist[status.index].g_price * list[status.index].cr_amount }</td>
			<td>무료</td>
		</tr>
	</c:forEach>
</table>

<div class="row justify-content-end" onload="totalCost()">
	<div class="col cart-wrap ftco-animate">
		<div class="cart-total mb-2">
			<h3>총 구매 상품</h3>
			<p class="d-flex">
				<span>가격</span> 
				<span id="cost">$0.00</span>
			</p>
			<p class="d-flex">
				<span>배송비</span> 
				<span>무료</span>
			</p>
			<hr>
			<p class="d-flex total-price">
				<span>최종 가격</span> 
				<span id="totalcost">$0.00</span>
			</p>
		</div>
		<p class="text-center">
			<input type="submit" class="selectBtn" value="선택상품 구매하기"/>
		</p>
	</div>
</div>


<input type="checkbox" id="sameasmine"><span>회원정보와 동일</span>

<form name="form" method="post" action="cartconfirmOk.do" onsubmit="return chkSubmit()">
	<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
	<c:forEach items="${list }" varStatus="status">
		<input type="hidden" name="cr_amount" value="${list[status.index].cr_amount }">
		<input type="hidden" name="in_uid" value="${list[status.index].in_uid }">
	</c:forEach>
	<input type="text" name="zipcode" id="sample6_postcode" placeholder="우편번호">
	<input type="button" id="zipbt" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" name="addr" id="sample6_address" placeholder="주소"><br>
	<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소"><br>
	<input type="submit" value="작성완료"/>
</form>
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br>
<br>

<script type="text/javascript">

function totalCost(){
	var costlist = document.getElementsByClassName('costlist');
	var cost = 0;
	var i = 0;
	for (i = 0; i < costlist.length; i++) {
		cost += parseInt(costlist.item(i).innerHTML);
	}
	cost = numberWithCommas(cost);
	$('#cost').html(cost + "원");
	$('#totalcost').html(cost + "원");
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.getElementById("cost").onload = totalCost();
</script>
</body>
</html>







