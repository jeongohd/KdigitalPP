<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	ul li{display:inline-block}
</style>
<script>
/*
	window.onload=function(){
		list(1);
	};
	function list(pageNo){
		$.ajax({
			url:"http://localhost:8080/project/api/board/list",
			type:"Get",
			dataType:"json",
			cache:false,
			data:{
				pageNo:pageNo,
				pageRow:$('#pageRow').val(),
				search:$('#search').val(),
				searchType:$('#searchType').val()
			},
			success:function(data){
				console.log(data.startPage)
				//목록출력
				$('table tr').remove();
				if(data.items){
					var html="<tr>";
						html+=	"<th>번호</th>";
						html+=	"<th>제목</th>";
						html+=	"<th>조회수</th>";
						html+=	"<th>작성자</th>";
						html+=	"<th>작성일</th>";
						html+="</tr>";
					for(var i=0;i<data.items.length;i++){
						html+="<tr>";
						html+=	"<td>"+data.items[i].no+"</td>";
						html+=	"<td>"+data.items[i].title+"</td>";
						html+=	"<td>"+data.items[i].viewcount+"</td>";
						html+=	"<td>"+data.items[i].member_no+"</td>";
						html+=	"<td>"+data.items[i].regdate+"</td>";
						html+="</tr>";
					}
				};
					html += "<tr><td colspan='5'>";
					if(data.prev) html += '<a href="javascript:list('+(data.startPage-1)+')">←</a>';
					for(var i=data.startPage;i<=data.endPage;i++){	
						if(i== data.PageNo){
							html += " <b>"+ i +"</b> "
						}else{
							html += " <a href='javascript:list("+i+")'>"+ i +"</a> ";
						}
					};
					if(data.next) html +='<a href="javascript:list('+(data.endPage+1)+')">→</a>';
					$('table').append(html);
					$('tfoot tr td').html("총게시물수 : "+data.totalcount +", 현재 페이지 : "+data.PageNo +", 총 페이지수 : "+ data.totalPage);
				
			},
			error:function(){
				alert("에러발생");
			}
		});
	}
	*/
</script>
</head>
<body>
		<select id="pageRow" onchange="list()">
			<option value="5">5</option>
			<option value="10">10</option>
		</select>
		<select id="searchType"> <!-- 값을 넘겨줄필요없어서 name,form 필요없음 -->
			<option value="all">all</option>
			<option value="title">title</option>
		</select>
		<input type="text" value="" id="search">
		<button type="button" onclick="list();">검색</button>
		<table border="1">
		</table>
</body>
</html>