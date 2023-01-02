<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/pp/resources/css/reset.css" rel="stylesheet">
<link rel="stylesheet" href="/pp/resources/css/style3.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>view</title>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31&libraries=services"></script>
<script>
$(function(){
	getchat();
})
function getchat() {
	$.ajax({
		url:"/pp/room/chatlist",
		data:{
		   room_no:${param.room_no}
		},
        success:function(res){
         $("#chatArea").html(res)
        }
   })
   setTimeout(getchat,1000)
}
</script>
</head>
<body>
	<div id="wrap">
		<div class="content room_view">
			<a href="<c:url value='/'/>board/view.do?board_no=${view.board_no }&board_name=여행게시판" class="back_btn">
				<i class="fa-solid fa-arrow-left"></i>
			</a>
			<article>
				<h3>${view.room_title }</h3>
				<div class="cnt">${view.room_content }</div>
			</article>
			<form action="chatWrite" method="post">
				<input type="hidden" name="room_no" value="${view.room_no }">
				<input type="hidden" name="member_no" value="${loginInfo.member_no }"> 
				<input type="hidden" name="member_id" value="${loginInfo.id }"> 
				<input type="text" name="content" value=""> 
				<input type="submit" value="전송">
			</form>
			<div id="chatArea" style="margin-top: 170px"></div>
		</div>
	</div>
</body>
</html>
