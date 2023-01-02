<%@ page contentType="text/css; charset=utf-8" %>
@charset "utf-8";
/* CSS Document */ 

a:hover{transition: 0.5s !important;}

/* ==================================================
	공통레이아웃
================================================== */
#wrap{width:100%; position:relative; margin:0; height:100%}

/* ==================================================
	header
================================================== */
#header{width:100%; position:relative; z-index:99; width:100%; margin:0; padding:0; height:60px;}
#header h1{position:absolute; left:10px; top:5px;}
#header .topmenu{position:absolute; right:10px; top:20px;}
#header .topmenu > li{float:left; width:auto; position:relative; margin-left:20px; }
#header .topmenu > li.logout{position:relative;}
#header .topmenu > li.logout a{font-weight:600; padding:0 10px;}
#header .topmenu > li.homepage{}
#header .topmenu > li.logout:after{content:""; position:absolute; right:-5px; top:5px; height:12px; background:#e6e6e6; width:1px;}

/* ==================================================
	contents
================================================== */
#container{clear:both; position:relative; width:100%; height:100%;  margin-top:-62px; padding-top:62px;overflow:hidden}
#menuWrap{position:relative; width:15%; float:left; min-height:100%;background:#4a62f8;position:relative;color:#fff;border-radius: 0 70px 0 0}
#contentsWrap{position:relative; float:left; height:100%;width:85%}
#menuWrap .allmenu{background:url(<%=util.Property.contextPath%>/img/ico_allmenu.png) no-repeat 20px center; height:58px;border-radius: 0 70px 0 0; line-height:58px;color:#fff; font-size:16px; padding-left:50px; position:relative}
#menuWrap .allmenu .allmenu_con{position:fixed; left:0; width:100%; top:117px; background:#f1f4fb; z-index:99; display:none; padding:20px 30px 40px 50px;    border-bottom: 1px solid #eee;color:#161f2c}
#menuWrap .allmenu .allmenu_con dl{float:left; /*width:15.666%;*/ margin-right:2%;}
#menuWrap .allmenu .allmenu_con dt{border-bottom:1px solid #494b55; font-size:18px; font-weight:500;  height:50px; line-height:50px; vertical-align:middle;}
#menuWrap .allmenu .allmenu_con dd{font-size:14px; padding:5px 0; margin:0; height:100%; line-height:100%; vertical-align:middle;}
#menuWrap .allmenu .allmenu_con dd.frist{padding-top:20px; border-top:1px solid #656872;}
#menuWrap .allmenu .allmenu_con dd a:hover{color:#fe362c; font-weight:600;}
#menuWrap .login{background:#ffffff; padding:20px; border-bottom:1px solid #dddddd; position:relative; overflow:hidden;}
#menuWrap .login fieldset{position:relative;}
#menuWrap .login input{color:#484b56; border:none; border-bottom:1px solid #484b56; font-size:13px; width:110px; height:30px;}
#menuWrap .login input.loginBtn{background:#484b56; font-size:12px;color:#fff; font-weight:600; width:62px; height:62px; padding:0; text-align:center; position:absolute; top:0; right:0;}
#menuWrap .login li{float:left; margin-right:4px; margin-top:15px;}
#menuWrap .login li:last-child{margin-right:0;}
#menuWrap .login li a{display:block; font-size:12px; color:#515151; border:1px solid #dddddd; background:#f5f5f5; padding:4px 5px;}

