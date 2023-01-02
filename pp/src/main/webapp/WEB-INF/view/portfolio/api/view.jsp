<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	ul li{display:inline-block}
	select{height:32px;line-height: 32px}
	.searchDiv{margin-top:15px}
	.page li{margin:0 3px}
</style>
<script>
	window.onload=function(){
		list(1);
	};
	function list(pageNo){
		$.ajax({
			url:"http://localhost:8080/pp/api/board/list",
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
				$('.page').find('li').remove()
				if(data.items){
					var html="<thead>";
						html+="	<tr>";
						html+=		"<th>번호</th>";
						html+=		"<th>제목</th>";
						html+=		"<th>조회수</th>";
						html+=		"<th>작성자</th>";
						html+=		"<th>작성일</th>";
						html+="	</tr>";
						html+="</thead>";
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
					var page ="" ;
					if(data.prev) page += '<li><a href="javascript:list('+(data.startPage-1)+')">←</a></li>';
					for(var i = data.startPage;i<=data.endPage;i++){	
						if(i == data.page){
							page += "<li><a><b style='color:#4a62f8'>"+ i +"</b></a></li>"
						}else{
							page += "<li>";
							page += "	<a href='javascript:list("+i+")'>"+ i +"</a>";
							page += "</li>";
						}
					};
					if(data.next) page +='<li><a href="javascript:list('+(data.endPage+1)+')">→</a></li>';
					
					$('table').append(html);
					$('.page').append(page);
					$('tfoot tr td').html("총게시물수 : "+data.totalcount +", 현재 페이지 : "+data.PageNo +", 총 페이지수 : "+ data.totalPage);
				
			},
			error:function(){
				alert("에러발생");
			}
		});
	}
</script>
</head>
<body>
		<div class="searchDiv">
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
		</div>
		<div class="bbs">
			<table class="list">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="50px" />
					<col width="80px" />
					<col width="10%" />
				</colgroup>
			</table>
			<div class="pagenate clear">
			<ul class='page'>
			</ul> 
		</div>
		</div>
</body>
</html>