<%@ page contentType="text/html; charset=utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>

function goEdit() {
	if (confirm("수정하시겠습니까?")) {
		location.href = "edit.do?no="+no;
	}
}

function goDelete(no) {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "process.do?cmd=delete&no="+no;
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
	   <form name="frm" id="frm" action="" method="POST" enctype="multipart/form-data">
	   <input type="hidden" name="cmd" value="write">
	   <input type="hidden" name="gno" value="${data.no}">
	   <input type="hidden" name="gno" value="${data.gno}">
	   <input type="hidden" name="gno" value="${data.ono}">
	   <input type="hidden" name="gno" value="${data.nested}">
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
			</tbody>
		</table>
		</form>
		<div class="btnSet">
			<div class="left">
				<a href="javascript:;" class="btn" onclick="location.href='index.do';">목록</a>
			</div>
			<div class="right">
				<a href="reply.do?no=${data.no }" class="btn">답글</a>
				<a href="javascript:;" class="btn" onclick="goEdit();">수정</a>
				<a href="javascript:;" class="btn" onclick="goDelete(${data.no});">삭제</a>
			</div>
		</div>
		<div style="height:300px;"></div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