#menuWrap .bookmark{background:#ffffff; padding:20px; border-bottom:1px solid #dddddd;}
#menuWrap .bookmark p{background:url(<%=util.Property.contextPath%>/img/ico_bookmark.png) no-repeat 0 center; color:<%=util.Property.color%>; padding:0 20px; font-size:15px; font-weight:600; width:100%; position:relative;}
#menuWrap .bookmark p a{border:1px solid <%=util.Property.color%>; border-radius:5px; display:inline-block; font-size:14px; font-weight:400; padding:0 8px; margin-left:3px;}
#menuWrap .bookmark p span{position:absolute; right:0;}
#menuWrap .bookmark ul{margin-top:10px;}
#menuWrap .bookmark li{background:url(<%=util.Property.contextPath%>/img/menu_2dep_off.png) no-repeat 20px center; padding:4px; padding-left:35px; font-size:14px; cursor:pointer;}
#menuWrap .gnb{}
#menuWrap .gnb dt{background:url(<%=util.Property.contextPath%>/img/menu_off.png) no-repeat 20px center; padding:15px 20px; padding-left:45px; color:#fff; font-size:15px; font-weight:400; /*border-top:1px solid #ffffff; border-bottom:1px solid #dddddd*/;}
#menuWrap .gnb dt.on{background:<%=util.Property.color%> url(<%=util.Property.contextPath%>/img/menu_on.png) no-repeat 20px center; color:#fff;}
#menuWrap .gnb dd{background:#4a62f8; padding:3px 9px; display:none;}
#menuWrap .gnb dd ul{background:#f5f8ff;border-radius: 18px;padding:8px 0}
#menuWrap .gnb dd li{color:#74778e;background:url(<%=util.Property.contextPath%>/img/menu_2dep_off.png) no-repeat 25px center; padding:4px; padding-left:40px; font-size:15px;}
#menuWrap .gnb dd li.on{background:url(<%=util.Property.contextPath%>/img/menu_2dep_on.png) no-repeat 25px center; color:<%=util.Property.color%>; font-size: 16px; font-weight: 500;}
#menuWrap .menuclose{position:absolute;right: -13px; top:50%; margin-top:-67px; z-index:2; cursor:pointer;}
#menuWrap  .copy{color:#d5dbea; font-size:12px; font-weight:100; padding:20px;}

