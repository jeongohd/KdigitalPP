<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.*" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
<script>

function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "edit.do?no=${data.no}";
	}
}

function goDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "delete.do?no=${data.no}"; //밑에 input으로 안넘기면 ?
	}
}
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>공지사항</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<form name="frm" id="frm" action="process.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="cmd" value="write">
		<input type="hidden" name="filename_org" value="${data.filename_org }">
		<input type="hidden" name="filename_real" value="${data.filename_real }">
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
						${data.regdate }
					</td>
					<th>조회수</th>
					<td>
						${data.viewcount }
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${data.title }
					</td>
					<th>작성자</th>
					<td>
						관리자
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						${data.content }
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<c:if test="${!empty data.filename_real}">
							<img src="<%=request.getContextPath() %>/upload/${data.filename_real}">
						</c:if>
						<a href="<%=request.getContextPath() %>/common/download.jsp?oName=${URLEncoder.encode(data.filename_org,'UTF-8')}&sName=${data.filename_real}" target="_blank">${data.filename_org }</a>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<div class="btnSet">
			<div class="left">
				<a href="javascript:;" class="btn" onclick="location.href='board.do';">목록</a>
			</div>
			<div class="right">
				<a href="javascript:;" class="btn" onclick="goEdit();">수정</a>
				<a href="javascript:;" class="btn" onclick="goDelete();">삭제</a>
			</div>
		</div>
		<div style="height:300px;"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
