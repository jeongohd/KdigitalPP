(function ($) {
  $.extend($, {
    cacheImage: function (src, options) {
      if (typeof src === 'object') {
        $.each(src, function () {
          $.cacheImage(String(this), options);
        });

        return;
      }

      var image = new Image();

      options = options || {};

      $.each(['load', 'error', 'abort'], function () { // Callbacks
        var e = String(this);
        if (typeof options[e] === 'function') { $(image).bind(e, options[e]); }

        if (typeof options.complete === 'function') {
          $(image).bind(e, options.complete);
        }
      });

      image.src = src;

      return image;
    }
  });

  $.extend($.fn, {
    cacheImage: function (options) {
      return this.each(function () {
        $.cacheImage(this.src, options);
      });
    }
  });
})(jQuery);

;(function ($) {
	
	var pluginName = 'mainVisual';
	var $doc = $(document);
	var $win = $(window);
	var opts = {};

	var $_this;
	var $_base;
	var fn = {
		autoSlide : {
			stop : null,
			start : null,
			init : null
		}
	}


	function setHeight(){	// 메인 비쥬얼 자동 높이 조절
		var wh = $win.outerHeight();
		var target;

		if( opts.autoHeight && opts.autoHeight.target ){
			target = $.merge($_this, $(opts.autoHeight.target, $_base) );
		} else {
			target = $_this;
		}

		$(target).css( {"min-height": wh, "height" : wh } );
	}

	function mainScroll(){
		var opt = opts.scrollBtn;
		var $_btn = $((opt.target || '.scroll'), $_base);
		var scrollTime = opt.time || 500;
		var easing = opt.easing || 'easeInOutCirc';

		$_btn.off('.downScroll').on('click.downScroll', function( e ){
			e.preventDefault();

			var wh = $_this.outerHeight();
			var scrollTo = opt.scrollTo ? $(opt.scrollTo).offset().top : wh;
			var paddingTop = $(opt.scrollTo).hasClass('service') ? parseInt($(opt.scrollTo).css("margin-top")) : 0; 
			var $_popup_h = $("#popup").size() ? $("#popup").outerHeight() + parseInt($("#popup").css("margin-top")) : 0;
			scrollTo = scrollTo - $("#header").outerHeight() - $_popup_h - paddingTop;
			
			$("html, body").stop().animate({ scrollTop : scrollTo }, scrollTime, easing);
		});
		
		$_this.off(".wheel").on("mousewheel.wheel, DOMMouseScroll.wheel", function(e){
			delta = e.originalEvent.detail || -(e.originalEvent.wheelDelta) || (e.originalEvent.deltaY);
			
			if(delta > 0){	// down
				e.preventDefault();
				$_btn.click();
			} else {		// up

			}
		});		
	}

	function mainSlide(){
		var opt = opts.slide;
		var $_slider = $(opt.target, $_base);
		var $_wraper = $_slider.parent();
		var $_items = $_slider.children();
		var $_arrowBtns = $(opt.arrowBtns, $_base);
		var $_navi = $(opt.navi, $_base);
		var $_navi_items = $_navi.size() ? $_navi.children() : null;

		var max_idx = $_items.size() - 1;
		var curr_idx = 0;
		var next_idx;
		var easing = opt.easing || 'easeInOutCirc';
		var item_pos = opt.item_pos || 'h'; // 아이템 배열 방식, 가로 배열, 세로 배열
		item_pos = item_pos.toLowerCase();
		
		var afterAni = opt.animate;
		afterAni = opt.animate && opt.animate.on ? opt.animate.on : afterAni;
		afterAni = afterAni || false;
		
		var auto_slide = opt.auto;
		auto_slide = opt.auto && opt.auto.on ? opt.auto.on : auto_slide;
		auto_slide = auto_slide || false;
		var auto_slide_state;

		var time = opt.time || 750;
		var animated = false;

		function setInit(){
			var common_css = {"width":"100%", "height":"100%", "position":"relative", "overflow":"hidden"};
			$_wraper.css( common_css );

			if(opt.wraper_size){
				$_wraper.width( $(opt.wraper_size, $_base).width() );
				$_wraper.height( $(opt.wraper_size, $_base).height() );
			}
			$_slider.css( common_css );
			$_arrowBtns.hide();

			if($_items.size() > 1){
				$_arrowBtns.show();
				$_items.css( { "position":"absolute", "left":"100%", "top":0, "opacity":1 } );
				if(item_pos == 'v'){
					$_items.css( { "position":"absolute", "left":0, "top":"100%", "opacity":1 } );	
				}

				ani_items_init($_items);
				navi_init();

				if(item_pos.toLowerCase() == 'v'){
					$_items.eq(curr_idx).css({ "top":0, "opacity":1 });	
				} else {
					$_items.eq(curr_idx).css({ "left":0, "opacity":1 });
				}			
				setTimeout(function(){
					afterAnimate($_items.eq(curr_idx), function(){
						$_items.eq(curr_idx).addClass('curr');
						_autoSlide();
					});
				}, 1000);
			}
			
			if(opt.oninit && typeof opt.oninit == 'function'){
				console.log('opt.oninit', opt.oninit);
				opt.oninit();
			}
		}
		setInit();

		function _autoSlide(){
			if(auto_slide){
				var a_opt = opt.auto;
				var auto_time = a_opt.time || time;
				if(!auto_slide_state){
					auto_slide_state = setInterval(function(){
						slide();
					}, auto_time);
				}
			}
		}

		function _autoSlideStop(){
			if(auto_slide_state){
				clearInterval(auto_slide_state);
				auto_slide_state = null;
			}
		}

		function _autoSlideInit(){
			_autoSlideStop();
			curr_idx = 0;
			setInit();
		}

		fn.autoSlide.start = _autoSlide;
		fn.autoSlide.stop = _autoSlideStop;
		fn.autoSlide.init = _autoSlideInit;

		function calcIdx( direction ){
			var direct = direction || 'next';
			var $_curr_item = $_items.filter(function(){ return $(this).hasClass('curr'); });
			
			curr_idx = $_items.index( $_curr_item );

			if( direct == 'next' ){
				next_idx = curr_idx + 1;
				next_idx = next_idx > max_idx ? 0 : next_idx;
			} else {
				next_idx = curr_idx - 1;
				next_idx = next_idx < 0 ? max_idx : next_idx;
			}
		}

		function slide( direction, from_navi ){
			var direct = direction || 'next';
			var slide_time = opt.slide_time || time;
			var slide_easing = opt.slide_easing || easing;

			if(!animated) {
				animated = true;

				if(!from_navi){
					calcIdx( direct );
				}

				var $_curr = $_items.eq(curr_idx);
				var $_next = $_items.eq(next_idx);

				var $_curr_ani_css = item_pos == 'v' ? {"top":"-100%", opacity:1} : {"left":"-100%", opacity:1};
				var $_next_ani_css = item_pos == 'v' ? {"top":0, opacity:1} : {"left":0, opacity:1};
				if( direct == 'next' ){
					$_curr_ani_css = item_pos == 'v' ? {"top":"-100%", opacity:1} : {"left":"-100%", opacity:1};
					if(item_pos == 'v') $_next.css("top","100%"); else $_next.css("left","100%");				
				} else if( direct == 'prev' ) {
					$_curr_ani_css = item_pos == 'v' ? {"top":"100%", opacity:1} : {"left":"100%", opacity:1};
					if(item_pos == 'v') $_next.css("top","-100%"); else $_next.css("left","-100%");
				}

				$_curr.stop().animate($_curr_ani_css, slide_time, slide_easing, function(){
					afterAnimate( $_curr );
					$(this).removeClass('curr');

					if($_navi_items && $_navi_items.size()){
						$_navi_items.eq(curr_idx).removeClass('on');
					}
				});

				$_next.stop().animate($_next_ani_css, slide_time, slide_easing, function(){
					afterAnimate( $_next, function(){ 
						animated = false; 
						_autoSlide();
					});
					$(this).addClass('curr');

					if($_navi_items && $_navi_items.size()){
						$_navi_items.eq(next_idx).addClass('on');
					}
				});
			}
		}

		function afterAnimate( $_target, _callback ){
			if(afterAni) {
				if( $_target.filter(function(){ return $(this).hasClass('curr'); }).size() > 0 ) {
					ani_items_init( $_target );
				} else {
					var $_ani_items = $('[class*=ani_]', $_target);
					var ani_time = opt.animate.time || time;
					var ani_term = opt.animate.term || 0;
					var ani_easing = opt.animate.easing || easing;

					var pos;
					$_ani_items.each(function( idx ){
						pos = $(this).data("position");
						$(this).animate({opacity:0}, 1).delay(ani_term * idx).stop().animate({left:pos.left, top:pos.top, opacity:1}, ani_time, ani_easing, function(){
							if( _callback && typeof _callback == 'function' ){
								_callback();
							}
						});
					});
				}
			} else {
				if( _callback && typeof _callback == 'function' ){
					_callback();
				}
			}
		}

		function ani_items_init( _base ){
			if(afterAni) {			
				var $_ani_items = $('[class*=ani_]', _base);
				$_ani_items.each(function(){
					if( !$(this).data('position') ){
						var left = $(this).position().left;
						var top = $(this).position().top;

						if( $(this).css("margin-left") || $(this).css("margin-top") ){
							if( $(this).css("margin-left") ){
								left = left + parseInt( $(this).css("margin-left") );
							}

							if( $(this).css("margin-top") ){
								top = top + parseInt( $(this).css("margin-top") );
							}
						}

						var std_left = ($win.width() / 2) - ($(this).width() / 2);
						var std_top = ($win.height() / 2) - ($(this).height() / 2);

						var diff = 50;
						if(left + diff <= std_left || left - diff >= std_left){
							left = left;
						} else {
							left = std_left;
						}

						if(top + diff <= std_top || top - diff >= std_top){
							top = top;
						} else {
							top = std_top;
						}

						$(this).data('position', {left: left, top: top});
					}

					$(this).css({
						"opacity":0, 
						"position":"absolute", 
						"width": $(this).width(), 
						"height":$(this).height(), 
						"left": ($win.width() / 2) - ($(this).width() / 2),
						"top": ($win.height() / 2) - ($(this).height() / 2), 
						"margin":0
					});
				});
			} else {
				$('[class*=ani_]', _base).css({opacity:1});
			}
		}

		$_arrowBtns.off('.slideTo').on('click.slideTo', function( e ){
			e.preventDefault();

			_autoSlideStop();
			//animated = false;

			if($(this).hasClass('next'))
				slide( 'next' );
			else if( $(this).hasClass('prev') )
				slide( 'prev' );
		});

		function navi_init(){
			if($_navi_items && $_navi_items.size()){
				$_navi_items.removeClass('on');
				$_navi_items.eq(curr_idx).addClass('on');

				$_navi_items.off('.goToSlide').on('click.goToSlide', function( e ){
					e.preventDefault();
					if(!animated) {
						_autoSlideStop();

						var $_curr_item = $_items.filter(function(){ return $(this).hasClass('curr'); });
						
						curr_idx = $_items.index( $_curr_item );
						next_idx = $_navi_items.index( this );

						if(curr_idx > next_idx){
							slide( 'prev', true );
						} else if(curr_idx < next_idx) {
							slide( 'next', true );
						}
					}
				});
			}
		}

		if(opt && opt.data){
			$_base.data('visual_fn', fn);
		}

	}
		
	$.fn[pluginName] = function(args){
		$_this = $(this);
		$_base = $(args.base || '.visual');

		if(args && args.autoHeight){
			opts['autoHeight'] = args.autoHeight;
			setHeight();
			$win.resize(setHeight);
		}

		if(args && args.scrollBtn){
			opts['scrollBtn'] = args.scrollBtn;
			mainScroll();
		}

		if(args && args.slide){
			opts['slide'] = args.slide;
			mainSlide();
		}

		if(args && args.data){
			$_base.data('visual_fn', fn);
		}
	};

}(jQuery));