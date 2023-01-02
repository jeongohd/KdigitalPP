<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
   <script>
   function findPwd(){
		if($('#name').val() == ""){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
		if($('#hp').val() == ""){
			alert("전화번호를 입력하세요");
			$("#hp").focus();
			return false;
		}
		if($('#id').val() == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}
		if($('#email').val() == ""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		//ajax 조회
		$.ajax({
			url:'findPwd.do',
			method:'post',
			data :{
				name:$("#name").val(),
				hp : $("#hp").val(),
				id : $("#id").val(),
				email : $("#email").val()
			},
			success:function(res){
				console.log(res);
				if(res.trim() ==''){
					alert("해당 회원이 존재하지 않습니다.")
				}else{
					alert("임시비밀번호가 이메일로 발송되었습니다.")
					$("#name,#hp,#id,#email").val('')
				}
			}
		})
		return false; //login.do에 전송안되도록
	}
   </script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<form action="login.do" method="post" id="loginForm1" name="loginForm1" onsubmit="return findPwd();">
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">비밀번호 찾기</h3>
                    
                    <div class="join">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="name" name="name" placeholder="이름"></li> <!-- ajax호출시는 id만 필요? -->
                                    <li><input type="text" id="hp" name="hp" placeholder="전화번호"></li>
                                    <li><input type="text" id="id" name="id" placeholder="id"></li>
                                    <li><input type="text" id="email" name="email" placeholder="임시비밀번호 발급 이메일"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="비밀번호 찾기" alt="비밀번호 찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="login.do" class="btn">로그인</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
</div>
<!--//boardWrap-->
</body>
</html>
