<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                    <table class="list">
                      <div>[나의 회원번호 : <b>${loginInfo.member_no}</b>]</div>
                      <div>[나의 회원ID :<b>${loginInfo.id}</b>]</div>
                      <br>
                    	<div>[댓글목록]</div>
                      <p><span><strong>총 댓글 : ${comment.totalCount}개</strong>  |  ${commentVO.page }/${comment.totalPage }페이지</span></p>
                      <thead>
			            <tr>
			            	  <th scope="col" >회원번호</th>
			            	  <th scope="col" >회원ID</th>
			              <th scope="col" >댓글내용</th>
			              <th scope="col" >댓글등록일</th>
			              <th scope="col" >댓글수정일</th>
			            </tr>
			            	<colgroup>
                            <col width="100px" />
                            <col width="100px" />
                            <col width="200px" />
                        </colgroup>
			          </thead>
                        <tbody>
						<c:if test="${empty comment.list}">
                            <tr>
                                <td class="first" colspan="8">등록된 댓글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:if test="${!empty comment.list}">
                        <c:forEach var="vo" items="${comment.list}">     
                            <tr>
                                <td class ="member_no" style="text-align:center;">${vo.member_no}</td>
                                <td class="id" style="text-align:center;">
                                <!--  test ="${loginInfo.member_no == vo.member_no} -->
                                <c:choose>
                         			<c:when test="${not empty loginInfo.id && loginInfo.member_no == vo.member_no}">
                         			${loginInfo.id }
                         			</c:when>
                         			<c:otherwise>
                         			${vo.id}
                         			</c:otherwise>
                                </c:choose>
     							</td>
                                <td class="txt_l" style="text-align:center;">
                                ${vo.content}
                                <a href="javascript:commentList(${vo.gno});" class="commentList">[답글](${vo.replycount})</a>
                                	<div class="messageBox" style="display:none;" >
				                  	 <form id="commentFrm${vo.gno }" >
									    <input type="text" class="content2" style="width:70%" placeholder="답글을 작성해주세요."><a href="javascript:goSave2(${vo.gno });">작성 </a>
								   	</form>
									    <div id="commentList${vo.gno}"></div>
								</div>
                                </td>
                                <td class="date"><fmt:formatDate value="${vo.reply_writedate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td class="date"><fmt:formatDate value="${vo.reply_updatedate}" pattern="yyyy-MM-dd HH:mm"/>
                                <c:if test="${loginInfo.member_no == vo.member_no }">
                                <a href="javascript:commentDel(${vo.reply_no });">[삭제]</a>
                                <a href="javascript:fullsetReply_no(${vo.reply_no });">[수정]</a>
                                </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <div class="pagenate clear">
                        <ul class='paging'>
                        <c:if test="${comment.prev == true }">
                        	<li><a href="javascript:getComment(${comment.startPage-1 })"></a><</li>
                        </c:if>
                        <c:forEach var="p" begin="${comment.startPage }" end="${comment.endPage }">
                            <a href='javascript:getComment(${p});' <c:if test="${commentVO.page == p }">class='current'</c:if>>${p }</a>
                        </c:forEach>
                        <c:if test="${comment.next == true }">
                        	<li><a href="javascript:getComment(${comment.endPage+1 })">></a>
                        </c:if>
                        </ul> 
                    </div>
                <script>
                	//해당 댓글에 달린 답글 출력
                    function commentList(gno){
                		$.ajax({
                			url : "/pp/comment/commentList.do",
                			data : {
                				board_no : ${commentVO.board_no}, 
                				board_name : '자유게시판',
                				gno : gno,
                				member_no : ${loginInfo.member_no},
                				member_id : "${loginInfo.id}"
                			},
                			success : function(res){
                					console.log(res.length);
                					console.log(res);
                					console.log(res[0]);
                					
                					var html="";
                					if(res.length == 0){
                					} else {
                						html += "<table border='1' style='width: 600px'>";
                						html += "<tr>";
                						html += "	<th>id</th>";
                						html += "	<th>내용</th>";
                						html += "	<th>작성날짜</th>";
                						html += "</tr>";
                						for(i=0;i<res.length;i++){
                							html += "<tr>";
                							html += "	<td style='text-align:center;'>"+res[i].member_id;
                							html += "	<td style='text-align:center;'>"+res[i].content;
                							if(login_member_no == res[i].member_no){
                								html += "	<a href='javascript:commentDel("+res[i].reply_no +");'>[삭제]</a></td>";
                							}
                							html += "	<td style='text-align:center; height:50px;'>" + res[i].reply_writedate_str + "</td>";
                							
                							html += "</tr>";
                						}
                						html += "</table>";
                					}
                	
                					$("#commentList"+gno).html(html); 
                				
                					
                			},
                			error : function(e){
                				console.log(e);
                				console.log("답글출력 에러!!");
                			}
                			
                		});
                		
                  	}
                	
	                	//답글 작성
	                  	function goSave2(gno){
	                  		console.log($("#commentFrm"+gno+" .content2").val());
	                  		console.log(gno);
	                		if(confirm('답글을 작성하시겠습니까?')){
	                			$.ajax({
	                				url : "/pp/comment/reply.do",
	                				data : {
	                					board_no : ${commentVO.board_no}, 
	                					board_name : '자유게시판',
	                					content : $("#commentFrm"+gno+" .content2").val(),
	                					gno : gno,
	                					member_no : ${loginInfo.member_no},
	                					member_id : '${loginInfo.id}'
	                				},
	                				success : function(res){
	                						if(res==="success"){
	                							alert('답글이 정상적으로 등록되었습니다.');
	                						} else{
	                							alert('답글 등록 실패');
	                						}
	                						getComment(1); //댓글 저장후 1페이지 다시 불러옴
	                						$("#commentFrm"+gno+" .content2").val('');
	                						
	                				},
	                				error : function(e){
	                					console.log(e);
	                					alert("답글 작성 에러!!");
	                				}
	                				
	                			});
	                		} 
	                	}    
	                	
	                	var login_member_no;
	                	<c:if test="${empty loginInfo.member_no }">
	                    	login_member_no = -1
	                	</c:if>
	                	<c:if test="${!empty loginInfo.member_no }">
	                    	login_member_no = ${loginInfo.member_no}
	                	</c:if>
	                	console.log(login_member_no);
	                	
	                //댓글 누르면 답글 보였다 숨기기
	                	$('.commentList').click(function(){
	                		$(this).next().toggle();
	                	});
                 </script>