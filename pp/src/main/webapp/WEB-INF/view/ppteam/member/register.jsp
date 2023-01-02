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
			$("#area1").html('아이디를 입력해주세요.').css('color','red').css('font-size','small');
			$("#id").focus();
		} 
	})
	// 비밀번호는 공백을 허용하므로 trim() x.
	$('#pw1').focusout(function(){
		if ($('#pw1').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
			$("#pw1").focus();
		} 
	})
	$('#pwd').focusout(function(){
		if ($('#pwd').val() === '' ){
			$("#area2").html('비밀번호를 입력해 주세요.').css('color','red').css('font-size','small');
		} 
	})
	// 아이디 중복체크
	$('#id').focusout(function (){
		var id = $('#id').val().trim();
		$.ajax({
			url : 'checkId',
			type : 'post',
			data : {
				"id" : id
			},
			success : function(e) {
				if (e === 1) {
					$("#area1").html('동일한 아이디가 있습니다.').css('color','red').css('font-size','small');
					$('#id').val('');
					$('#id').focus();
				}
				else if (e === 0 && id != ''){
					$("#area1").html('사용가능한 아이디입니다.').css('color','green').css('font-size','small')
				}
			},
			error : function(){
				alert(`알 수 없는 에러가 발생했습니다.`);
			}
		});
	});
	$('#pw1').focusout(function(){
		checkPw();
	})
	$('#pwd').focusout(function(){
		checkPw();
	})
	// 이메일 옵션 선택
	$('#email_select').change(function(){
	    // 직접입력 선택 시,
	    if($('#email_select').val() == "2"){
	    $("#email2").val(""); //값 초기화
	    $("#email2").prop("readonly",false); 
	    } 
	   // 선택하기 선택 시,
	    else if($('#email_select').val() == "1"){
	    $("#email2").val(""); //값 초기화
	    $("#email2").prop("readonly",true); 
	    } 
	   // 옵션 안의 이메일을 선택했을 경우,
	    else {
	    $("#email2").val($('#email_select').val()); 
	    $("#email2").prop("readonly",true); 
	    }
	});
	// 이메일 옵션 중 하나 선택 후 중복체크할 경우.
	$('#email_select').focusout(function (){
		checkEmail()
	});
	// 이메일 직접입력시 중복체크
	$('#email').focusout(function (){
		checkEmail();
	});
	$('#email2').focusout(function (){
		checkEmail();
	});
})
// 비밀번호 체크 함수
function checkPw() {
	var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	var pw1 = $('#pw1').val();
	var pwd = $('#pwd').val();
	if(!reg.test(pw1)) {
		$("#area2").html('비밀번호는 숫자, 영문, 특수문자 조합으로 <br> 8자리 이상으로 입력해주세요.').css('color','red').css('font-size','small');
		$("#pw1").focus();
	}
	if (pw1 != pwd && pw1 != '' && pwd != ''){
		$("#area2").html('비밀번호가 같지 않습니다.').css('color','red').css('font-size','small');
		$("#pwd").focus();
	} else if (pw1 == pwd && pw1 != '' && pwd != '') {
		$("#area2").html('비밀번호가 동일합니다.').css('color','green').css('font-size','small')
	}
}
// 이메일 중복 체크 함수
function checkEmail() {
	var email = $('#email').val();
	var email2 = $('#email2').val();
	$.ajax({
		url : 'checkEmail',
		type : 'post',
		data : {
			"email" : email,
			"email2" : email2
		},
		success : function(e) {
			if (e === 1) {
				$("#area3").html('동일한 이메일주소가 있습니다.').css('color','red').css('font-size','small');
			}
			else if (e === 0 && email != '' && email2 != ''){
				$("#area3").html('사용가능한 이메일입니다.').css('color','green').css('font-size','small')
			}
		},
		error : function(){
			alert(`알 수 없는 에러가 발생했습니다.`);
		}
	});
};
</script>
</head>
<body class="text-center">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<main class="form-signin w-100 m-auto">
		<div class="container">
			<form action="register" method="post" name ="register" enctype="multipart/form-data" id='frm'>
			    <a href="/pp/board/main.do" style="color:#00939b;"><h1>DATARO</h1></a>
			    <h1 class="h3 mb-3 fw-normal">Register</h1>
			    <div class="form-floating">
			    	<input id="id" name="id" placeholder="Id"  type="text" class="form-control" maxlength='20'>
			    	<label for="floatingInput">Id</label>
			    </div>
			    <div id="area1" style="margin-top: 5px;"></div>
			    <div class="form-floating">
			    	<input id="nickname" name="nickname" placeholder="Nickname" type="text" class="form-control" maxlength='16' required>
			    	<label for="floatingInput">Nickname</label>
				</div>
			    <div class="form-floating" >
			    	<input type="password" id="pw1" name="pw1" placeholder="Password" class="form-control" style="margin-top: 5px;">
			    	<label for="floatingInput">Password</label>
			    </div>
				<div class="form-floating">
				    <input type="password" id="pwd" name="pwd" placeholder="Confirm Password" class="form-control" >
				    <label for="floatingInput">Confirm Password</label>
			    </div>
				<div id="area2" style="margin-top: 5px;"></div>
				<span >
					<input type="text" id="email" size="10" name="email" class='form-control' style="width:90px; height:35px; display:inline-block;" >&nbsp;@
					<input type="text" id="email2" name="email2" size="10" class='form-control' style="width:105px; height:35px; display:inline-block;">
				</span>
			    <select class="form-select" id="email_select" style="width:115px; display:inline-block;" required>
				    <option value="1" selected>선택하기</option>
					<option value="gmail.com" id="1">gmail.com</option>
					<option value="naver.com" id="2">naver.com</option>
					<option value="hanmail.net" id="3">hanmail.net</option>
					<option value="kakao.com" id="4">kakao.com</option>
					<option value="icloud.com" id="5">icloud.com</option>
					<option value="2">직접입력</option>
			    </select>
				<div id="area3" style="margin-top: 5px;"></div>
				<label class="btn btn-light" for="chooseFile" style="color:#00939b;">프로필사진 정하기</label>
				<input class="file" id="chooseFile" type="file" name="filename" style="display: none;">
				<p>사진 미첨부 시, 기본이미지가 적용됩니다.</p>
				<button type="submit" class="w-100 btn btn-lg btn-primary">가입하기</button>
			</form>
		</div>
	</main>
</body>
</html>