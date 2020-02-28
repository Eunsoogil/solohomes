<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var tbl = $("#cart_table");
    $(":checkbox:first", tbl).click(function(){
        if($(this).is(":checked")){
            $(":checkbox", tbl).attr("checked", "checked");
        }else {
          	$(":checkbox", tbl).removeAttr("checked");
        }
        $(":checkbox", tbl).trigger("change");
    });
});

$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

function CheckForm(Join){

	var chk = false;
	var arr_cruid = document.getElementsByName("cr_uid");
	
	for(var i = 0; i < arr_cruid.length; i++){
	    if(arr_cruid[i].checked == true) {
	        chk = true;
	        break;
	    }
	}
	
	if(!chk){
	    alert("상품을 한개 이상 선택해주세요.");
	    return false;
	}
}

function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else {
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
		alert("숫자만 입력 가능합니다");
		return false;
    }
}
 

</script>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.userUID}">
		<script>
			alert("로그인이 되어있지 않습니다");
			location.href = "${pageContext.request.contextPath}/member/login.do";
		</script>
	</c:when>
	<c:when test="${empty list || fn.length(list) == 0 }">
		<script>
			alert("장바구니가 비어있습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	<form action="cartconfirm.do" onSubmit="return CheckForm(this)" method="post">
	<input type="hidden" name="mb_uid" value="${sessionScope.userUID}"/>
		<table id="cart_table" class="table">
			<tr>
				<th><input type="checkbox"></th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>색상</th>
				<th>단가</th>
				<th>총가격</th>
				<th>배송비</th>
			</tr>
			<c:forEach items="${gilist }" var="gi" varStatus="status">
				<tr>
          			<td><input type="checkbox" name="cr_uid" value="${list[status.index].cr_uid }"></td>
					<td><img class="img" src="${pageContext.request.contextPath}/img/goods/${glist[status.index].g_img }"></td>
					<td>${glist[status.index].g_name }</td>
					<td><input type="text" name="${list[status.index].cr_uid }cr_amount" value="${list[status.index].cr_amount }" onkeyup='return onlyNumber(event)'/></td>
					<td>
						<select name="${list[status.index].cr_uid }in_color">
							<c:forEach items="${gi}" var="i">
								<c:choose>
									<c:when test="${i.in_color == colorselect[status.index] }">
									    <option value="${i.in_color }" selected="selected">${i.in_color }</option>
									</c:when>
									<c:otherwise>
									    <option value="${i.in_color }">${i.in_color }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
					<td>${glist[status.index].g_price }</td>
					<td>${glist[status.index].g_price * list[status.index].cr_amount }</td>
					<td>무료</td>
				</tr>
			</c:forEach>
		</table>
	    <input type="submit" value="구매서작성"/>
	    <input type="submit" value="선택항목 삭제" onclick="javascript: form.action='cartdelete.do';"/>
		</form>			
	</c:otherwise>
</c:choose>
<br>
</body>
</html>







