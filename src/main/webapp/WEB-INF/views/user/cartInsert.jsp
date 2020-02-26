<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${cart == 0 }">
	<script>
		alert("장바구니 등록에 실패하였습니다.");
		history.back();
	</script>
</c:if>
<c:if test="${cart > 0 }">
	<script>
		alert("장바구니에 상품이 등록되었습니다.");
		if(confirm("장바구니로 이동하시겠습니까?")){
			location.href = "";
		} else{
			history.back();
		}
	</script>			
</c:if>