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
	<h2>로그인 되었습니다.</h2>
	<p>${joinVO.id}님 반갑습니다.</p>
</div>
<!--//boardWrap-->
</body>
</html>
