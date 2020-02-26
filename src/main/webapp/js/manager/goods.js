
$(document).ready(function(){
	// 첫 페이지 로딩
	$("input#goodsPage").val(1);
	loadGoodsData(1);
	
	// pagination
	// prevPage
	$("button#goodsPrevPage").click(function(){
		var curPage = parseInt($("input#goodsPage").val());
		if (curPage == 1) {
			alert("첫 페이지 입니다.");
			return;
		}
		loadGoodsData(curPage - 1);
	});
	// nextPage
	$("button#goodsNextPage").click(function(){
		var curPage = parseInt($("input#goodsPage").val());
		loadGoodsData(curPage + 1);
	});
	
	
	// sort
	$("#typeSelect").change(function(){
		loadGoodsData(1);
	});
	$("#sortSelect").change(function(){
		loadGoodsData(1);
	});
	
	// delete checkBox toggle
	$("button#goodsCheckBoxToggle").click(function(){
		$("td.goods.ColumnOfCheckBox").toggle();
		$("th.goods.ColumnOfCheckBox").toggle();
		$("button#goodsDeleteOk").toggle();
		
		if ($(this).html() == "선택삭제") {
			$(this).html("선택취소");
		} else {
			$(this).html("선택삭제");
		}
	});
});

function loadGoodsData(page) {
	var type = parseInt($("#typeSelect").val());
	var stype = parseInt($("#sortSelect").val());
	
	$.ajax({
		url : "../managerAjax/goods.ajax/" + type + "/" + stype + "/10/" + page
		, type : "GET"
		, cache : false
		, success : function(data, status) {
			if (status == "success") {
				if(updateTable(data)) {
					$("input#goodsPage").val(page)
				}
			}
		}
	});
}

function updateTable(jsonObj) {
	var result = "";
	
	if (jsonObj.status == "SUCCESS") {
		var count = jsonObj.count;
		var list = jsonObj.list;
		
		for (var i = 0; i < count; i++) {
			result += "<tr>";
			result += "<td class='goods ColumnOfCheckBox'><input type='checkbox' name='uid' value='" + list[i].uid + "'></td>\n";
			result += "<td>" + list[i].g_name + "</td>";
			result += "<td>" + parseType(list[i].g_type) + "</td>";
			result += "<td>" + list[i].g_price + "</td>";
			result += "<td>" + list[i].g_likecnt + "</td>";
			result += "<td>" + list[i].salNum + "</td>";
			result += "</tr>";
		}
		
		$("table#goodsTable tbody").html("");
		$("table#goodsTable tbody").html(result);
		return true;
	} else {
		alert("마지막 페이지 입니다.");
		return false;
	}
	return false;
}

function parseType(num) {
	var result = "";
	switch(num) {
	case 1: result = "침대"; break;
	case 2: result = "화장대"; break;
	case 3: result = "서랍장"; break;
	case 4: result = "소파"; break;
	case 5: result = "거실장"; break;
	case 6: result = "옷장"; break;
	case 7: result = "테이블"; break;
	case 8: result = "의자"; break;
	case 9: result = "책상"; break;
	case 10: result = "책장"; break;
	default: break;
	}
	return result;
}