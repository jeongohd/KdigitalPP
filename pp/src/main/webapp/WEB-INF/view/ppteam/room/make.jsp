<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/pp/resources/css/reset.css" rel="stylesheet">
    <link href="/pp/resources/css/view.css" rel="stylesheet">
    <title>make</title>
</head>
<body>
	<form action="write.do" method="post">
		<h2>새로운 방 만들기</h2>
		<input type="hidden" name="board_name" value="${roomVO.board_name }">
		<input type="hidden" name="board_no" value="${roomVO.board_no }">
		<input type="hidden" name="roommaker_id" value="${roomVO.roommaker_id }"> *방 제목 : 
		<input type="text" name="room_title"><br> *방 내용 :
		<textarea name="room_content"></textarea>
		<br><b>[여행 시작날짜와 종료날짜를 선택해주세요]</b><br> *시작날짜 : 
		<input type="date" name="room_startdate"> <br> *종료날짜 : 
		<input type="date" name="room_enddate"><br> 비밀번호 : 
		<input type="password" name="room_pwd"> 
		<input type="submit" value="전송">
	</form>
</body>
</html>