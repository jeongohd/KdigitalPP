<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert('${msg}')//request저장소에서 꺼내서 가지고옴 /controller에서 저장할 예정
	<c:if test="${!empty url}">
		location.href="${url}";
	</c:if>
	<c:if test="${empty url}">
		history.back();
	</c:if>
</script>