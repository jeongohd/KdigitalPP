<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<title><%=util.Property.title %></title>
<%@ include file="/WEB-INF/view//include/headHtml.jsp" %>
<script>
</script>
</head>
<body>
<div id="boardWrap" class="bbs">
	<div class="pageTitle">
		<h2>답변게시판</h2>
	</div>
	<!--//pageTitle-->
	<!--//search-->
	<div class="list">
			<table>
				<caption> 목록 </caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty data}">
					<tr>
						<td colspan="5">등록된 데이터가 없습니다.</td>
					</tr>
				</c:if>

					<tr style='cursor:pointer;' onclick="location.href='view.do?idx=1'">
						<td>11</td>
						<td class="title">답변게시판 제목입니다.</td>
						<td>관리자</td>
						<td>2020-01-01</td>
						<td>111</td>
					</tr>
					<tr style='cursor:pointer;' onclick="location.href='view.do?idx=1'">
						<td>11</td>
						<td class="title">
							&nbsp;&nbsp;<img src="<%=util.Property.contextPath%>/img/ico_re.png">
							답변게시판 제목입니다.
						</td>
						<td>관리자</td>
						<td>2020-01-01</td>
						<td>111</td>
					</tr>
					<tr style='cursor:pointer;' onclick="location.href='view.do?idx=1'">
						<td>11</td>
						<td class="title">답변게시판 제목입니다.</td>
						<td>관리자</td>
						<td>2020-01-01</td>
						<td>111</td>
					</tr>
				</tbody>
			</table>
		<div class="pagenate clear">
			<ul class='page'>
				<li><a href='javascript:;' class='current'>1</a></li>
				<li><a href='index.do?reqPageNo=2'>2</a></li>
				<li><a href='index.do?reqPageNo=3'>3</a></li>
			</ul> 
		</div>
		<div class="btnSet">
			<div class="right">
				<a href="write.do" class="btn">작성</a>
			</div>
		</div>
	</div>
	<!--//list-->
</div>
<!--//boardWrap-->
</body>
</html>
