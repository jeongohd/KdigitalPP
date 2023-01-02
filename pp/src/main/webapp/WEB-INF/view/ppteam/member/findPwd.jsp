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
<script>
$(function(){
	$('#id').focusout(function(){
		if ($('#id').val().trim() === '' ){
			$("#area1").html('아이디 입력해주세요.').css('color','red').css('font-size','small');
			$('#id').focus();
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
// 비밀번호 찾기
function fp(){
	$.ajax({
		url:'findPwd',
		method : 'post',
		data: {
			id : $("#id").val(),
			email : $("#email").val()
		},
		success : function(res) {
			if (res.trim() == '') {
				alert('회원정보가 올바르지 않습니다.');
			} else {
				alert('임시비밀번호가 이메일로 발송되었습니다.');
			}
		}
	});
}
function enterkey() {
	if (window.event.keyCode == 13) {
		fp();
    }
}
</script>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<div class="container">
		<form action="" method="post" name ="">
			<div class="form-floating">
		    	<input id="id" name="id" placeholder="id"  type="text" class="form-control" maxlength='8'>
		    	<label for="floatingInput">Id</label>
		    </div>
		    <div id="area1" style="margin-top: 5px;"></div>
			<div class="form-floating">
		    	<input type="email" id="email" name="email" placeholder="Email" class="form-control" maxlength='20' onkeyup="enterkey()">
		    	<label for="floatingPassword">Email</label>
		    </div>
			<div id="area2" style="margin-top: 5px;"></div>
			<input type="button" class="btn btn-primary" value="비밀번호 찾기" id="findPwd" style="margin-top:5px;" onclick="javascript:fp();">
		</form>
	</div>
</body>
</html>