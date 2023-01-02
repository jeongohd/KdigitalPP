<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="chat_list">
	<ul>
		<c:forEach var="chat" items="${list}">
			<li <c:if test="${loginInfo.member_no eq chat.member_no}">class="me"</c:if> style="margin-bottom:20px"> 
				<c:if test="${loginInfo.member_no ne chat.member_no}">
					<div style="margin: 0 0 5px 11px">
						<span>${chat.member_id}</span>
					</div>
				</c:if> 
				<span class="inner"> 
					<span style="display: block; padding: 10px 0">${chat.content}</span> 
					<span class="date"><fmt:formatDate value="${chat.reply_writedate}" pattern="yyyy-MM-dd HH:ss" /></span>
				</span>
			</li>
		</c:forEach>
	</ul>
</div>
