<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%!
	int writePages = 5;
%>
<%!
	int mb_uid = 2;
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</head>


<script>
// TODO
$(document).ready(function(){
	
	$("input#page").val(1); // 페이지 최초 로딩되면 1페이지로
	
	//TODO : n Page 읽어오기
	loadPage(1);
	
	//[이전] 버튼 눌렀을때
	$("button#prev").click(function(){
		// 현재 페이지 정보
		var curPage = parseInt($("input#page").val())
		// 첫페이지였다면
		if(curPage == 1){
			alert("이전 페이지가 없습니다");
			return;
		}
		// 첫페이지 아니라면 이전페이지 로딩
		loadPage(curPage-1);
	});
	
	//[다음] 버튼 눌렀을때 
	$("button#next").click(function(){
		var curPage = parseInt($("input#page").val())
		
		loadPage(curPage+1);
 
	});
	
});
	


function loadPage(page){


	var urlText = "${pageContext.request.contextPath}/mypageAjax/memberRequestList.ajax/<%= mb_uid%>/<%= writePages%>/" + page;
	
	
	$.ajax({
		url : urlText,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				if(updateList(data)){
				   // 페이지 로딩 성공하면 현재 페이지 정보 업데이트
				   $("input#page").val(page);
				}
			}
		}
	});
} 
 


// TODO
function updateList(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
		
		var count = jsonObj.count; // 글 개수
		var items = jsonObj.list; // 글 목록
		
		var i;
		for(i = 0; i < count; i++){
			result += "<tr>\n";
			result += "<td>" + (i+1) +"</td>\n";
			
			var rq_type = items[i].rq_type;
			var rq_type_str;
			
			switch(rq_type){
			case 1: 
				rq_type_str = "배송문의";
				break;
			case 2:
				rq_type_str = "상품문의";
				break;
			case 3:
				rq_type_str = "결제문의";
				break;
			case 4:
				rq_type_str = "환불문의";
				break;
			case 5:
				rq_type_str = "기타문의";
				break;
				
			}
				
			result += "<td>" + rq_type_str +"</td>\n";
			
			var url = "${pageContext.request.contextPath}/user/mypage/requestView.do/"+ items[i].rq_uid;
			
			result += "<td><a href="+ url +">" + items[i].rq_subject +"</a></td>\n";

			// Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현
			var regDate = new Date(items[i].rq_regdate);
			var strDate = regDate.getFullYear() + "-" +
						(regDate.getMonth() + 1) + "-" + 
						regDate.getDate();
			result += "<td>" +strDate + "</td>\n";
			
			var response = items[i].py_response;
			if($.trim(response).length > 0){
				result += "<td>답변 완료</td>\n";
			}else{
				result += "<td>N</td>\n";
			}
		
			result += "</tr>\n";
		}
		
		$("table#list tbody").html(result); // 테이블 내용 업데이트
		
		return true;
		
	}else{
		alert("내용이 없습니다.")
		return false;
	}
	
	return false;
}

</script>		
<body>
<input type="hidden" id="page"/>
		
		<p><%= mb_uid %></p>
		
		<table id="list">
			<thead>
				<th>no.</th>
				<th>문의분류</th>
				<th>문의제목</th>
				<th>작성시간</th>
				<th>답변여부</th>
			</thead>
			<tbody>
			
			</tbody>
		</table>
			
		<button type="button" id="prev">이전페이지</button>
		<button type="button" id="next">다음페이지</button>
		
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/mypage/requestWrite.do/<%= mb_uid%>'">문의등록</button>

</body>
</html>