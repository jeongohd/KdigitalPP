<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="/pp/resources/css/mypage.css" rel="stylesheet">
<style>
	.container form table{table-layout: fixed}
	.container form table tr td{
		 white-space: nowrap; /*nowrap 줄바꿈을 하지 않음.*/
	     overflow: hidden;
	     text-overflow: ellipsis;
	     padding: 5px 10px;
	}
</style>
</head> 
<body class="text-center">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<main class="form-signin w-100 m-auto">
<div class="container">
	    <h2>참여한 채팅방</h2>
        <div class="bbs" style="display:inline-block; width:700px; height:200px; overflow-y:scroll;">
        <div id="area"></div>
       	 	<div>
                <form method="post" name="Form" id="searchForm" action="">
            	<table class="table">
            	<colgroup>
                    <col width="110px" />
                    <col width="100px" />
                    <col width="200px" />
                    <col width="110px" />
                    <col width="150px" />
                </colgroup>
                <tr>
                    <th>게시판 이름</th>
                    <th>방번호</th>
                    <th>방제목</th>
                    <th>방장 아이디</th>
                    <th>방 생성 날짜</th>
                </tr>
				<c:if test="${empty list }">
                    <tr>
                        <td class="first" colspan="5">참여한 채팅방이 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="vo" items="${list }" varStatus="status">
                    <tr>
                    	<td>${vo.board_name}</td>
                    	<td>${vo.room_no}</td>
                        <td class="titlee"><a href="/pp/room/room.do?room_no=${vo.room_no}">${vo.room_title}</a></td>
                        <td>${vo.roommaker_id}</td>
                        <td>${vo.room_startdate }</td>
                    </tr>
                </c:forEach>
                </tbody>
            	</table>
         	</form>
        	</div>
        </div>
    </div>
</main>
</body>
</html>