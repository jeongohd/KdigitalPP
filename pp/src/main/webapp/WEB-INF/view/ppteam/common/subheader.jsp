<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
	window.onload = function() {
		// 로그인 후 변경된 사진 클릭시 마이페이지로 가기(정길)
		$('#idIm').click(function() {
			location.href = "/pp/member/myPage";
		});
		//상단 아이콘 호버시 말풍선 나오게
		$('.menu li').hover(function() {
			$(this).find(".btn_ex").stop().fadeIn()
		}, function() {
			$(".btn_ex").stop().fadeOut();
		})
	}
</script>
<header class="sub_header">
	<div class="content">
		<h1>
			<a href="/pp/board/main.do">DATARO</a>
		</h1>
		<ul class="menu">
			<li><c:choose>
					<c:when test="${empty loginInfo }">
						<a href="/pp/member/login" id="toPic"> 
							<i class="fa-solid fa-user"></i>
						</a>
					</c:when>
					<c:otherwise>
						<a href="/pp/member/myPage" style="background-image:url(/pp/img/${loginInfo.m_filename_server})" class="user_login"></a>
					</c:otherwise>
				</c:choose></li>
			<li>
				<a href="/pp/board/travelWrite.do" id="wBtn"> 
					<i class="fa-solid fa-pen-to-square"></i>
				</a> 
				<span class="btn_ex gmarket">여행<br>글쓰기</span>
			</li>
		</ul>
	</div>
</header>