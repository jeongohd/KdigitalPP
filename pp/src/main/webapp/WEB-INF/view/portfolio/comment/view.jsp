<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>
$(function(){
	getCommentList();
	$('.btnSet button').click(function(){
		if($('#password').val() == ""){
			alert("비밀번호를 입력해주세요")
		}else{
			$('#frm').submit();	
		}
		
	})

})
function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "edit.do?idx=1";
	}
}

function goDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "process.do?cmd=delete&idx=1";
	}
}
function getCommentList(page){
	$.ajax({
		url:"/pp/comment/list.do",
		type:"post",
		data:{
			"no":${commentVO.no},
			"page":page
			
		},
		success:function(data){
			$('.commentList').html(data)
		},
		error:function(){
			alert("에러")
		}
	})
}
function commentDelete(cno){
	$.ajax({
		url:"/pp/comment/delete.do",
		type:"post",
		data:{
			"cno":cno
		},
		success:function(){
			alert("삭제되었습니다.")
		},
		error:function(){
			alert("에러")
		}
	})
};
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>댓글 게시판</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<table>
			<colgroup>
				<col style="width:150px"/>
				<col style="width:*"/>
				<col style="width:150px"/>
				<col style="width:*"/>
			</colgroup>
			<tbody>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${data.regdate }" pattern="yyyy-mm-dd HH:mm"></fmt:formatDate>
					</td>
					<th>조회수</th>
					<td>
						${data.viewCount }
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${data.title}
					</td>
					<th>작성자</th>
					<td>
						관리자
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						${data.content}
					</td>
				</tr>
			</tbody>
		</table>
		<div class="btnSet">
			<div class="left">
				<a href="javascript:;" class="btn" onclick="location.href='index.do';">목록</a>
			</div>
			<div class="right">
				<a href="javascript:;" class="btn" onclick="goEdit();">수정</a>
				<a href="javascript:;" class="btn" onclick="goDelete();">삭제</a>
			</div>
		</div>
		<form method="post" name="frm" id="frm" action="<%=request.getContextPath() %>/comment/insert.do">
			<input type="hidden" name="boardno" value="${commentVO.no }">
		     <table class="board_write">
		         <colgroup>
		             <col width="*">
		             <col width="100px">
		         </colgroup>
		         <tbody>
		         <tr>
		         	<td>이름 <input type="text" name="name" value=""></td>
		         	<td>비밀번호 <input type="password" name="password" id="password" value=""></td>
		         </tr>
		         <tr>
		             <td>
		                 <textarea name="comment" style="height:50px;"></textarea>
		             </td>
		             <td>
		                 <div class="btnSet" style="text-align:right;">
		                 	<button type="button" >저장</button>
		                 </div>
		             </td>
		         </tr>
		         </tbody>
		     </table>
		 </form>
		<div style="height:300px;" class="commentList"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
