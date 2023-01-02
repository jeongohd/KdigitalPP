<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>test</h2>
<c:forEach var="data" items="${list}" varStatus="status">
	${status.index } ${data.name} ${data.email} ${data.password} ${data.regdate}
	<c:if test="${!empty data.filename}">
	<img src="<c:url value="/upload/test/${data.filename}"/>">
	</c:if>
	<br>
</c:forEach>