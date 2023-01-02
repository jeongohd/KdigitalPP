<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
   <script>
   	function loginCheck1(){
   		if($('#id1').val() == ""){
   			alert("아이디를 입력해주세요");
   			$("#email1").focus();
   			return false;
   		}
   		if($('#pwd1').val() == ""){
   			alert("비밀번호를 입력하세요");
   			$("#pwd").focus();
   			return false;
   		}
   		
   		
   	}
   </script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>로그인</h2>
	</div>
	<!--//pageTitle-->
 	<form action="login.do" method="post" id="loginForm1" name="loginForm1" onsubmit="return loginCheck1();"><!--return을 안넣으면 false를 리턴해도 정지안됨(전송안되게)/ header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    
                    <div class="join">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="id1" name="id" placeholder="아이디"></li>
                                    <li><input type="password" id="pwd1" name="pwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="signUp.do" class="btn">회원가입</a> 
                                    <a href="findId.do" class="btn">아이디/비밀번호 찾기</a>
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
