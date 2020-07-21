$(document).ready(function(){
	/* 검색목록 */
	$('.dataInfo .abstract').click(function(e){
		var abs = $(this).parent().parent().find('.abstractDetail');
		if(!$(abs).is(':animated')){
			if($(this).parent().next().css('display')=='block'){
				$(this).removeClass('on');
				$(this).parent().next().slideUp(250);
			}else{
				$(this).addClass('on');
				$(this).parent().next().slideDown(250);
			}
		}
	});

	$('.aside .infoService .close').click(function(){
		$('.aside .infoService').fadeOut(300);
		return false;
	});

	$(window).scroll(function(){
		var scrollValue = $(document).scrollTop();
		if(scrollValue > 320){
			$('.aside .infoService').addClass('on');
		}else{
			$('.aside .infoService').removeClass('on');
		}
	});
	
	setTimeout(function(){
		$('.aside .infoService').fadeOut(300);
	},5000)
});