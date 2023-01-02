<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>omok wait.jsp</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle:wght@700&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../resources/css/omok/style.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<div class="cnt_wrap wait">
			<h2>Start Game</h2>
			<form action="/pp/ppomok/play" method="post">	
			    	<button type="submit"><img src="../resources/omok_img/2/cat1.jpg" width="100px" alt=""><b>게임시작</b></button>
			    	<c:if test="${empty id }"><h5><b>비회원</b> 님 반갑습니다^^*</h5></c:if>
			    	<c:if test="${not empty id }"><h5><b>${id }</b>님 반갑습니다^^*</h5></c:if>
			</form>
			<div class="table_scroll" style="display:none">
				<table id="tbl" border="1" class="aaa">
					<thead>
						<tr><th>순위</th><th>아이디</th><th>승</th><th>패</th></tr>
					</thead>
					<tbody></tbody>
			    </table>
		    </div>
			<button type="button" id="btn" value="ajax">랭킹</button>
			<!-- 랭킹버튼 -->
			
			<form action="logout.do" method="post" class="login_form">
			<c:if test="${empty id }">
				<button type="submit" id="logout" name="logout">로그인하기</button>
			</c:if>
			<c:if test="${not empty id }">
				<button type="submit" id="logout" name="logout">로그아웃</button>
			</c:if>
			</form>
		</div>
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    
<script>
$(function(){
	$('#btn').click(function(){
		$.ajax({
			url : 'rankers.do',
			success : function(Rankers){
				$('.table_scroll').toggle();
                $.each(Rankers, function(idx, value){ 
                    idx = idx + 1;
                    var html ="<tr><td>" + idx + "</td>"
                    html += "<td>" + value.id + "</td>";
                    html += "<td>" + value.win + "</td>";
                    html += "<td>" + value.lose + "</td></tr>";
                    $("#tbl tbody").append(html);
                })
			},
			error : function(e){
				alert(`error`);
			}
		})
	})
})
</script>	
</body>
</html>