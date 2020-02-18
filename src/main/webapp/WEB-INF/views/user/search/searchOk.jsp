<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${g_uid == 0 }">
	<script>
		alert("없는 상품입니다. 검색어를 확인해주세요");
		history.back();
	</script>
</c:if>
<c:if test="${g_uid >= 1 && g_uid <= 10}">
	<script>
		location.href = "category.do?g_uid=${g_uid}";
	</script>			
</c:if>
<c:if test="${g_uid > 10}">
	<script>
		location.href = "detail.do?g_uid=${g_uid}";
	</script>			
</c:if>