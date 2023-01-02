<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h2>CRUD 게시판</h2>
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
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
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
					<tr>
						<td>${vo.no}</td>
						<td class="title"><a href="view.do?no=${vo.no}">${vo.title}</a></td>
						<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-mm-dd HH:mm"></fmt:formatDate></td>
						<td>${vo.viewcount }</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
            <div class="bbsSearch">
                 <form method="get" name="searchForm" id="searchForm" action="<%=request.getContextPath() %>/board.do">
                     <span class="srchSelect">
                         <select id="stype" name="stype" class="dSelect" title="검색분류 선택">
                             <option value="all">전체</option>
                             <option value="title">제목</option>
                             <option value="content">내용</option>
                         </select>
                     </span>
                     <span class="sword">
                         <input type="text" id="sval" name="sword" value="${param.sword }"  title="검색어 입력">
                         <input type="submit" id="" value="검색" title="검색">
                     </span>
                 </form>
             </div>	
		<div class="pagenate clear">
			<ul class='page'>
				<c:if test="${data.prev ==true }">
					<li><a href="board.do?page=${data.startPage-1 }"></a></li>
				</c:if>
				<c:forEach var="v" begin="${data.startPage }" end="${data.endPage }">	
					<li><a href="board.do?page=${v}" <c:if test="${boardVO.page == v }">class="current"</c:if>>${v }</a></li>
				</c:forEach>
				<c:if test="${data.next ==true }">
					<li><a href="board.do?page=${data.endPage+1 }"></a></li>
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
