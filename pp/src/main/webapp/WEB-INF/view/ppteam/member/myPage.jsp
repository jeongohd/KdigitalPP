<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="/pp/resources/css/reset.css"/>
<link rel="stylesheet" href="/pp/resources/css/style3.css"/>
<link href="/pp/resources/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
#area h2{margin-bottom:20px}
</style>
</head>
<script>
var sword = $('#sword').val();
var stype = $('#stype').val();
function getPage(page){ 
	$.ajax({
		url:"/pp/board/myList1",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage2(page){ 
	$.ajax({
		url:"/pp/board/myList2",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage3(page){ 
	$.ajax({
		url:"/pp/board/myList3",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage4(page){ 
	$.ajax({
		url:"/pp/board/myList4",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};
function getPage5(page){ 
	$.ajax({
		url:"/pp/board/myList5",
		type:'post',
		data:{
			page: page,
			sword : sword,
			stype: stype
		},
		success : function(res){
			$("#area").html(res);
		}
	})
};

$(function(){
	// 회원정보수정으로 가기
 	$('#setbtn').click(function(){
 		location.href="/pp/member/editMemberInfo";
 	})
 	// 내가 쓴 글
 	$('#bt1').click(function(){
 		$.ajax({
 			url : '/pp/board/myList1',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 쓴 댓글
	$('#bt2').click(function(){
 		$.ajax({
 			url : '/pp/board/myList2',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 좋아요 누른 게시물
	$('#bt3').click(function(){
 		$.ajax({
 			url : '/pp/board/myList3',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 받은 쪽지
	$('#bt4').click(function(){
 		$.ajax({
 			url : '/pp/board/myList4',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 보낸 쪽지
	$('#bt5').click(function(){
 		$.ajax({
 			url : '/pp/board/myList5',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
 	// 내가 참여한 채팅방
	$('#bt6').click(function(){
 		$.ajax({
 			url : '/pp/board/myList6',
			type : 'post',
			success : function(e) {
				$("#area").html(e);
			},
			error : function(e){
				alert(`error`);
			}
 		});
 	});
	// 로그인, 로그아웃 이미지
 	$('#lo').hover(function(){
 		$('#lo').find('i').hide();
 		$('#red').show();
 	},function(){
 		$('#lo').find('i').hide();
 		$('#green').show();
 	});
});
function logout(){
	if(confirm('로그아웃 하시겠습니까?')) {
		location.href = "/pp/member/logout";
	} else {
		location.reload();
	}
}
</script>
<body class="text-center">
	<div id="wrap">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
			<header class="main sub_header">
				<div class="content inner">
					<a href="/pp/board/main.do"><h1 style="color:#00939b;font-size:32px">DATARO</h1><span style="color:#111;font-size:16px;margin-left:10px">My Page</span></a>
					<div class="side_btn" >
						<i class="fa-solid fa-gear" id="setbtn" style="float:right; font-size:xx-large;cursor:pointer"></i>
					</div>
				</div>
			</header>
		<main class="form-signin w-100 m-auto">
			<div class="container" >
				<form action="" method="post" >
				<div style="text-align: right";>
					<h4 id="nic" style="display:inline-block;">${loginInfo.nickname}</h4>
					<a href="javascript:logout();" id="lo">
						<i id="green" class="fa-solid fa-circle-check" style="font-size:30px; color:green;"></i>
						<i id="red" class="fa-solid fa-circle-xmark" style="font-size:30px; display:none; color:red;" ></i>
					</a>
				</div>
				<br/>
				<br/>
				<div class="row">
					<div class='col-md-2'>
						<i class="fa-regular fa-pen-to-square" id="bt1" title="내가 쓴 글" style="font-size:xx-large"></i>
					</div>
					<div class='col-md-2'>
						<i class="fa-regular fa-comment" id="bt2" title="내가 쓴 댓글" style="font-size:xx-large"></i>
					</div>
					<div class='col-md-2'>
						<i class="fa-regular fa-thumbs-up" id="bt3" title="좋아요 누른 게시물" style="font-size:xx-large"></i>
					</div>
					<div class='col-md-2'>
						<i class="fa-regular fa-envelope" id="bt4" title="받은 쪽지함" style="font-size:xx-large"></i>
					</div>
					<div class='col-md-2'>
						<i class="fa-solid fa-envelope" id="bt5" title="보낸 쪽지함" style="font-size:xx-large"></i>
					</div>
					<div class='col-md-2'>
						<i class="fa-regular fa-comments" id="bt6" title="내가 참여한 채팅방" style="font-size:xx-large"></i>
					</div>
				</div>
				<div id="area" style="margin-top:50px"></div>
				<p class="mb-3 text-muted">&nbsp;</p>
				</form>
			</div>	
		</main>
	</div>
</body>
</html>