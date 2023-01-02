<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">
<link href="/pp/resources/css/signin.css" rel="stylesheet">
</head>
<script>
$(function(){
	$('#id').focusout(function(){
		if ($('#id').val().trim() === '' ){
			$("#area1").html('아이디를 입력해주세요.').css('color','red').css('font-size','small');
			$('#id').focus();
		} else {
			$("#area1").hide();
		} 
	});
	$('#pwd').focusout(function(){
		if ($('#pwd').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$('#pwd').focus();
		} else {
			$("#area2").hide();
		} 
	});
});
function submit(){
	$("#frm").submit();
}
function enterkey() {
	if (window.event.keyCode == 13) {
		$("#frm").submit();
    }
}
</script>
<body class="text-center">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<main class="form-signin w-100 m-auto">
		<div class="container">
			<form action="login" method="post" name="login" id="frm">
				<a href="/pp/board/main.do" style="color: #00939b;">
					<h1>DATARO</h1>
				</a>
				<h1 class="h3 mb-3 fw-normal">Sign in</h1>
				<div class="form-floating">
					<input id="id" name="id" placeholder="Id" type="email" class="form-control"> 
					<label for="floatingInput">Id</label>
				</div>
				<div id="area1" style="margin-top: 5px;"></div>
				<div class="form-floating">
					<input type="password" id="pwd" name="pwd" placeholder="Password" class="form-control" onkeyup="enterkey()"> 
					<label for="floatingPassword">Password</label>
				</div>
				<div id="area2" style="margin-top: 5px;"></div>
				<button type="button" onclick="javascript:submit();" class="w-100 btn btn-lg btn-primary">Sign in</button>
				<p class="mb-3 text-muted">&nbsp;</p>
				<p>------------- 또는 -------------</p>
				<a href="/pp/member/findIdPwd">
					<h5><b><u>아이디 혹은 비밀번호를 잊으셨나요?</u></b></h5>
				</a>
					<h5>회원이 아니신가요?&nbsp;<a href="/pp/member/register" style="color: blue;">가입하기</h5>
				</a>
			</form>
		</div>
	</main>
</body>
</html>