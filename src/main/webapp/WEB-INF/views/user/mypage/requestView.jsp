<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>
	<thead>
		<th>rq_uid</th>
		<th>문의분류</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
	</thead>
	<tbody>
		<tr>
			<td>${dto.rq_uid}</td>
			<td>${dto.rq_type}</td>
			<td>${dto.rq_subject}</td>
			<td>${dto.rq_content}</td>
			<td>${dto.rq_regdate}</td>
		</tr>				
	</tbody>
</table>



<table>
	<thead>
		<th>문의답변</th>
	</thead>
	<tbody>
		<tr>
			<td>${dto.rq_response}</td>
		</tr>				
	</tbody>
</table>





</body>
</html>