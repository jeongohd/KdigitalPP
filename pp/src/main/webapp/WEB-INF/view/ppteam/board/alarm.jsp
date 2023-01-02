<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form table tr td {
	white-space: nowrap; 
	overflow: hidden;
	text-overflow: ellipsis;
	padding: 5px 10px;
}
</style>
<script>
$(function (){
	// '읽음처리하기' 버튼 클릭시 읽음처리.
	$("#btn").click(function(){
		// console.log($("#messageFrm").serialize());
		aj();
		location.reload(); 
	}); 
	if (${empty list }) {
		$('#btn').hide();
	}
	
	// 체크박스 전체 체크하기.
	$("#all").click(function() {
        if ($("#all").prop("checked")) {
            $(".selected").prop("checked", true);
        } else {
            $(".selected").prop("checked", false);
        }
    });
});
// 안읽은 쪽지 화면에서 체크표시한 값들을 ajax로 해당 url로 넘김. 
function aj(){
	$.ajax({
		url : '/pp/member/readProcess',
		type : 'post',
		data : $("#messageFrm").serialize(),
		success : function(e) {
			if (e === 1) alert("읽음 처리가 완료되었습니다.");
		},
		error : function(e){
			alert(`쪽지를 읽지 않으셨습니다.`);
		}
	});
};
if (${empty list }) {
	$('#all').hide();
	$('#td').hide();
} else {
	$('#all').show();
	$('#td').show();

}
</script>
</head>
<body>
	<div style="display: inline-block; height: 200px; overflow-y: scroll;">
		<form id="messageFrm">
			<table>
				<colgroup>
					<col width="100px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tr>
					<td>닉네임</td>
					<td>내가 받은 쪽지</td>
					<td>읽음여부</td>
				</tr>
				<tr>
					<td>&nbsp</td>
				</tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="3">읽지 않은 쪽지가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.nickname}</td>
								<td>${vo.message_content}</td>
								<td><input type="checkbox" class="selected" name="message_no" value="${vo.message_no }"></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td id="td" colspan="3" style="text-align: right; position: relative; right: 33px; color: gray;">전체선택하기&nbsp 
						<input type="checkbox" id="all">
					</td>
				</tr>
				<tr>
					<td colspan="3"><input type="button" value="읽음처리하기" id="btn"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>