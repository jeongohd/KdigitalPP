<%@ page contentType="text/css; charset=utf-8" %>
@charset "utf-8";
/* CSS Document */
.txtgray{color:#74767b !important;}

#boardWrap{margin:30px 0; position:relative; width:100%;}
.pageTitle{border-bottom:1px solid #161f2c; position:relative; overflow:hidden; padding-bottom:8px; margin-bottom:20px;}
.pageTitle h2{color:#4a62f8; font-weight:500; font-size:20px; float:left;}
.pageTitle a{display:block; float:right;}
.pageTitle .prevPage{background:#484b56 url('<%=util.Property.contextPath%>/img/btn_prevPage.png') no-repeat 20px center; color:#fff; border-radius:5px; padding:6px 15px 6px 40px;}


/* ==================================================
	공통사용
================================================== */
/* pagenation */
.pagenate {width:100%; clear:both;}
.pagenate {text-align:center; margin:20px auto 0;}
.pagenate li {display:inline-block;}
.pagenate li:first-child { margin-left:0px; }
.pagenate li a{display:inline-block; text-decoration:none; padding:0; width:30px; height:30px; line-height:30px; border:1px solid #e2e2e2; box-sizing:border-box; margin-left:1px; vertical-align:middle;}
.pagenate li a:hover{color:#000; font-weight:bold; text-decoration:none !important;}
.pagenate li a.board { text-indent:-9999em; margin-left:4px; }
.pagenate li a.board.first {background: url('<%=util.Property.contextPath%>/img/ico_first.png') no-repeat center center;}
.pagenate li a.board.prev {margin-right:10px; background: url('<%=util.Property.contextPath%>/img/ico_prev.png') no-repeat center center;}
.pagenate li a.board.next {margin-left:10px; background: url('<%=util.Property.contextPath%>/img/ico_next.png') no-repeat center center;}
.pagenate li a.board.last {background: url('<%=util.Property.contextPath%>/img/ico_last.png') no-repeat center center;}
.pagenate li a.current {color:#4a62f8; border:1px solid #4a62f8; font-weight:bold; }

/* button */
.btnSet {position:relative; margin:20px 0; text-align:center; clear:both; height:30px; overflow:hidden;}
.btnSet .right {position:absolute; top:0; right:0;}
.btnSet .left {position:absolute; top:0; left:0;}
.btn {font-size:14px; text-decoration:none !important; white-space:nowrap; display:inline-block; border:1px solid #ddd; position:relative; cursor:pointer; height:30px; padding:3px 20px; min-width:64px; color:#161f2c !important; margin:0 2px; text-align:center; font-weight:500; background:#f5f5f5;}

.btn.gray{background:#bfbfbf; border:none; border-radius:6px; padding:5px 10px 0; font-size:13px; font-weight:400; line-height:20px;}


.plus{width:30px; height:30px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_plus.png') no-repeat center center; border:none; border-radius:6px;}
.del{width:30px; height:30px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_del.png') no-repeat center center; border:none; border-radius:6px;}




/* ==================================================
	board
================================================== */
.searchWrap{position:relative; border:4px solid #f2f2f2; padding:20px;}
.searchWrap > div{padding-top:10px; clear:both; min-height:34px; line-height:25px;  }
.searchWrap .date input[type=text]{width:100px;}
.searchWrap .date input[type=button]{width:32px; height:32px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_calender.png') no-repeat center center;}
.searchWrap .search{width:100px; height:32px; background:#808080 url('<%=util.Property.contextPath%>/img/btn_search.png') no-repeat 20px center; padding-left:30px;}
.searchWrap .searchSmall{width:30px; height:32px; background:#515151 url('<%=util.Property.contextPath%>/img/btn_search.png') no-repeat 20px center; padding-left:30px;}
.searchWrap label.txt_l{float:left; color:#161f2c; font-weight:300; line-height:25px; vertical-align:middle; font-size:14px; width:60px; margin-right:10px;}
.searchWrap .wid50{float:left;}
.searchWrap .space10{display:inline-block; width:10px;}
.searchWrap .space20{display:inline-block; width:20px;}

.bbs{position:relative; width:100%; clear:both;}

/* list */
.bbs .list{border-collapse:collapse; border-spacing:0; box-sizing:border-box; margin-top:20px;}
.bbs .list .xsroll{ position:relative; overflow-x:auto; overflow-y:hidden;}
.bbs .list table{border-top:1px solid <%=util.Property.color%>;}
.bbs .list .bbsSearch{margin-top:20px}
.bbs .list .bbsSearch .sword input[type=submit]{line-height:32px;border:1px solid #ddd;background:#f5f5f5;color:#161f2c}
.bbs .list thead{background:#f5f5f5; position:relative;}
.bbs .list tbody{position:relative;}
.bbs .list thead th{padding:8px 5px; font-size:13px; height:48px; line-height:14px; color:#fff; font-weight:500; background:#9a9a9a; text-align:center;}
.bbs .br_lb thead th{border-bottom:1px solid #dddddd; border-right:1px solid #dddddd;}
.bbs .br_lb thead th:last-child{border-right:none;}
.bbs .list thead th.blank{background:#fff !important; border-top:1px solid #fff !important; border-bottom:1px solid <%=util.Property.color%> !important; border-right:1px solid <%=util.Property.color%> !important;}
.bbs .list td{text-align:center; font-size:13px; padding:5px; height:52px; border-bottom:1px solid #9a9a9a; border-right:1px solid #9a9a9a;}
.bbs .list td.title {text-align:left; padding-left:20px;}
.bbs .list td:last-child{border-right:none;}
.bbs .list td a{color:#2c4b48;}
.bbs .list tbody tr:hover{background:<%=util.Property.overcolor%>;} /*마우스오버 배경칼라지정*/
.trCheck {background:#f9e9e9;}
.bbs .list .overNo tbody tr:hover{background:none !important;}
.bbs .list  h3{background:url(<%=util.Property.contextPath%>/img/list_h3.png) no-repeat left center; padding-left:24px; color:#484b56; font-size:16px; margin-bottom:10px;}
.bbs .list td.tb_th{font-weight:600; font-size:14px;}
.inTab_etc_contact p{margin-top:5px; margin-left:2px;}
.inTab_etc_contact p > strong.red{color:#c00000;}
.bottomline{border-bottom:1px dashed #ddd; padding-bottom:35px;}

/* schedule */
.scheduleLine{position:relative; border-bottom:1px solid #dddddd; text-align:center;}
.scheduleLine li{display:inline-block; padding:20px; color:#161f2c; font-size:16px; font-weight:600; line-height:16px; vertical-align:middle; opacity:0.3;}
.scheduleLine li.on{opacity:1.0;}
.scheduleLine li img{ line-height:16px; vertical-align:middle;}
.calenderDate{margin:10px auto; text-align:center; color:#161f2c; font-size:24px; font-weight:600;}
.calenderDate a{padding:0 10px;}
.textInfo{float:right;}
.textInfo dl{position:relative; overflow:hidden; margin:10px 0; font-size:12px;}
.textInfo dl dt{float:left; font-weight:600; margin:0 5px 0 10px;}
.textInfo dl dd{float:left;}
.calenderTable{}
.calenderTable th{color:#161f2c !important;}
.calenderTable .sun{color:red !important;}
.calenderTable .sat{color:blue !important;}
.calenderTable td{min-height:100px; vertical-align:top; width:14.285%;  text-align:left !important;}
.calenderTable td span{ float:right; padding-right:8px; font-weight:600;}
.calenderTable td ul{clear:both;}
.calenderTable td ul li{margin-bottom:3px;}
.calenderTable td a{clear:both;  width:auto; padding:0 5px;}
.link{color:#0043db !important;}
.deadline{color:<%=util.Property.color%> !important;}
.delay{!important; background:#fffc00;}


/* write */
.bbs .write{border-collapse:collapse; border-spacing:0; box-sizing:border-box; margin-top:20px; width:100%; position:relative;}
.bbs .write table{border-top:1px solid <%=util.Property.color%>;}
.bbs .write thead{background:#f5f5f5; position:relative;}
.bbs .write tbody{position:relative;}
.bbs .write th{padding:8px 5px; font-size:15px; height:48px; line-height:14px; color:#484b56; font-weight:500; background:#f5f5f5;  border-right:1px solid #dddddd; border-bottom:1px solid #dddddd; }
.bbs .write th:first-child{border-left:1px solid #dddddd;}
.bbs .write th label{float:left; line-height:32px; vertical-align:middle; margin-right:10px;}
.bbs .write td{text-align:left; font-size:15px; height:48px; padding:5px; border-right:1px solid #dddddd; border-bottom:1px solid #dddddd; }
.bbs .write td:first-child{border-left:1px solid #dddddd;}
.bbs .write h3{background:#484b56; border-radius:10px 10px 0 0; color:#fff; width:160px; font-size:13px; padding:8px 16px;}
.bbs .write td input[type="text"]{width:100%;}
.bbs .write td textarea{width:100%; min-height:100px;}
.bbs .write td .selectric-dSelect{width:100%;}
.bbs .write td strong{font-weight:600;}
.bbs .write td.br .selectric-dSelect{margin-top:5px !important;}
.bbs .write td .br{clear:both; display:block; height:5px;}
.bbs .write td .inText{display:inline-block;} 
.bbs .write td.labelL label{float:left; display:inline-block; width:80px; color:#161f2c; font-weight:600;  line-height:32px; vertical-align:middle;}
.bbs .write td.br input:first-child{margin-top:0 !important;}
.bbs .write .br_w{border-right:1px solid #fff !important;}
.bbs .write .bb_w{border-bottom:1px solid #fff !important;}
.bbs .write .divT{padding:10px; clear:both; position:relative; border-top:1px solid <%=util.Property.color%>;  border-bottom:1px solid #dddddd; min-height:55px;}
.bbs .write .divT label.txt_l{float:left; color:#161f2c; font-weight:600; line-height:32px; vertical-align:middle; font-size:15px; width:60px; margin-right:10px;}
.bbs .write .divT .wid50,.bbs .write .divT .wid40,.bbs .write .divT .wid60{float:left;}
.bbs .write .space10{display:inline-block; width:10px;}
.bbs .write .space20{display:inline-block; width:20px;}
.bbs .write .divT .fl_l{margin-top:5px; }
.bbs .write td .fl_l{margin-right:5px;}
.bbs .write .date input[type=text]{width:80px;}
.bbs .write .date input[type=button]{width:32px; height:32px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_calender.png') no-repeat center center;}

.bbs .write td.tdtable{background:#dddddd; padding:0 10px;}
.bbs .write table.intable{border-top:1px solid #dddddd; margin:10px 0;}
.bbs .write table.intable th{color:#484b56; text-align:center;}
.bbs .write table.intable td{background:#fff;}
.bbs .write table.intable tbody th{background:#fff; color:#484b56;}

.bbs .write .checkli{position:relative; overflow:hidden;}
.bbs .write .checkli ul{position:relative; overflow:hidden;}
.bbs .write .checkli li{float:left; width:20%; padding-bottom:5px;}
.bbs .write .checkli p a{position:absolute; bottom:0;}

/* 화물진행상태 */
.tracking{padding:10px 0; clear:both; position:relative; border-top:1px solid <%=util.Property.color%>; overflow:hidden; }
.tracking p{ position:relative; border-bottom:1px solid #dddddd; font-size:16px; text-align:center; font-style:italic; height:40px;}
.tracking p:after{content:""; position:absolute; left:50%; background:url(<%=util.Property.contextPath%>/img/line_arrow.png) no-repeat; width:21px; height:10px; top:100%;}
.tracking dl{width:9.777%; margin-right:1.5%; float:left; margin-top:20px; position:relative; }
.tracking dl:after{content:""; position:absolute; left:102%; background:url(<%=util.Property.contextPath%>/img/tracking_arrow.png) no-repeat; width:9px; height:15px; top:25%;}
.tracking dl:last-child{margin-right:0;}
.tracking dl:last-child:after{background:none;}
.tracking dd{text-align:center; height:50px; font-size:13px; font-weight:500; color:#74767b; margin-top:5px;}
.tracking dd.on{color:<%=util.Property.color%>;}


/* 도움말 */
.help{display:inline-block; width:24px; height:24px; background:#bfbfbf; color:#fff; font-size:16px; font-weight:500; border-radius:12px; text-align:center; margin-left:8px; position:relative}
.infomation{position:relative; padding:0 10px; overflow:hidden;}
.infomation .redPt{color:#a50800; background:url('<%=util.Property.contextPath%>/img/ico_redPt.png') no-repeat left 4px; margin:10px 0; padding-left:30px; font-weight:400;}
.infomation .checkPt{margin:10px 0;}
.infomationBg{clear:both; margin:10px 0; position:relative; padding:20px; background:#f5f5f5; overflow:hidden; }
.infomationBg li{background:url('<%=util.Property.contextPath%>/img/ico_redStar.png') no-repeat 5px 5px; padding-left:20px; color:#161f2c; font-weight:400;}

.freetimeTab{position:relative; overflow:hidden; border-bottom:1px solid <%=util.Property.color%>; margin-top:10px; cursor:pointer;}
.freetimeTab li{float:left; width:120px; background:#e6e6e6; padding:5px 20px; color:#161f2c; text-align:center; margin-right:1px;}
.freetimeTab li.on{background:<%=util.Property.color%>; color:#fff; font-weight:400;}

/* 첨부파일 */
.fileBox {display:table;width:100%;}
.fileBox .inputBox{float:none;display:table-cell;width:100%;}
.fileBox .fileBtn{display:table-cell;width:125px;vertical-align:bottom;}


/*탭메뉴*/
.li2 li{width:50%;}
.li3 li{width:33.333%;}
.li4 li{width:25%;}
.li5 li{width:20%;}
.li6 li{width:16.666%;}
.li7 li{width:14.285%;}
.li8 li{width:12.5%;}
.li9 li{width:11.111%;}
.li10 li{width:10%;}


/*업무담당자*/
.inTap_wrap{position:relative;}
.inTab{position:relative; overflow:hidden;}
.inTab > li{float:left; position:relative; border:1px solid #dcdcdc; text-align:center; font-size:16px; border-right:none;}
.inTab > li:last-child{border-right:1px solid #dcdcdc;}
.inTab > li a{display:block; padding:10px 0; }
.inTab > li a:hover{background-color:#cc0000; color:#fff; font-weight:400;}
.inTab > li.on{background-color:#cc0000; color:#fff; font-weight:600;}
.inTab_etc_contact {position:relative; margin-top:20px;}
.inTab_etc_contact > li{position:relative; display:none; width:100%; height:auto;}


/*DEM DET STF 요율*/
.interval10{margin-top:10px;}


/*컨테이너 spec 조회*/
.inTap_wrap{position:relative;}
.inTab_etc_contact > li{position:relative; top:20px; left:0; display:none; padding-bottom:50px;}
.photo{position:relative; overflow:hidden;}
.photo > a{display:block; position:absolute; top:50%; margin-top:-34px; width:64px; height:64px; border-radius:32px; border:1px solid rgba(202,202,202,0.5); background:rgba(255,255,255,0.5); text-align:center; line-height:64px;}
.photo > a:hover{background:rgba(255,255,255,0.8);}
.photo > a.prev{left:1%;}
.photo > a.next{right:1%;}
.photo .controll{position:absolute; width:100%; top:20px; right:20px; text-align:right;  z-index:10;}
.photo .controll li{display:inline-block; width:100px; margin-right:1px;}
.photo .controll li a{display:block; background:rgba(23,27,40,0.5); color:#fff; font-size:14px; padding:5px 0; text-align:center;}
.photo .controll li.on a, .contents .photo .controll li a:hover{background:rgba(23,27,40,0.9); font-weight:500;}
.photo .controll li:last-child{margin-right:0;}
.inTab_etc_contact{position:relative; width:100%;}
.inTab_etc_contact .photo{position:relative;  margin:20px 0 0; width:100%;}
.inTab_etc_contact .photo .slide img{width:100%;}

.business .photo .slide img{width:100%;}

.dateBtn{display:block; width:28px; height:28px; border-radius:5px; background:#bfbfbf url('<%=util.Property.contextPath%>/img/btn_calender.png') no-repeat center center; text-indent:-9999px; margin:auto;}

/*회원*/
.sub {width: 100%;position: relative;margin-top: 80px;}
.sub .size {width: 100%; max-width: 1200px; height:auto; margin:0 auto;}
.sub .sub_title {text-align: center;font-size: 32px;margin: 0 0 15px 0;}
.sub .size .sub_title{text-align:center}
.join .box{position:relative; margin:30px auto; max-width:500px;}
.join .box p{text-align:center; font-size:20px;}
.join .box .tab{position:relative; margin:0 auto 20px; overflow:hidden;}
.join .box .tab li{border:1px solid #e1e1e1; width:50%; float:left; text-align:center; background:#f5f5f5;}
.join .box .tab li.on{border-top:2px solid #87b350; border-left:2px solid #87b350; border-right:2px solid #87b350; border-bottom:1px solid #fff; color:#87b350; font-weight:bold; background:#fff;}
.join .box .tab li:last-child.on{border-left:2px solid #87b350;}
.join .box .tab li:last-child {border-left:none;}
.join .box .tab li a{padding:10px 0; width:100%; display:block;}
.join .login_form{border-top:2px solid #cad0d1; border-bottom:1px solid #cad0d1; position:relative; margin:20px auto; padding:20px 0; width:100%;}
.join .login_form li{padding:5px 0; width:100%;}
.join .login_form input[type=text], .join .login_form input[type=password]{height:40px; width:70%;}
.join .login_form .login_btn{position:absolute; width:25%; height:90px;  right:0; top:25px;}
.join .login_form .login_btn input[type=submit]{background: #221f1f;color:#fff;width:100%;height:100%;border:none;font-size: 18px;font-weight: 500;border-radius: 5px;}
.join .box .btn{width: 48%;margin:0;background:#221f1f !important;border:none;color:#fff !important;font-weight: 400;}
.join .login_form dl{}
.join .login_form dt{padding:5px 0; float:left; width:15%; line-height:40px; vertical-align:middle; font-weight:bold;}
.join .login_form dd{padding:5px 0; float:left; width:85%;}
.join .login_form dd input[type=text]{width:100%;}
.join .login_form dd .tx{display:inline-block;float:left;width:25px;line-height:32px;text-align:center;}
.join .login_form dd.email{position:relative;}
.join .login_form dd.email input[type=text]{float:left;width:30%;}
.join .login_form dd.email .selectric-dSelect{float:left;width:134px;margin:0 0 0 10px; height:40px;}
.join .login_form dd.email .selectric-dSelect .selectric{height:40px; line-height:40px;}
.join .login_form .search_btn input[type=submit]{background:#87b350; color:#fff; width:100%; border:none; font-size:18px; font-weight:bold; padding:10px 0; margin-top:20px;}
.board_write {border-top:2px solid #221f1f; border-bottom:1px solid #999;}
.board_write thead th{text-align:center;}
.board_write th{padding:10px; background:#f4f4f5; color:#000000; border-bottom:1px solid #ebebeb; border-right:1px solid #ebebeb; font-size:15px;}
.board_write th br{display:none;}
.board_write td{padding:10px; border-bottom:1px solid #ebebeb; font-size:15px; color:#2f3134; font-weight:300; box-sizing:border-box;}
.board_write td .tx{display:inline-block;float:left;width:25px;line-height:32px;text-align:center;}
.board_write td.email{position:relative;}
.board_write td.email input[type=text]{float:left;width:30%;}
.board_write td.email .selectric-dSelect{float:left;width:166px;margin:0 0 0 10px;}
.board_write td.phone input[type=text]{float:left;width:94px;}
.board_write td.phone .selectric-dSelect{float:left;width:94px;}
.board_write td textarea{width:100%; height:200px; box-sizing:border-box; }
.board_write td input[type=text]{box-sizing:border-box; }
.board_write .fileBox{display:table;width:100%;}
.board_write .fileBox .inputBox{float:none;display:table-cell;width:100%;}
.board_write .fileBox .inputBox input{width:100%;}
.board_write .fileBox .fileBtn{display:table-cell;width:125px;}
.board_write p.help{text-align:left;font-size:12px;line-height:26px;letter-spacing:-1px; color:#999;}
.board_write p.help:before{content:'※ ';}
.board_write tr:last-child th, .board_write tr:last-child td{border-bottom:1px solid #dadada;}
.board_write .ptxt {line-height: 30px;margin-left: 5px;}
.board_write td select{border:1px solid #d1d1d1; height:24px; padding:3px 3px 3px 4px; vertical-align:middle; line-height:24px;}
.board_write .selectricWrapper{border:1px solid #646464};
.board_write .selectric .label{color:initial}