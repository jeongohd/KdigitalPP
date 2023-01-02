<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function goSave(){
		if($("#id").val().trim()==''){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return;
		}
		var isCon = true;
		$.ajax({
			url:'idCheck.do',
   			data:{id:$('#id').val()},
			async:false,
			success:function(res){
				if(res == 'true'){
					alert('입력한 아이디는 중복되었습니다.다른아이디를 입력해주세요.')
					$("#id").val('');
					$("#id").focus();
					isCon = false;
					//return; //콜백함수는 중지가 ajax 내에서만 중지됨 return 해도 의미없음 위의 변수이용해서 멈춰줘야함
				}
			}
			
		});
		if(!isCon) return;
		if($("#pwd").val().trim()==''){
			alert("비밀번호를 입력해주세요");
			$("#email").focus();
			return;
		}
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{5,}$/;
			if( !reg.test($("#pwd").val()) ){
				alert("비밀번호는 숫자,영문,특수문자 조합으로 5자이상 입력하세요")
				return;
			}
		if($('#pwd').val() != $("#pwd_check").val()){
			alert("비밀번호 확인해주세요.");
			$("#pwd_check").focus();
			return;
		}
		if($('#name').val() == ''){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}
		
		$("#frm").submit();
	};
    function zipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                    addr += extraAddr;
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
   	function idCheck(){
   		if($('#id').val().trim() == ''){
   			alert('이메일을 입력해주세요.')
   		}else{
   	   		$.ajax({
   	   			url:'idCheck.do',
   	   			data:{id:$('#id').val()},
   	   			success:function(res){
   	   				if(res =='true'){
   	   					alert('중복된 아이디 입니다.')
   	   				}else{
   	   					alert('사용가능한 아이디 입니다.')
   	   				}
   	   			}
   	   		})
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
	<div class="sub">
            <div class="size">
                <h3 class="sub_title">회원가입</h3>
                <form name="frm" id="frm" action="signUpProcess.do" method="post" ><!-- enctype="multipart/form-data" -->
                <table class="board_write">
                    <caption>회원가입</caption>
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>*아이디</th>
                            <td>
                                <input type="text" name="id" id="id" class="inNextBtn" style="float:left;">
                                <span class="id_check"><a href="javascript:idCheck();"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="dupCheckBtn">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>*비밀번호</th>
                            <td><input type="password" name="pwd" id="pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 5자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>*비밀번호<span>확인</span></th>
                            <td><input type="password" name="pwd_check" id="pwd_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>*이름</th>
                            <td><input type="text" name="name" id="name" style="float:left;"> </td>
                        </tr>
                        <tr>
                            <th>*성별</th>
                            <td>
	                            <select name="gender" id="gender">
		                            <option value="1">남성</option>
		                            <option value="2">여성</option>
	                            </select> 
                            </td>
                        </tr>
                        <tr>
                            <th>*생년월일</th>
                            <td><input type="text" name="birthday" id="birthday" style="float:left;" autocomplete="off"> </td>
                        </tr>
                        <tr>
                            <th>*휴대폰 번호</th>
                            <td>
                                <input type="text" name="hp" id="hp" value=""  maxlength="15" style="float:left;">
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="3">주소</th>
                            <td>
                                <input type="text" name="zipcode" id="zipcode" class="inNextBtn" style="float:left;" readonly>
                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            	<input type="text" name="addr1" id="addr1" style="width:80%" readonly>
                            </td>
                      	</tr>
                      	 <tr>
                            <td>
                           		<input type="text" name="addr2" id="addr2" style="width:80%">
                       		</td>
                        </tr>
                    </tbody>
                </table>
                        <input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
	</div>
</div>
<!--//boardWrap-->
</body>
</html>
