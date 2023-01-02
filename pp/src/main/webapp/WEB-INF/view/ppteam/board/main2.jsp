<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/pp/resources/css/style3.css"/>
<link rel="stylesheet" href="/pp/resources/css/reset.css"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>MAIN DATARO</title>
</head>
<body>
	<div id="wrap" class="main" >
		<div class="content main">
			<c:if test="${empty data.list }">
				<div style="top: 50%; left: 50%; position: fixed; font-size: 35px; transform: translate(-50%, -50%)">등록된 글이 없습니다.</div>
			</c:if>
			<c:forEach var="list" items="${data.list}">
				<div class="cnt_set">
					<div class='top_cnt'>
						<h5>${list.title}</h5>
						<br/>
						<div>
							<strong>글번호 : ${list.board_no} ㅣ 회원ID : ${list.id}</strong>
						</div>
					<br> 
					<span class='hashtag'> 
						<c:forEach var="hl" items="${list.hashtagList}">
			         		#${hl.hashtag_name}
			         	</c:forEach>
					</span>
					</div>
					<div class="img_area">
						<a href="view.do?board_no=${list.board_no}&board_name=${list.board_name}">
							<c:forEach var="gtp" items="${list.getTravPic}">
								<span style='background:url(/pp/img/${gtp.filename_server}) center center/cover no-repeat' id='idImg'></span>
							</c:forEach>
						</a>
					</div>
					<ul class="view_icon">
							<li>
								<span><b>${list.thumbsUp}</b></span> 
								<span><i class='fa-solid fa-thumbs-up'></i></span>
							</li>
							<li>
								<span><b>${list.commentCount}</b></span> 
								<span><i class='fa-regular fa-comment'></i></span>
							</li>
							<li>
								<span><b>${list.viewcount}</b></span> 
								<span><i class='fa-regular fa-eye'></i></span>
							</li>
						</ul>
					<ul class="courselist">
						<c:forEach var='mvo' items='${list.placeList}'>
							<li><span>${mvo.place_name}</span></li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
			<div id="area"></div>
		</div>
	</div>
</body>
</html>