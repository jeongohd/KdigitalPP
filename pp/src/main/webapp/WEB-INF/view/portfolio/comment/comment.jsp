<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.bbs .list td{border-right:none}
.bbs .list .txt_l{padding-left:50px}
td span{display:none}
.close{color:red;margin:0 10px}
</style>
<script>

$('.delete').click(function(){
	var password = prompt('비밀번호를 입력해주세요');
	var cno = $(this).parents('tr').find('.no').html()
	var mypass=$(this).siblings('span').html()
	if(password == mypass){
		commentDelete(cno);
	}else{
		alert("비밀번호를 확인해주세요")
	}
})


$('.comment').click(function(){
	var gno = $(this).find("span").html();
	var html ="<tr>"
		html +="	<input type='hidden' name='gno' value="+gno+">"	
		html +="   	<td class='txt_l' colspan='3'>"	 
		html +="    	<div class='com'>"
		html +="			이름<input type='text' id='name' name='name' value=''>"
		html +="			비밀번호<input type='password' id='password' name='password' value=''>"		
		html +="		</div>"	
		html +="		 <textarea name='comment'></textarea>"	
		html +="	</td>"	
		html +="	<td><button type='button' class='commentSave'>저장</button><b class='close'>X</b></td>"	
		html +="</tr>"
	$(this).parents('tr').after(html);
});

$(document).on("click",'.commentSave',function(){
	if($('.com #password').val() != ''){
		$('.commentSave').prop("type","submit")
	}
	if($('.com  #password').val()==''){
		alert('비밀번호를 입력하세요')
	};
});

$(document).on("click",".close",function(){
	$(this).parents("tr").hide();
})

</script>
  <p><span><strong>총 ${data.totalCount }개</strong>  |  ${commentVO.page }/${data.totalPage }페이지</span></p>
  					<form action="/pp/comment/commentInsert.do" method="get" id="commentInsert">
  					<input type="hidden" name="boardno" value="${commentVO.no }">

	                    <table class="list">
	                        <colgroup>
	                            <col width="*" />
	                            <col width="100px" />
	                            <col width="100px" />
	                            <col width="150px" />
	                        </colgroup>
	                        <tbody>
	                    	<c:if test="${empty data.list}">
	                    	 	<tr>
	                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
	                            </tr>
	                    	</c:if>
	                    	<c:forEach var="vo" items="${data.list }" >
	                    		<tr>
	                                <!-- <td class="no">${vo.cno }</td> -->
	                                <td class="txt_l">
	                                	<c:if test="${vo.nested != 0}">&nbsp;&nbsp;&nbsp;└</c:if>
	                                	${vo.comment }
	                                </td>
	                                <td class="writer">${vo.name}</td>
	                                <td class="date"><fmt:formatDate value="${vo.cregdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                                <td>
	                                	<c:if test="${vo.nested == 0 }"><a hef="#" class="comment">답글</c:if><span>${vo.gno }</span></a>
	                                	<a href="#" class="update">수정</a>
	                                	<a href="#" class="delete">삭제</a><span class="gno">${vo.gno }</span>
	                                </td>
	                            </tr>
	                    	</c:forEach>      
	                        </tbody>
	                    </table>
                    </form>
                    <div class="pagenate clear">
                        <ul class='paging'>
                        	<c:if test="${data.prev ==true }">
                        		<li><a href="javascript:getCommentList(${data.startPage-1})">&lt;</a></li>
                        	</c:if>
                        	<c:forEach var="p" begin="${data.startPage}" end="${data.endPage}">
                            <li><a href='javascript:getCommentList(${p})' <c:if test="${data.page == p }">class='current'</c:if>>${p }</a></li>
                            </c:forEach>
                            <c:if test="${data.next ==true }">
                        		<li><a href="javascript:getCommentList(${data.endPage+1})">&gt;</a></li>
                        	</c:if>
                        </ul> 
                    </div>