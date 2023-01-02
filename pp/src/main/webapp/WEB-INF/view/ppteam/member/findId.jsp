<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="/pp/resources/css/signin.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
$(function(){
	$('#nickname').focusout(function(){
		if ($('#nickname').val().trim() === '' ){
			$("#area1").html('닉네임을 입력해주세요.').css('color','red').css('font-size','small');
			$('#nickname').focus();
		} else {
			$("#area1").hide();
		} 
	});
	$('#email').focusout(function(){
		if ($('#email').val() === '' ){
			$("#area2").html('이메일을 입력해 주세요.').css('color','red').css('font-size','small');
			$('#email').focus();
		} else {
				$("#area2").hide();
		} 
	})
});
// 아이디 찾기
function fi() {
	$.ajax({
		url:'findId',
		method : 'post',
		data: {
			email : $("#email").val(),
			nickname : $("#nickname").val()
		},
		success : function(res) {
			if (res.trim() == '') {
				alert('입력하신 정보는 존재하지 않습니다.');
			} else {
				alert('아이디는 "'+res.trim()+'" 입니다.');
			}
		}
	});
}
function enterkey() {
	if (window.event.keyCode == 13) {
		fi();
    }
}
</script>
</head>
<body>
	<div class="container">
		<form action="" method="post" name="">
			<div class="form-floating">
				<input id="nickname" name="nickname" placeholder="Nickname" type="text" class="form-control" maxlength='8'> 
				<label for="floatingInput">Nickname</label>
			</div>
			<div id="area1" style="margin-top: 5px;"></div>
			<div class="form-floating">
				<input type="email" id="email" name="email" placeholder="Email" class="form-control" maxlength='20' onkeyup="enterkey()"> 
				<label for="floatingPassword">Email</label>
			</div>
			<div id="area2" style="margin-top: 5px;"></div>
			<input type="button" class="btn btn-primary" onclick="javascript:fi();" value="아이디 찾기" id="findId" style="margin-top: 5px;">
		</form>
	</div>
</body>
</html>