.tabWrap{position:relative;width: 100%; height:58px; border-bottom:1px solid #2c4b48;padding:7px 7px 0; overflow:hidden; }
.tabWrap .tab{float:left; position:relative; width:900px; height:50px; overflow:hidden; }
.tabWrap .tab li{float:left; width:auto; padding:8px 22px 8px 8px; height:50px; border:1px solid #dddddd; color:#74767b; background:#fff; font-size:13px; margin:0;  border-bottom:0;border-radius:10px 10px 0 0; position:relative; line-height:16px; cursor:pointer;}

.tabWrap .tab li.on{background:<%=util.Property.color%>; border:1px solid <%=util.Property.color%>; border-bottom:none; color:#fff; }
.tabWrap .tab li.line1{line-height:30px; vertical-align:middle;}
.tabWrap .tab li.line1 span{line-height:10px;}
.tabWrap .tab li span{position:absolute; right:8px; top:8px; line-height:10px;}
.tabWrap .tabNavi{float:right; width:60px;}
.tabWrap .tabNavi li{float:left; padding-left:4px; line-height:40px; cursor:pointer;}

.contents{position:relative; width:100%;padding:0 25px;overflow-y:scroll;height:800px}
.btnTop{position:fixed; bottom:10px; right:10px; z-index:999;}
.btnTop a{width:40px; height:40px; display:block; border:1px solid rgba(116,118,123,0.6); background:rgba(255,255,255,0.6); text-align:center; line-height:30px;}

/* 메뉴 */
.gnb_menu {cursor:pointer;}
.gnb_submenu > ul > li {cursor:pointer;}


/* ==================================================
	footer
================================================== */


/* ==================================================
	main
================================================== */
.main {position:relative; width:100%; overflow:hidden; margin-top:22px; }
.main .box{border:1px solid #dddddd; padding:15px 25px 20px; margin-bottom:30px; position:relative; width:100%; }
.main .box h2{color:<%=util.Property.color%> !important; font-size:18px; font-weight:600;}

.scheduleSearch > div{padding-top:10px; clear:both;}
.scheduleSearch .date input[type=text]{width:160px;}
.scheduleSearch .date input[type=button]{width:32px; height:32px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_calender.png') no-repeat center center;}
.scheduleSearch .search{width:100px; border:none; height:32px; background:#515151 url('<%=util.Property.contextPath%>/img/btn_search.png') no-repeat 18px center; padding:0; padding-left:38px; width:85px; color:#fff !important; font-size:14px; }
.scheduleSearch label.txt_l{float:left; color:#161f2c; font-weight:600; line-height:32px; vertical-align:middle; font-size:15px; width:60px; margin-right:10px;}
.scheduleSearch .wid50{float:left;}
.scheduleSearch .space10{display:inline-block; width:10px;}
.scheduleSearch .space20{display:inline-block; width:20px;}


.linkSearch > div{padding-top:10px; clear:both;}
.linkSearch .search{width:100px; border:none; height:32px; background:#515151 url('<%=util.Property.contextPath%>/img/btn_search.png') no-repeat 18px center; padding:0; padding-left:38px; width:85px; color:#fff !important; font-size:14px; }

.linkSearch label.txt_l{float:left; color:#161f2c; font-weight:600; line-height:32px; vertical-align:middle; font-size:15px; width:100%; margin-right:10px;}
.linkSearch .wid50{float:left;}
.linkSearch .space10{display:inline-block; width:10px;}
.linkSearch .space20{display:inline-block; width:20px;}
.linkSearch .loginView{clear:both; height:32px; text-align:center; background:#f5f5f5; line-height:32px;}

.notice{position:relative; overflow:hidden;}
.more{position:absolute; top:20px; right:20px;}
.notice ul{margin-top:10px;}
.notice li{color:#74767b; border-bottom:1px solid #e7e8e9; padding:5px 0; width:100%;}
.notice li a{color:#74767b;}
.notice li:last-child{border:none;}
.notice li span{float:right; color:#ababac; font-size:13px;}

.linkBox{position:relative; overflow:hidden;}
.linkBox li{width:32%; margin-right:2%; float:left; color:#161f2c; color:16px; font-weight:600;}
.linkBox li.link01{background:#f5f5f5 url(<%=util.Property.contextPath%>/img/main_link01.png) no-repeat 20px center; padding-left:50px; border:1px solid #dddddd;}
.linkBox li.link02{background:#f5f5f5 url(<%=util.Property.contextPath%>/img/main_link02.png) no-repeat 20px center; padding-left:50px; border:1px solid #dddddd;}
.linkBox li.link03{background:#f5f5f5 url(<%=util.Property.contextPath%>/img/main_link03.png) no-repeat 20px center; padding-left:50px; border:1px solid #dddddd;}
.linkBox li a{display:block; height:52px; line-height:52px;}
.linkBox li:last-child{margin-right:0;}

.main .bl{position:relative; overflow:hidden;}
.blTab{position:relative; overflow:hidden; border-bottom:1px solid <%=util.Property.color%>; margin-top:10px; cursor:pointer;}
.blTab li{float:left; width:80px; background:#e6e6e6; padding:5px 20px; color:#161f2c; text-align:center; margin-right:1px;}
.blTab li.on{background:<%=util.Property.color%>; color:#fff; font-weight:400;}
.main .bl table{}
.main .bl thead th{background:#9a9a9a; color:#fff; font-weight:500; font-size:13px; height:33px; font-size:13px;}
.main .bl tbody td{border-bottom:1px solid #e7e8e9; padding:5px 0; text-align:center; color:#74767b; font-size:13px;}
.main .bl tbody td a{color:#0043db;}
.main .bl tbody .last td{border:none;}
.main .bl .loginView{height:209px; text-align:center; background:#f5f5f5; }

/* ==================================================
	skip
================================================== */
a.skip{display:block;position:absolute;top:-1px;z-index:999;width:0;height:0;overflow:hidden;text-align:center}
a.skip:active,a.skip:focus{z-index:999;width:100%;height:auto;padding:5px;background:#FFF}


input[type=button] {cursor:pointer !important;}
.cp{cursor:pointer !important;}

.wid10{width:10% !important;}
.wid20{width:20% !important;}
.wid29{width:29% !important;}
.wid30{width:30% !important;}
.wid39{width:39% !important;}
.wid40{width:40% !important;}
.wid48{width:48.5% !important;}
.wid49{width:49% !important;}
.wid50{width:50% !important;}
.wid59{width:59% !important;}
.wid60{width:60% !important;}
.wid65{width:65% !important;}
.wid70{width:70% !important;}
.wid80{width:80% !important;}

.wid50p{width:50px !important;}
.wid60p{width:60px !important;}
.wid80p{width:80px !important;}
.wid100{width:100px !important;}
.wid150{width:150px !important;}
.wid158{width:158px !important;}
.wid165{width:165px !important;}
.wid180{width:180px !important;}
.wid190{width:190px !important;}
.wid200{width:200px !important;}
.wid300{width:300px !important;}
.wid400{width:400px !important;}
.wid500{width:500px !important;}

.mt5{margin-top:5px !important;}
.mt10{margin-top:10px !important;}
.mt20{margin-top:20px !important;}
.mt30{margin-top:30px !important;}
.mt40{margin-top:40px !important;}
.mt50{margin-top:50px !important;}
.mt60{margin-top:60px !important;}
.mt70{margin-top:70px !important;}
.mt80{margin-top:80px !important;}
.mt90{margin-top:90px !important;}
.mt100{margin-top:100px !important;}

.mb20{margin-bottom:20px !important;}

.mr10{margin-right:10px !important;}
.ml10{margin-left:10px !important;}
.mr20{margin-right:20px !important;}
.mr30{margin-right:30px !important;}
.mr40{margin-right:40px !important;}
.mr50{margin-right:50px !important;}

.pt0{padding-top:0px !important;}

.pb10{padding-bottom:10px !important;}
.pl10{padding-left:10px !important;}
.pl20{padding-left:20px !important;}
.pl30{padding-left:30px !important;}
.pl70{padding-left:70px !important;}
.pl0{padding-left:0px !important;}


.bno{border:none !important;}
.bno_b{border-bottom:none !important;}
.blind{position:absolute; top:-999999px; width:0; height:0; font-size:0; overflow:hidden;}
.clear{clear:both;}

.fl_l{float:left !important;}
.fl_r{float:right !important;}
.txt_l{text-align:left !important;}
.txt_c{text-align:center !important;}
.txt_r{text-align:right !important;}
.ver_t{vertical-align:top !important;}
.txt_b{font-weight:500 !important;}
.txt_ul{text-decoration:underline !important;}
.txt_red{color:<%=util.Property.color%> !important;}

.wbreak{word-break:break-all !important;}


/* 셀렉트 */
.selectric-dSelect{position:relative; float:left; min-width:50px; margin:0 5px 0 0;}
.selectric-dSelect .selectric{border:1px solid #d1d1d1}
.selectric-dSelect .selectric .label{font-size:13px;color:#666;text-align:left;text-overflow:ellipsis;letter-spacing:0}
.selectric-dSelect .button{right:10px;top:12px;width:12px;height:7px;background:url("<%=util.Property.contextPath%>/img/list_arrow.png") no-repeat left top}
.selectric-dSelect.selectricOpen .button{background-position:left bottom}
.selectric-dSelect .selectricItems{padding:4px 0 0 0;background:#fff;border:1px solid #d1d1d1;border-top:0}
.selectric-dSelect .selectricItems li{padding:5px 15px 5px 10px;background:#fff;border:0;font-size:14px;color:#666;text-align:left}
.selectric-dSelect .selectricItems li:hover,
.selectric-dSelect .selectricItems li.selected{background:#efefef;color:#666}
.selectric-dSelect.selectricAbove .selectricItems{padding:0 0 4px 0;border:1px solid #d1d1d1;border-bottom:0}
.selectric-wid80i{width:80px  !important;}
.selectric-wid100{width:100px  !important;}
.selectric-wid120{width:120px  !important;}
.selectric-wid150{width:150px  !important;}
.selectric-wid158{width:158px  !important;}
.selectric-wid165{width:165px  !important;}
.selectric-wid160{width:160px  !important;}
.selectric-wid180{width:180px  !important;}
.selectric-wid190{width:190px  !important;}
.selectric-wid200{width:200px  !important;}

.selectric-wid20{width:20% !important;}
.selectric-wid30{width:30% !important;}
.selectric-wid40{width:40% !important;}
.selectric-wid50{width:50% !important;}
.selectric-wid60{width:60% !important;}
.selectric-wid70{width:70% !important;}
.selectric-wid80{width:80% !important;}

/* 라디오 버튼 */
.radio_box label{font-size:14px;color:#666}
.radio_box label + label{margin:0 0 0 24px;}


/* 체크 박스 */
.check_box label{font-size:14px;color:#666}
.check_box label + label{margin:0 0 0 24px;}

/* input type="file"*/
.fileBox{overflow:hidden;}
.fileBox .inputBox{float:left;}
.fileBox input[type="text"]{float:left;overflow:hidden;box-sizing:border-box;height:32px;padding:8px 10px;border:1px solid #d1d1d1;font-size:14px;line-height:1;letter-spacing:-1px;color:#999;background:#fafafa;}
/* .fileBox .fileBtn{float:left;margin-left:13px;} */
.fileBox .fileBtn label{display:inline-block;width:125px;font-size:14px;line-height:32px;letter-spacing:-1px;color:#fff;background:#999;text-align:center;}
.fileBox .fileBtn input[type="file"]{visibility:hidden;width:0;height:0;padding:0;margin:0;}



.space20{display:inline-block; width:20px;}