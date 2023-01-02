<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pp/resources/css/reset.css"/>
<link rel="stylesheet" href="/pp/resources/css/style3.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" href="#"> <!-- favicon.ico 에러나서 넣어줌 -->
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/ppteam/common/subheader.jsp"%>
		<div class="content tv_write">
			<form action="./insert.do" name="AH" id="save" method="post" enctype="multipart/form-data" onsubmit="return goSave()";>
				<input type="hidden" name="id" value=${loginInfo.id }> <input type="hidden" name="member_no" value=${loginInfo.member_no }>
				<!--제목-->
				<div class="title">
					<div class="title_top">
						<div class="title_write">
							<span class="user"> <span class="user_img" style="background-image:url(/pp/img/${loginInfo.m_filename_server})"></span>
								<p>${loginInfo.nickname }</p>
							</span> <input type="text" name="title" id="title" class="title_text gmarket" value="코스 제목"> 
							<input type="hidden" name="board_name" id="title" class="title_text" value="여행게시판">
						</div>
						<!-- 해시태그 -->
						<div class="hash">
							<h3 class="gmarket">여행테마</h3>
							<c:forEach var="hash" items="${category.hash}">
								<label class="gmarket"> 
									<input type="checkbox" id="hash${hash.hashtag_no }" name="hashtag_no_arr" value="${hash.hashtag_no}"> 
									#${hash.hashtag_name}
								</label>
							</c:forEach>
						</div>
					</div>
					<!-- 지역 체크박스 -->
					<div class="region">
						<input type="hidden" name="region_name" value=""> 
						<select name="region" id="region" class="gmarket">
							<option value="0" selected>지역</option>
							<c:forEach var="region" items="${category.region}">
								<option value="${region.region_name}">${region.region_name }</option>
							</c:forEach>
						</select>
						<ul class="region_result"></ul>
						<div class="region_detail"></div>
					</div>
				</div>
				<!--지도,글쓰기-->
				<div class="map_wrap">
					<!-- 지도 나오는 곳 -->
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					<!-- 검색 목록 -->
					<div id="menu_wrap" class="bg_white" style="display:;">
						<div class="option"></div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>
				</div>
				<!-- 지도 검색 -->
				<div class="seracLocation">
					<div>
						<input type="text" value="종각역 맛집" id="keyword" onkeyup="enterkey()" size="15" class="gmarket" placeholder="지역을 검색하세요"> 
						<a onclick="jacascript:searchPlaces()" class="find_btn"><i class="fa-solid fa-magnifying-glass"></i></a> 
						<a href="javascript:displayCouses(courseArr);" class="marker gmarket">[마커표시]</a>&nbsp;&nbsp;
					</div>
				</div>
				<!-- 코스 설명 들어갈 부분 -->
				<div class="write_detail">
					<div class="scroll"></div>
				</div>
				<!--//지도,글쓰기-->
				<a href="javascript:goSave()" class="save">등록<i class="fa-solid fa-plus"></i></a>
			</form>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c38ca43e39c04f28999aae344752a661&libraries=services"></script>
