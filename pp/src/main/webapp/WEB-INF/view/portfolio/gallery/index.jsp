<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=util.Property.title %></title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
    <style>
        *{margin: 0;padding: 0;font-family: 'Malgun Gotic',sans-serif;}
        a{text-decoration: none;}
        img{border:0}
        li{list-style: none;}
        /*헤더*/
        #main-header{height: 70px;background: #faf7f7;position: relative;border-top: 1px solid #cfcaca;box-shadow: 1px 3px 3px rgb(34 25 25 / 40%);}
        .header-title{position: absolute;width: 200px;height: 40px;left: 50%;margin-left: -100px;text-indent: -9999px;background-size:contain;}
       	.write_btn{display:inline-block;float:right;border-radius:5px;border: 1px solid #ccc;background:#f0f0f0;margin-left:15px;padding:6.5px}
        /*풀다운 메뉴*/
        .outer-menu{float: left;width: 100px;height: 20px;line-height: 20px;padding: 10px 0;position: relative;text-align: center;font-size: 13px;font-weight: bold;z-index: 9999;}
        .outer-menu:hover{background: #e1dfdf;}
        .inner-menu{display: none;background: #fff;margin-top: 10px;width: 100%;border-top: 1px solid #cccaca;box-shadow: 0 2px 4px  rgba(34,25,25,0.5);}
        .inner-menu a{display: block;padding: 5px 10px;z-index: 5000;;}
        .inner-menu a:hover{background: #e1dfdf;}
        /*내비게이션 메뉴*/
        #main-navigation{height: 30px;background: #faf7f7;border-top:1px solid #cfcaca;box-shadow:  1px 3px 3px rgba(34, 25, 25, 0.4);}
        #main-navigation>ul{overflow:hidden;text-align: center;}
        #main-navigation>ul>li{display: inline;padding: 0 5px;line-height: 30px;font-size: 13px;color: #524d4d;text-align: 0 1px 1px white;}
        #main-navigation>ul>li:hover{background: #e1dfdf;border-radius: 2px;}
        /*검색양식*/
        .header-search-form{position:absolute;top:50%;left:50%;transform: translate(-50%, -50%);padding:7px}
         .header-search-form form{display:inline-block}
        .input-search{display: block;float: left;background-color: #fff;border: 1px solid #ccc;border-radius: 15px 0 0 15px;box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);width:200px;height:36px;padding: 0 0 0 10px;font-size: 12px;color: #555;}
        .input-search:focus{border-color: rgba(82, 168,236,0.8);outline: 0;box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);}
        .input-search-submit{display: block;float: left;width: 50px;height:36px;border-radius: 0 15px 15px 0;border:1px solid #ccc;margin-left: -1px;vertical-align: top;display: inline-block;}
        /*종이스타일*/
        .paper{width:250px;margin-top:16px;padding:0;font-size: 11px;background: #fff;font-size:13px}
        .paper .paper-holder{overflow:hidden;border-radius:13px}
        .paper-content{padding:5px;overflow: hidden;}
        .paper-description b{display:inline-block;margin:10px 0;font-size:14px}
        .paper-link{display: block;float: left;}
        .paper-text{float:left;width: 150px;margin-left: 10px;}
        /*섹션*/
        #main-section{margin:0 auto}
        @media(max-width:919px){
            #main-section{width: 690px;}
        }
        @media(max-width:930px) and (max-width:1149px){
            #main-section{width: 920px;}
        }
        @media(max-width:1150px) and (max-width:1379px){
            #main-section{width: 1150px;}
        }
        @media(max-width:1380px){
            #main-section{width: 1380px;}
        }
        /*라이트박스*/
        #darken-background{position: absolute;top:0;left: 0;right: 0;height: 100%;display: none;background: rgba(0,0,0,0.9);z-index: 10000;overflow-y: scroll;}
        #light-box{overflow:hidden;width:800px;margin:100px auto;padding: 15px;border:1px solid #333;border-radius: 5px;background: white;box-shadow: 0 5px 5px rgba(34,25,25,0.4);text-align: center;}
        .user-information{overflow:hidden;text-align: left;}
        .user-information-image{float: right;width:78%;}
        .user-information-text{float: left;width:20%;margin-right:2%}
        #light-box-splitter{margin: 10px 0;}
    </style>
    <script>
		$(function(){
			  $('.outer-menu').hover(function(){
                  $(this).find('.inner-menu').css('display','block')
              },function(){
                  $(this).find('.inner-menu').css('display','none')
              });

              $('#main-section').imagesLoaded(function(){
                  $('#main-section').masonry({
                      itemSelector:'.paper',
                      columnWidth: 90,
                      isAnimated: true
                  })
                  
              });

              function showLightBox(){
                  $('#darken-background').show();
                  $('#darken-background').css('top',$(window).scrollTop());
                  $('body').css('overflow','hidden')
              }

              function hideLightBox(){
                  $('#darken-background').hide();
                  $('body').css('overflow','');
              }

              $('#darken-background').click(function(){
                  hideLightBox();
              });
              $('.paper').click(function(){
                  showLightBox();
              });
              $('#light-box').click(function(event){
                  event.stopPropagation();
              });
		});
		
    	function galleryList(no){
         	$.ajax({
         		url:"/pp/gallery/view.do",
         		type:"get",
         		data:{
         			no:no
         		},
         		success:function(data){
        			$(".user-information-image img").attr("src","../img/gallery/"+data.filename_real)
        			$('.user-imformation-text h3').html(data.title);
         		    $(".user-imformation-text p").html(data.content);
				},
         		error:function(){
     				alert("에러발생");
     			}
         	});
    	 };


    </script>
</head>
<body>
    <header id="main-header">
        <div class="header-search-form">
            <form>
                <input type="search" class="input-search" name="sword" value="${param.sword}">
                <input type="submit" class="input-search-submit" value="검색">
            </form>
            <a href="./write.do" class="write_btn">글작성</a>
        </div>
        <h1 class="header-title">Interest</h1>
    </header>
    <section id="main-section">
    	<c:forEach var="vo" items="${data }">
	        <div class="paper">
	            <div class="paper-holder">
	                <a href="javascript:galleryList(${vo.no });"><img style="width:250px" src="../img/gallery/${vo.filename_real }"></a>
	            </div>
	            <div class="paper-content">
	                <p class="paper-description"><b>${vo.title}</b></p>
	                <p class="paper-text">${vo.content }</p>
	            </div>
	        </div>
        </c:forEach>
    </section>
    <!--라이트박스-->
    <div id="darken-background">
        <div id="light-box">
            <div class="user-information-text">
                 <h3 style="margin-bottom:15px">제목</h3>
                 <p>내용</p>
            </div>
            <div class="user-information-image">
                <img src="" style="width:100%;border:1px solid #111">
            </div>


        </div>
    </div>
</body>
</html>