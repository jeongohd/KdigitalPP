

$(function() {
		//전체메뉴
		$(".allmenu").mouseenter(function(e){
			$(".allmenu_con").stop().slideToggle(300);
		});
		$(".allmenu").mouseleave(function(e){
			$(".allmenu_con").stop().slideToggle(300);
		});
	});
		
	/*//전체보기
	function view_all_menu(){
		if($(".allmenu_con").css("display") == "none") {		// 안보이는 상태
			$(".allmenu_con").slideToggle(800);
			$(".allmenu_img").attr("src","/img/menu_all_off.png");
		}
		else {
			$(".allmenu_con").slideToggle(800);
			$(".allmenu_img").attr("src","/img/menu_all.png");
		}
	}
*/