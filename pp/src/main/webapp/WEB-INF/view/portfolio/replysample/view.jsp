<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>

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
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>답변게시판</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="write">
		<form name="frm" id="frm" action="process.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="cmd" value="write">
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
						2020-01-01
					</td>
					<th>조회수</th>
					<td>
						111
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						답변게시판 제목입니다.
					</td>
					<th>작성자</th>
					<td>
						관리자
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						내용입니다.<br>
						내용입니다.<br>
						내용입니다.<br>
						내용입니다.<br>
						내용입니다.<br>
						내용입니다.<br>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<a href="" target="_blank">첨부파일명.docx</a>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<div class="btnSet">
			<div class="left">
				<a href="javascript:;" class="btn" onclick="location.href='index.do';">목록</a>
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
