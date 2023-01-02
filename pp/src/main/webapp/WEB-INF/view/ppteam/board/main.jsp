<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/pp/resources/css/style3.css" />
<link rel="stylesheet" href="/pp/resources/css/reset.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>MAIN DATARO</title>

<script>
$(function(){
	// 프로필 사진 클릭 시 마이페이지로 가기
	$('#idIm').click(function(){
		location.href="/pp/member/myPage";
	});
	// 종 아이콘 클릭 시 읽지않은 쪽지 모달팝업
	$('#alarmForUser').click(function(){
		$.ajax({
			url : '/pp/member/alarm',
			type : 'post',
			success : function(e) {  
				$("#areaForUser").html(e); 
			}
		});
		if (${!empty loginInfo}) {
			$('.modal').fadeIn();
		}
	});
	// 모달팝업 종료
	$('.btn-close').click(function(){
		$('.modal').fadeOut();
	});	
	
	// 클릭한 해쉬태그가 검색어 sword로 검색.
	$('.hashtag').click(function(){
		$("#stag").val($(this).data('no')); 
		$('#frm').submit();
	})
	
	var pageCnt=2;
	$(window).scroll(function(e){ 
		  $('#topBtn').show();
		  
		  var docHeight = $(document).height();
		  var winHeight = $(window).height();
	      var scrollTop = $(window).scrollTop();
	      var val = parseInt(scrollTop + winHeight);
	      
	      // 스크롤이 하단에 다 왔을 때, 다음 게시물 출력. 
	      if (val >= (docHeight - (docHeight*0.05))) {
	    	  if (pageCnt <=  ${data.totalPage}){
		    	  pageCnt = getPosts(pageCnt);
	    	  }
	      } 
	      // 헤더 고정.
	      if(scrollTop > 16){
	         $('header').addClass('fixed');
	         $('#wrap').css({'padding-top':'171px'})
	      }else{
	         $('header').removeClass('fixed')
	            $('#wrap').css({'padding-top':'0px'})
	      }
	});
});
// 페이징
function getPosts(page){ 
	$.ajax({
		url:"/pp/board/posts.do",
		data:{
			page: page,
			stag : '${param.stag}',
			stype : '${param.stype}',
			sword : '${param.sword}'
		},
		async:false,
		success : function(res){
			$("#area").append(res);
			page += 1
		}
	})
	return page
};
</script>
</head>
<body>
	<div id="wrap" class="main">
		<header class="main sub_header">
			<div class="content inner">
				<h1>
					<a href="/pp/board/main.do">DATARO</a>
				</h1>
				<form id="frm" action="main.do">
					<input type="hidden" name="stag" id="stag"> <select
						id="form" name="stype" id='stype' class="dSelect" class="gmarket">
						<option value="title">글제목</option>
						<option value="id">아이디</option>
					</select> <input type="text" id="sword" name="sword" value="" placeholder="검색" class="gmarket"> 
					<input type="submit" value="검색" class="gmarket">
				</form>
				<div class="side_btn">
					<c:choose>
						<c:when test="${empty loginInfo }">
							<a href="/pp/member/login" id="toPic"> <i class="fa-solid fa-user"></i>
							</a>
						</c:when>
						<c:otherwise>
							<a href="#"> 
								<img src="/pp/img/${loginInfo.m_filename_server}" id="idIm" style="border-radius: 30px; width: 50px; height: 50px">
							</a>
						</c:otherwise>
					</c:choose>
					<a href="#" id="alarmForUser" style="position: relative"> 
						<span id="theNumberOfMsg"> ${UnreadMsgs }</span> 
						<i class="fa-solid fa-bell"></i>
					</a> 
					<a href="/pp/board/travelWrite.do" id="wBtn"> 
						<i class="fa-solid fa-pen-to-square"></i>
					</a>
				</div>
			</div>
		</header>
		<div class="hash">
			<span class='hashtag' data-no=''>#전체</span> 
			<span class='hashtag' data-no='1'>#자전거코스</span> 
			<span class='hashtag' data-no='2'>#드라이브코스</span>
			<span class='hashtag' data-no='3'>#뚜벅이코스</span> 
			<span class='hashtag' data-no='4'>#가족과함께</span> 
			<span class='hashtag' data-no='5'>#친구와함께</span>
			<span class='hashtag' data-no='6'>#연인과함께</span> 
			<span class='hashtag' data-no='7'>#자연</span> 
			<span class='hashtag' data-no='8'>#반려동물</span>
			<span class='hashtag' data-no='9'>#레포츠</span> 
			<span class='hashtag' data-no='10'>#1박2일</span> 
			<span class='hashtag' data-no='11'>#당일치기</span>
			<span class='hashtag' data-no='12'>#축제</span> 
			<span class='hashtag' data-no='13'>#식도락</span> 
			<span class='hashtag' data-no='14'>#역사</span>
		</div>
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
		<div class="modal">
			<div class="modal-content">
				<a class="btn-close" href="#none">x</a>
				<div id="areaForUser"></div>
			</div>
		</div>
		<span id="topBtn" style="display: none"> 
		<a href="javascript:;" onclick="window.scrollTo(0,0);">
			<i class="fa-regular fa-circle-up" style="font-size: 50px; color: #00939b; right: 2%; bottom: 5%; position: fixed;"></i>
		</a>
		</span>
	</div>
</body>
</html>