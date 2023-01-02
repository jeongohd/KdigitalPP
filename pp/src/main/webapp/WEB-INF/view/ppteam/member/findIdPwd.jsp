<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="/pp/resources/css/signin.css" rel="stylesheet">
<script>
$(function(){
	$('#fId').click(function(){
		$.ajax({
			url : "findId",
			type:'get',
			success : function(e){
				$("#area").html(e);
			}
		});
	});
	$('#fPwd').click(function(){
		$.ajax({
			url : "findPwd",
			type:'get',
			success : function(e){
				$("#area").html(e);
			}
		})
	});
});
</script>
</head>
<body class="text-center">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<main class="form-signin w-100 m-auto">
	<div class="container" style="top:25%; left:50%; position:fixed; transform: translate(-50%, -50%); width:1000px;">
	    <a href="/pp/board/main.do" style="color:#00939b;">
	    	<h1>DATARO</h1>
	    </a>
		<div class="content login bord" style="padding-top:30px;">
			<form action="" method="get" name ="">
			<div class='row'>
				<div class='col-lg-6'>
					<a href="#" id="fId">아이디 찾기</a>
				</div>
				<div class='col-lg-6'>
					<a href="#" id="fPwd">비밀번호 찾기</a>
				</div>
			</div>
			</form>
		</div>
	</div>
	<div class='col-lg-12' id="area"></div>
	</main>
</body>
</html>