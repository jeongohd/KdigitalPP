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
function validateForm1(form){			
	if (!loginForm.id1.value){	
		alert("아이디를 입력해주세요");
		return false;
	}
	if (!loginForm.pw1.value){
		alert("비밀번호를 입력해주세요");
		return false; 
	}
	return true; 
}

</script>
	<div class="wrap">
		<div class="cnt_wrap">
			<h2>오목</h2>
			<div class="login left">
				<form action="/pp/ppomok/check2" method="post" name ="loginForm" >
					<table>
						<tr>
							<th>아이디 : </th>
							<td>
								<input type="text" id ="id" name="id" placeholder="아이디를 입력하세요" ><br>
							</td>
						</tr>
						<tr>
							<th>비밀번호 :</th>
							<td>
								<input type="password" id ="pw" name="pw" placeholder="비밀번호를 입력하세요" >
								<input type="submit" value="로그인" id="btn1"><br>
							</td>
						</tr>
					</table>
				</form>
				<div class="login_btn">
					<button onClick="location.href='/pp/ppomok/register.do'" type="button">회원가입</button>
					<form action="wait" method="post">
						<button type="submit">비회원</button>
					</form>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>