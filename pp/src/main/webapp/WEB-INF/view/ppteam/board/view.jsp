<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/pp/resources/css/reset.css" rel="stylesheet">
    <link rel="stylesheet" href="/pp/resources/css/style3.css"/>
    <link href="/pp/resources/css/view.css" rel="stylesheet">
    <link rel="shortcut icon" href=""> 
    <title>view</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c38ca43e39c04f28999aae344752a661"></script>
<style>
.up_btn{display:inline-block;font-size:25px;margin:0 10px;padding:5px 10px;border-bottom:2px solid #00939b}
.del_btn{display:inline-block;font-size:25px;margin:0 10px;border-bottom:2px solid #00939b;padding:5px 10px}
</style>
<body>
    <div id="wrap">
       <%@ include file="/WEB-INF/view/ppteam/common/subheader.jsp" %>
        <div class="content view">
            <div class="top">
                <span class="user">
                   <!-- 로그인한 사람 사진 말고 글쓴사람 사진으로 수정하기 -->
                   <h4 style="padding-top: 20px;">
                    <span class="user_img"><img src="/pp/img/${pic.m_filename_server}"></span>
                    <span>${data.board.id }</span>
                    </h4>
                </span>

                <span class="title">
                    ${data.board.title}
                </span>
                
                <span id="count">
                        <span><img src="/pp/img/viewCount.png"></span>
                        <span>${data.board.viewcount }</span>

                        <a href="javascript:clickBoardLike();" id="likeCount"></a>
                     
                        <a href="javascript:clickDislike();" id="dislikeCount"></a>
                </span>
            </div>

            <div class="category">
            <c:forEach items="${data.categoryList }" var="cate">
                <c:if test="${!empty cate.region_name }">
                <span>#${cate.region_name }</span>
                </c:if>
                <c:if test="${!empty cate.hashtag_name }">
                <span>#${cate.hashtag_name }</span>
                </c:if>
            </c:forEach>
            </div>
            <div id="mapRoom">
                  <div id="map" style="width:660px;height:500px;float:left;"></div>
                    <div id="section">
                  <div class="mkroom btn-makeclick"> 방 만들기
                  </div>
                  <c:if test="${empty data.roomList }">
                   <br>등록된 방이 없습니다.<br>
                   방을 생성하여 새로운 여행 친구들을 만나보세요:D
                  </c:if>
                  <c:if test="${!empty data.roomList }">
                     <div class="tt">
                     <table>
                     <colgroup>
                            <col width="*" />
                            <col width="80px" />
                            <col width="100px" />
                            <col width="100px" />
                            <col width="100px" />
                        </colgroup>
                         <tr>
                              <th>방제목</th>
                              <th>방장</th>
                              <th>시작일</th>
                              <th>종료일</th>
                              <th>참여인원</th>
                           </tr>
                           <c:forEach items="${data.roomList }" var="room">
                         <tr>
                            <td>
                               ${room.room_title}
                               <c:if test="${empty room.room_pwd }">
                               <img src="/pp/img/openRoom.png">
                               </c:if>
                               <c:if test="${!empty room.room_pwd }">
                               <img src="/pp/img/secretRoom.png">
                               </c:if>
                            </td>
                            <td>${room.roommaker_id}</td>
                            <td>${room.room_startdate}</td>
                            <td>${room.room_enddate}</td>
                            <td>
                               ${room.room_participant_count }명
                               <input type="hidden" value="room.room_no" class="no">
                               <input type="button" value="${room.room_participant_no > 0 ? '참여중' : '참여하기'  }" onClick='joinRoom("${room.room_pwd }", ${room.room_no });'>
                            </td>
                         </tr>
                           </c:forEach>
                     </table>
                     </div>
                  </c:if>
               </div>
            </div>

            <div class="course">
                <span class='title'>코스</span>
            <!-- 코스 설명 들어갈 부분 -->      
            <div class="write_detail">
               <div class="scroll"></div>
            </div>
            </div>
            
            

            <div id="footer" class="reply">
               <c:if test="${empty loginInfo.member_no}">
                 <input type="text" placeholder="댓글은 로그인 후 작성 가능합니다."readonly>
               </c:if>
               <c:if test="${!empty loginInfo.member_no}">
                <input type="text" name="content" id="content"  placeholder="댓글을 작성해주세요.">
                 <div class=replywrite">
                    <a href="javascript:goSave();">댓글 등록</a>
                 </div>
              </c:if>
              
               <!-- 댓글 나오는 부분 -->
                 <div id="commentArea"></div>
            </div>
         <c:if test="${loginInfo.member_no == data.board.member_no }">
         <div style="margin-bottom:50px">
         	<a href="/pp/board/updateView.do?board_no=${data.board.board_no}" class="up_btn">수정</a>
            <form name="delFrm" method="post" action="/pp/board/viewDelete.do" class="del_btn">
               <input type="hidden" name="board_no" value="${boardVO.board_no }">
               <input type="hidden" name="board_name" value="${boardVO.board_name }">
               <a href="javascript:viewDel()"><i class="fa-solid fa-trash-can"></i></a>
            </form>
         </div>   
         </c:if> 
         </div>
   </div>
   
   <!-- 방비밀번호 모달 -->
   <div class="roompwdmodal">
         <div class="modal-roompwdcontent">
            <a class="btn-roompwdclose" href="javascript:"><img src="/pp/img/close.png"></a>
         <h3>Enter Password</h3>
         <form action="/pp/room/pwdCheck.do" method="post">
            <input type="hidden" name="board_name" value="${data.board.board_name}">
            <input type="hidden" name="board_no" value="${data.board.board_no}">
            <input type="hidden" id="room_no" name="room_no" value="">
            <input type="text" name="room_pwd">
            <input type="submit" value="참여">
         </form>   
      </div>
   </div>


   <!-- 방만들기 모달 -->
   <div class="roommodal">
         <div class="modal-roomcontent">
         <a class="btn-roomclose" href="javascript:"><img src="/pp/img/close.png"></a>
         <h3>Make Room</h3>
         <input type="hidden" id="board_name" name="board_name" value="${data.board.board_name }">
         <input type="hidden" id="board_no" name="board_no" value="${data.board.board_no}">
         <input type="hidden" id="roommaker_id" name="roommaker_id" value="${loginInfo.id }">
         <input type="hidden" id="room_participant_no" name="room_participant_no" value="${loginInfo.member_no }">
         *방 제목 <input type="text" id="room_title" name="room_title" style="width:100%"><br>
         *방 내용 <textarea id="room_content" name="room_content" style="width:100%"></textarea><br>
         <b>[여행 시작날짜와 종료날짜를 선택해주세요]</b><br>
         *시작날짜 : <input type="date" id="room_startdate" name="room_startdate"> <br>
         *종료날짜 : <input type="date" id="room_enddate" name="room_enddate"  ><br>
         비밀번호 : <input type="password" id="room_pwd" name="room_pwd">
         <a class="btn-make" href="javascript:makeRoom();">방만들기</a>
      </div>
   </div> 
    
   <!-- 쪽지보내기 모달 -->
   <div class="msgmodal">
         <div class="modal-msgcontent">
         <a class="btn-msgclose" href="javascript:"><img src="/pp/img/close.png"></a>
         <h3>Send Message<img src="/pp/img/message.png"></h3>
         <input type="hidden" id="send_member_no" name="send_member_no" value="${loginInfo.member_no }" >
         <input type="hidden" id="receive_member_no" name="receive_member_no" value="">
         보내는 사람 <input type="text" name="send_member_id" value="${loginInfo.id }" readonly><br>
         받는 사람 <input type="text" name="receive_member_id" id="receive_member_id" value="" readonly>
         <input type="text" id="message_content" placeholder="보낼 메세지를 입력하세요." style="width:100%">
         <a class="btn-send" href="javascript:sendMessage();">보내기</a>
      </div>
   </div>  

   <!-- 댓글 수정 모달 -->
   <div class="modal">
         <div class="modal-content">
         <a class="btn-close" href="javascript:"><img src="/pp/img/close.png"></a>
         <h3>Edit Reply</h3>
         <input type="text" id="replyUpdate" placeholder="수정할 내용을 입력하세요." style="width:100%">
         <input type="hidden" id="modal_rno" value="">
         <a class="btn-edit" href="javascript:commentEdit();">수정</a>
      </div>
   </div> 
   

<!--  사용하다가 에러 안나면 지우자.
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
   <script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
   <script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>

-->   
   
   
   <script type='text/javascript' src="/pp/js/map.js"></script>
   <script type='text/javascript' src="/pp/js/mapView.js"></script>
    
    <script>
    $(function(){
         //댓글 1페이지 불러오기
         getComment(1); 
         clickBoardLike();
         clickDislike();
      
         getAllCourse('view'); 
      });
    
    var pic =1;
   //원래작성된 글불러오는용
   function updatebox(index,places,img1,img2){
      count++;
      var html ='<div class="set">'
         html +='<div class="map_list">'
         html += '<span class="markerbg marker_' + (index+1) + '"></span>'+
                  '<h5>' + places.place_name + '</h5>'+
                     '<span class="info">'+
                     '<span class="tel"><i class="fa\-solid fa\-phone"></i>' + places.phone  + '</span>' +
                     '<span><i class="fa-solid fa-location-dot"></i>' +  places.address_name  + '</span>'
         html +=   '</span>' ;
         html +="</div>"
           html +='    <textarea placeholder="내용 입력" name="contents" readonly>'+places.content+'</textarea>'
           html +='    <div class="pic_wrap">'
           html +='        <div class="pic">'
            pic++;
           html +='             <img src="/pp/img/'+img1+'">'
           html +='        </div>'
           html +='          <div class="pic">'
            html +='             <img src="/pp/img/'+img2+'">'
           html +='         </div>'
           html +='    </div>'
           html +='</div>'
           pic++;
         $('.scroll').append(html);
   }
   
   $('.btn-makeclick').click(function(){
      $('.roommodal').fadeIn();
   })
   
   $('.btn-roomclose').click(function(){
      $('.roommodal').fadeOut();
      $("#room_title").val('');
      $("#room_content").val('');
      $("#room_startdate").val('');
      $("#room_enddate").val('');
      $("#room_pwd").val('');
   })
   $('.btn-roompwdclose').click(function(){
      $('.roompwdmodal').fadeOut();
      $("#room_pwd").val('');
   })
   
   var login_member_no;
   <c:if test="${empty loginInfo.member_no }">
       login_member_no = -1
   </c:if>
   <c:if test="${!empty loginInfo.member_no }">
       login_member_no = ${loginInfo.member_no}
   </c:if>
   console.log(login_member_no);
   
       var likeCheck = -1 ;
       var dislikeCheck = -1;
       
       function joinRoom(pwd, no){
          if(confirm('방에 참여하시겠습니까?')){  
             if(pwd){
                $('#room_no').val(no);
                $('.roompwdmodal').fadeIn();
             } else{
                location.href="../room/room.do?room_no="+no;
                
             }
          }
          
       }
       
       function makeRoom(){
          var board_name = $("#board_name").val();
          var board_no = $("#board_no").val();
          var room_participant_no = $("#room_participant_no").val();
          var roommaker_id = $("#roommaker_id").val();
          var room_title = $("#room_title").val();
          var room_content = $("#room_content").val();
          var room_startdate = $("#room_startdate").val();
          var room_enddate = $("#room_enddate").val();
          var room_pwd = $("#room_pwd").val();
            if(confirm("방을 생성하시겠습니까?")){
             $.ajax({
                url : '/pp/room/write.do',
                type : 'post',
                data : {
                   board_name : board_name,
                   board_no : board_no,
                   roommaker_id : roommaker_id,
                   room_title : room_title,
                   room_content : room_content,
                   room_startdate : room_startdate,
                   room_enddate : room_enddate,
                   room_pwd : room_pwd,
                   room_participant_no : room_participant_no
                   
                },
                success : function(res){
                      if(res==1){
                         alert('새로운 방이 생성되었습니다.');
                      } else {
                         alert('방 생성 오류');
                      }
                      $(".roommodal").fadeOut();
                      $("#room_title").val('');
                      $("#room_content").val('');
                      $("#room_startdate").val('');
                      $("#room_enddate").val('');
                      $("#room_pwd").val('');
                      window.location.reload();
                }
             })
          } 
          
       }
       
       
       function sendMessage(){
          var send_member_no = $("#send_member_no").val();
          var receive_member_no = $("#receive_member_no").val();
          var message_content = $("#message_content").val();
            if(confirm("쪽지를 전송하시겠습니까?")){
             $.ajax({
                url : '/pp/message/sendMessage.do',
                data : {
                   send_member_no : send_member_no,
                   receive_member_no : receive_member_no,
                   message_content : message_content
                },
                success : function(res){
                      if(res==1){
                         alert('쪽지가 정상적으로 전송되었습니다.');
                      } else {
                         alert('쪽지 전송 오류');
                      }
                      $('.msgmodal').fadeOut();
                      $("#message_content").val('');
                }
             })
          } 
       }
       
       function getComment(page){
       
          $.ajax({
             url : "/pp/reply/list.do",
             data : {
                'board_no' : ${data.board.board_no},
                'board_name' : '${data.board.board_name}',
                'page' : page,
                member_no : login_member_no
             },
             success : function(res){
                
                $("#commentArea").html(res);
             },
             error : function(e){
                console.log(e);
             }
             
          });
          

       };
       
        
        
       function goSave(){
           if(confirm('댓글을 작성하시겠습니까?')){
              var board_name = $("#board_name").val();
              var board_no = $("#board_no").val();
             $.ajax({
                url : "/pp/reply/insert.do",
                data : {
                   board_no : board_no, 
                   board_name : board_name,
                   content : $("#content").val(),
                   member_no : login_member_no,
                   member_id : '${loginInfo.id}'
                },
                success : function(res){
                      if(res=="success"){
                         alert('댓글이 정상적으로 등록되었습니다.');
                      } else{
                         alert('댓글 등록 실패');
                      }
                      getComment(1); //댓글 저장후 1페이지 다시 불러옴
                      $("#content").val('');
                      
                },
                error : function(e){
                   console.log(e);
                   console.log("Gosave error");
                }
                
             });
          } 
       }
       
       
       function viewDel(){
          if(confirm("글을 삭제하시겠습니까?")){
             delFrm.submit();
          }
       }
       
       function commentDel(no){
          if(confirm("댓글을 삭제하시겠습니까?")){
             $.ajax({
                url : '/pp/reply/delete.do?reply_no='+no,
                success : function(res){
                      alert('댓글이 정상적으로 삭제되었습니다.');
                      getComment(1);
                }
                      
             })
          }
       }
       function setReply_no(no){
          $('.modal').fadeIn();
          $("#modal_rno").val(no);
       }

       
       
       function commentEdit(){
          var reply_no = $("#modal_rno").val();
          var content = $("#replyUpdate").val();
          var page = $("#page").val();
          console.log(page);
            if(confirm("댓글을 수정하시겠습니까?")){
             $.ajax({
                url : '/pp/reply/update.do',
                data : {
                   reply_no : reply_no,
                   content : content
                },
                success : function(){
                      alert('댓글이 정상적으로 수정되었습니다.');
                      getComment(page);
                      $('.modal').fadeOut();
                }
                      
             })
          }  
       }
       
   
       function clickBoardLike(){
          $.ajax({
             url : "/pp/board/initBoardLike.do",
             method : "post",
             data : {
                'board_no' : ${data.board.board_no},
                'board_name' : '${data.board.board_name}',
                'member_no' : login_member_no,
                likeCheck : likeCheck
             },
             success : function(i){
               if(i==0){
                  $("#likeCount").text("♡");
               } else if(i==1){
                  $("#likeCount").html("♥");
               }
               likeCheck = i;
             },
             error : function(e){
                console.log(e);
             }
             
          });
          
       }
       
       function clickDislike(){
          $.ajax({
             url : "/pp/board/clickDislike.do",
             method : "post",
             data : {
                'board_no' : ${data.board.board_no},
                'board_name' : '${data.board.board_name}',
                member_no : login_member_no,
                dislikeCheck : dislikeCheck
             },
             success : function(i){
                if(i==0){
                  $("#dislikeCount").html("<img src='/pp/img/dislike.png'>");
               } else if(i==1){
                  $("#dislikeCount").html("<img src='/pp/img/checkDislike.png'>");
               }
                dislikeCheck = i;
               
             },
             error : function(e){
                console.log(e);
             }
             
          });
        
       }

    
    </script>
     
</body>
</html>