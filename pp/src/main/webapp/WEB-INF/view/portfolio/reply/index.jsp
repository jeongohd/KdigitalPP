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
				<c:if test="${empty data.list}">
					<tr>
						<td colspan="5">등록된 데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${data.list}">
					<tr style='cursor:pointer;' onclick="location.href='view.do?no=${vo.no}'">
						<td>${vo.no }</td>
						<td class="title">
							<c:if test="${vo.nested > 0}">
								<c:forEach begin="1" end="${vo.nested}">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
								<img src="<%=util.Property.contextPath%>/img/ico_re.png">&nbsp;
							</c:if>
							${vo.title }
						</td>
						<td>관리자</td>
						<td>${vo.regdate }</td>
						<td>${vo.viewcount }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		<div class="pagenate clear">
			<ul class='page'>
				<c:if test="${data.prev ==true }">	<li><a href="index.do?page=${data.startPage-1 }"></a></li></c:if>
				<c:forEach var="v" begin="${data.startPage }" end="${data.endPage }">	
					<li><a href="index.do?page=${v}" <c:if test="${replyVO.page == v }">class="current"</c:if>>${v }</a></li>
				</c:forEach>
				<c:if test="${data.next ==true }">
					<li><a href="index.do?page=${data.endPage+1 }"></a></li>
				</c:if>
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
