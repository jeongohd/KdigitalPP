<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>omok sole play.jsp</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle:wght@700&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="../resources/css/omok/style.css" rel="stylesheet">

</head>
<body>
	<div class="wrap">
		<div class="cnt_wrap play">
			<h2>Enjoy Game</h2>
			<c:if test="${empty id }"><h5>( 비회원 )</h5></c:if>
			<c:if test="${not empty id }"><h4>[ ${id } ]</h4></c:if>
		    <div id="div"></div>
		    <div class="endbtn">
		    	<form id="end" action="end" method="post" align="right">
		    		<input type="hidden" name="oneGame" value="${oneGame }">
		    		<input type="submit"  value="게임 종료">
		   		</form>
	   		</div>
   		</div>
   	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../resources/js/print.js"></script>
<script type="text/javascript">
  	var oneGame = ${oneGame };
</script>
</body>
</html>