<script type='text/javascript' src="/pp/js/map.js"></script>
<script type='text/javascript' src="/pp/js/mapMake.js"></script> 
<script>
	$(function() {
		$("#hash0").parent("label").css("background", "#eee")
		$("#hash0").prop("disabled", true)
		// 키워드로 장소를 검색
		searchPlaces();
	})
	function goSave() {
		console.log($("#region option:selected"))
		if ($(".gmarket").hasClass("on") == false) {
			alert("해시태그를 선택해주세요.");
		} else if ($(".region_detail input[type='checkbox']").is(':checked') == false) {
			alert("지역을 선택해주세요.");
		} else if ($("div").hasClass("set") == false) {
			alert("코스를 등록해주세요.")
		} else {
			if (confirm('등록하시겠습니까?')) {
				send(courseArr);
			}
		}
	};
	var pic = 1;
	// 체크박스on
	$(".hash label").click(function() {
		if ($(this).find("input[type='checkbox']").is(':checked')) {
			$(this).toggleClass("on")
		}
	})
	function writebox(index, places) {
		count++;
	var html =  '<div class="set">';
		html += '	<div class="map_list">';
		html += '		<span class="markerbg marker_' + (index + 1) + '"></span>';
		html +=	'		<h5>' + places.place_name + '</h5>';
		html += '		<span class="info">';
		html +=	'			<span class="tel"><i class="fa\-solid fa\-phone"></i>' + places.phone + '</span>';
		html +=	'			<span><i class="fa-solid fa-location-dot"></i>' + places.address_name + '</span>';
		html += '		</span>';
		html += '	</div>';
		html += '	<textarea placeholder="내용 입력" name="contents"> </textarea>';
		html += '	<div class="pic_wrap">';
		html += '       <div class="pic">';
		html += '       	<input type="file" class="file_input' + pic + '" name="filename" id="' + pic + '" onchange="readInputFile(this)">';
		pic++;
		html += '           <img src="/pp/img/no-image.jpg">';
		html += '           <span class="delete" ><i class="fa-solid fa-circle-minus"></i></span>';
		html += '       </div>';
		html += '       <div class="pic">';
		html += '       	<input type="file" class="file_input' + pic + '" name="filename" id="' + pic + '" onchange="readInputFile(this)">';
		html += '           <img src="/pp/img/no-image.jpg">';
		html += '           <span class="delete" ><i class="fa-solid fa-circle-minus"></i></span>';
		html += '       </div>';
		html += '	</div>';
		html += '   <span class="course_delete">코스삭제</span>';
		html += '</div>';
		pic++;
		$('.scroll').append(html);

	}
	// 사진미리보기
	function readInputFile(input) {
		var className = input.className;
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.' + className + '').next('img').attr("src", e.target.result)
			}
			reader.readAsDataURL(input.files[0]);
		}
		;
	};
	// 사진삭제
	$(document).on("click", ".delete", function() {
		$(this).prev('img').attr("src", "/pp/img/no-image.jpg");
		$(this).siblings('input').val("");
	})
	// 글쓰기+사진+코스 삭제
	$(document).on("click", ".course_delete", function() {
		var idx = $(this).parent("div").index();
		if (confirm('코스 삭제?')) {
			$(this).parent("div").remove();
			courseIdx = 0;
			courseArr.splice(idx, 1);
			count--;
			if (markerShow) {
				displayCouses(courseArr);
			} else {
				searchPlaces();
			}
		}
	})
	//지도 소분류 ajax로 바로 가져오기
	$("#region").change(function() {
		var region_name = $(this).val()
		$.ajax({
			url : "/pp/board/region_detail",
			data : {
				rs : region_name
			},
			success : function(res) {
				$(".region_detail").find("input").remove();
				$(".region_detail").find("label").remove();
				for (var i = 0; i < res.regionDetailList.length; i++) {
					var html = '<label for="region'+res.regionDetailList[i].region_no+'">' + res.regionDetailList[i].region_name;
					html += '<input type="checkbox" name="region_no_arr" id="region'+res.regionDetailList[i].region_no+'" value="'+res.regionDetailList[i].region_no+'">';
					html += '</label>';
					$(".region_detail").append(html);
				}
			}
		})
	});
	//지도소분류 체크css
	$(document).on("click",".region_detail label",function() {
		if ($(this).find("input[type='checkbox']").is(':checked')) {
			$(this).toggleClass("on");
			if ($(this).hasClass("on")) {
				var html = '<li id=' + $(this).attr('for') + '>' + $(this).text();
				html += '<a onclick="delCondition(\'' + $(this).attr('for')+ '\')"><i class="fa-solid fa-circle-xmark"></i>';
				html += '</a>';
				html += '</li>';
				$('.region_result').append(html);
			} else {
				$("li#" + $(this).attr('for')).remove();
			}
		}
	})
	function delCondition(e) {
		$("li#" + e).remove();
		$("label[for='" + e + "']").removeClass('on');
		$("input#" + e).prop("checked", false);
	}
</script>
</body>
</html>