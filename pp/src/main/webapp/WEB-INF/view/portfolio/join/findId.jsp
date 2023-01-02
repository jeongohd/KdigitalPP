<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
   <script>
		function findId(){
    		if($('#name').val() == ""){
    			alert("이름을 입력해주세요");
    			$("#name").focus();
    			return false;
    		};
    		if($('#hp').val() == ""){
    			alert("전화번호를 입력하세요");
    			$("#hp").focus();
    			return false;
    		};
    		$.ajax({
    			url:'findId.do',
    			method:'post',
    			data :{
    				name:$("#name").val(),
    				hp : $("#hp").val()
    			},
    			success:function(res){
    				if(res ==''){
    					alert()
    					$("#msg").html('입력하신 정보는 존재하지 않습니다.');
    				}else{
    					$("#msg").html('아이디는 "'+res.trim()+'"입니다.');
    				}
    			}
    		})
    		return false;
		}
   </script>
</head>
<body>
<div id="boardWrap" class="bbs">
	 <form action="" method="post" id="loginForm1" name="loginForm1" onsubmit="return findId();">
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">이메일찾기</h3>
                    <div class="join">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="name" name="name" placeholder="이름"></li> <!-- ajax호출시는 id만 필요? -->
                                    <li><input type="text" id="hp" name="hp" placeholder="전화번호"></li>
                                    <li id="msg"></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="아이디찾기" alt="아이디찾기" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="login.do" class="btn">로그인</a>
                                    <a href="findPwd.do" class="btn">비밀번호 찾기</a>
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
