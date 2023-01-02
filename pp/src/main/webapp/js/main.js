/**
 * 
 */
var main = {
	loadPage : function( opt ){
		var form = $("#search_frm").ajaxForm({
			dataType : 'html',
			beforeSerialize : function(){},
			beforeSubmit : function(){
				
			},
			success : function( res ){
				$("#tbody").html(res);
			},
			error : function( e ){
				console.log(e);
			}
		});
		console.log(form);
		
		$("#search_frm").submit();
	},
	pagenate : function( reqPageNo ){
		reqPageNo = reqPageNo || $("#reqPageNO").val(); 
		$("#reqPageNO").val(reqPageNo);
		
		main.loadPage();
	},
	condition : {
		addItem : function( obj ){
			var $_chkbox = $(obj);
			
			var id = $_chkbox.attr('id');
			
			var title = $("label[for='{id}']".replace("{id}", id)).text();
			var value = $_chkbox.val();
			
			var item = "<li style='opacity:0;' class='condition_item'{data}><span style='display:inline-block;'>{title}</span> <a href='javascript:;' class='item_wraper'><img src='/img/search_txt_close.png' /></a></li>"
				.replace("{title}", title)
				.replace('{data}', ' data-id="'+id+'"');
			
			$(item).appendTo($("#s_items")).stop().animate({opacity:1}, 250);
			//$(item).appendTo($("#s_items")).not(':animated').css({'opacity': 1 }).effect("scale", {origin:['middle','center'], from:{width:$(item).width()/2,height:$(item).height()/2}, percent: 100, direction: 'both', easing: "easeOutBounce" }, 700);
			
			$('.item_wraper').off("click").on('click', function(){
				var id = $(this).parent().data('id');
				main.condition.removeItem( $('#'+id) );
			});
			
			//$( "#s_items" ).sortable({ revert : true });
			
		},
		removeItem : function( obj ){
			var $_chkbox = $(obj);
			var id = $_chkbox.attr('id');
			
			$('#'+id).iCheck('uncheck');
			/*
			var item = $("li.condition_item[data-id={id}]".replace("{id}", id));
			$(item).effect('scale', {origin:['middle','center'], to: {width:$(item).width()/2,height:$(item).height()/2}, percent: 100, direction: 'both', easing: "easeOutBounce" }, 700, function(){
				main.condition.removeItem( obj );
			});
			*/
			$("li.condition_item[data-id={id}]".replace("{id}", id)).fadeOut(100, function(){
				$(this).stop().animate({width:1}, 150, function(){
					$(this).addClass()
					$(this).remove();
				});
			});
		}
	},
	filter : function(){
		// icheck init
		$('#s_filter dd input[type=checkbox]').iCheck({
			checkboxClass: 'icheckbox_minimal',
			increaseArea: '20%'
		});	
		
		// arcodian menu
		$("#s_filter dt").on('click', function(){
			var $_dt = $(this);
			if(!$_dt.hasClass('on')) {
				$("#s_filter dt").removeClass('on');
				$("#s_filter dd").stop().slideUp(300);
				
				$_dt.addClass("on");
				$_dt.next().stop().slideDown(300, function(){
					$("#s_filter .searchMenu").mCustomScrollbar('scrollTo', $_dt);
				});
			}
		});
		// 첫 필터 펼침
		$("#s_filter dt:eq(0)").trigger('click');

		// icheck 설정 start
		$('#s_filter dd input[type=checkbox].all_chk').on('ifChecked', function( e ){
			var name = $(e.target).data("name");
			
			$('#s_filter dd input[type=checkbox][name='+name+']').iCheck('uncheck');
		});
		
		
		$('#s_filter dd input[type=checkbox]:not(.all_chk)').on('ifChecked', function( e ){
			main.condition.addItem(e.target);
			
			var name = $(e.target).attr("name");
			
			$('#s_filter dd input[type=checkbox][data-name='+name+']').iCheck('uncheck');
		});
		
		$('#s_filter dd input[type=checkbox]:not(.all_chk)').on('ifUnchecked', function( e ){
			main.condition.removeItem(e.target);
			
			var name = $(e.target).attr("name");
			if($('#s_filter dd input[type=checkbox][name='+name+']:checked').size() == 0){
				$('#s_filter dd input[type=checkbox][data-name='+name+']').iCheck('check');
			} 
		});
		
		$('#s_filter dd input[type=checkbox]').on('ifChecked', main.pagenate);
		$('#s_filter dd input[type=checkbox]').on('ifUnchecked', main.pagenate);
		// icheck 설정 end
		
	},		
	scroll : function(){
		
		$("#searchWrap .searchMenu").css({
			"overflow":"hidden", 
			"height":$(window).height() - $("#header").outerHeight() - $("#searchWrap .search").outerHeight()
		}).mCustomScrollbar({
			theme : "minimal"
		});
		
		$(window).resize(function(){
			$("#searchWrap .searchMenu").css({"height":$(window).height() - $("#header").outerHeight() - $("#searchWrap .search").outerHeight()});
		});
		
	},
	flip : function(){
		$(".flip").flip({ axis :'x' });
		$(".flip").on('click', function(){
			var flip = $(this).data('flip-model');
			var sort = "";
			if(flip.isFlipped){
				sort = " DESC";
			}
			
			$('#orderby').val($(this).data("orderby") + sort);
			$(".flip").not(this).flip(false);
			
			main.pagenate();
		});
	}
}

var view = function( idx ){
	$('#idx').val( idx );
	$("#search_frm").attr("action", "/business/index.jsp");
	$("#search_frm").submit();
}

$(window).load(function(){
	main.pagenate();
	main.scroll();
	main.filter(); 
	main.flip();
});