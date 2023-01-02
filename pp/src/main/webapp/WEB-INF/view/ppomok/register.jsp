<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle:wght@700&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../resources/css/omok/style.css" rel="stylesheet">
</head>
<body>

<script>

function validateForm(form){			
	if (!joinForm.id.value){	
		alert("아이디를 입력해주세요");
		return false;
	}
	if (joinForm.pw.value == ""){
		alert("비밀번호를 입력해주세요");
		return false; 
	}
	if (joinForm.pw1.value == ""){
		alert("비밀번호 확인을 위해 한 번 더 입력해주세요.");
		return false; 
	}
	
	if (joinForm.pw.value != joinForm.pw1.value){
		alert("비밀번호가 같지 않습니다.")
		return false;
	}
	return true; 
}
 
function enterkey() {
	if (window.event.keyCode == 13) {
		ci();
    }
}
function enterkey2() {
	if (window.event.keyCode == 13) {
		if (validateForm(this)){
			$('#frm').submit();
		}
    }
}

function ci(){
	var id = document.querySelector('#id').value;
	var pw = document.querySelector('#pw').value;
	$.ajax({
		url : '/pp/ppomok/check',
		type : 'post',
		data : {
			"id" : id,
			"pw" : pw
		},
		success : function(e) {
			if (joinForm.id.value.trim() == "") alert('공백은 아이디로 사용 불가능합니다.')
			else if (e === 1) alert(`해당 아이디가 존재합니다`);
			else if (e === 0){					
				if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
					$('#sss').show();  
					} 
			}
		},
		error : function(){
			alert(`알 수 없는 에러가 발생했습니다.`);
			
		}
	});
}
function submit(){
	if (validateForm(this)){
		$('#frm').submit();
	}
}
</script>
	<div class="wrap">
		<div class="cnt_wrap join">
			<h2>회원가입</h2>
			<form action="insert" method="post"  name ="joinForm" id="frm">
				<input type="text" id="id" name="id" placeholder="id" onkeyup="enterkey()">
				<input type="button" value="중복확인" id='btn' onclick="javascript:ci();"><br>
				<div id="sss" style="display:none">
					<input type="password" id="pw" name="pw" placeholder="pw" ><br /> 
					<input type="password" name="pw1" placeholder="pw for confirmation" onkeyup="enterkey2()"><br />
					<input type="button" value="가입" id="join" onclick="javascript:submit();"> 
				</div>
			</form>
		</div>
	</div>
</body>
</html>