$(document).ready(function(){
	//사이즈 변수 선언(공통 사용)
	var winWidth = window.innerWidth || document.documentElement.clientWidth;//미디어쿼리 사이즈와 $(window).width()가 인식하는 px단위 사이즈가 달라서 선언한 변수 : clinentWidth 와 innerWidth의 사이즈는 동일하나 innerWidth는 익스플로러 9 미만 버전은 인식하지 못하므로 동시선언
	
	/* Whole Menu */
	$('.wholeMenu .menuOpen').click(function(){
		$('.wholeMenu .menuOpen').fadeOut(300);
		$('.wholeMenu > div').fadeIn(300);
		$('.wholeMenu .menuClose').fadeIn(300);
	});
	$('.wholeMenu .menuClose').click(function(){
		$('.wholeMenu .menuOpen').fadeIn(300);
		$('.wholeMenu > div').fadeOut(300);
		$('.wholeMenu .menuClose').fadeOut(300);
	});
	$('.wholeMenu .mobileClose').click(function(){
		$('.wholeMenu .menuOpen').fadeIn(300);
		$('.wholeMenu > div').fadeOut(300);
		$('.wholeMenu .menuClose').fadeOut(300);
	});

	$('.wholeMenu > div > ul > li > a').click(function(){
		$('.wholeMenu > div > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		return false;
	});
	$('.wholeMenu > div > ul > li > ul > li.depth2 > a').click(function(){
		winWidth = window.innerWidth || document.documentElement.clientWidth;
		if(winWidth < 1025){
			if(!$('.wholeMenu > div > ul > li > ul > li > ul').is(":animated")){
				if($(this).parent().hasClass('on')){
					$(this).parent().removeClass('on');
					$(this).next().slideUp(200);
				}
				else{
					$('.wholeMenu > div > ul > li > ul > li').removeClass('on');
					$(this).parent().addClass('on');
					$('.wholeMenu > div > ul > li > ul > li > ul').slideUp(200)
					$(this).next().slideDown(200);
				}
			}
			return false;
		}
	});

	/* placeholder */
	$('input, textarea').placeholder({customClass:'placeholder'});

	/* 탭메뉴 */
	if($('#divTabMenu').length > 0){
		if(winWidth < 1024){
			$("#divTabMenu").mThumbnailScroller({
				type:"click-50",
				theme:"buttons-out"
			});
			$("#divTabMenu").mThumbnailScroller("scrollTo", $('#divTabMenu .selected'));
		}else if(winWidth > 1023){
			$("#divTabMenu").mThumbnailScroller("destroy");
		}

		$(window).resize(function(){
			winWidth = window.innerWidth || document.documentElement.clientWidth;
			if(winWidth < 1024){
				$("#divTabMenu").mThumbnailScroller({
					type:"click-50",
					theme:"buttons-out"
				});
				$("#divTabMenu").mThumbnailScroller("scrollTo", $('#divTabMenu .selected'));
			}else if(winWidth > 1023){
				$("#divTabMenu").mThumbnailScroller("destroy");
			}
		});
	}

});