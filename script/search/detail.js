$(document).ready(function(){
	/* 가상서가 */
	$('.stack > a.prev').click(function(){
		var listWidth = $('.stack > div ul li').width();
		if(!$('.stack > div ul').is(":animated")){
			$('.stack > div ul li').last().prependTo($('.stack > div ul'));
			$('.stack > div ul').css('left',-listWidth);
			$('.stack > div ul').animate({"left":"0"},500);
		}
		return false;
	});
	$('.stack > a.next').click(function(){
		var listWidth = $('.stack > div ul li').width();
		if(!$('.stack > div ul').is(":animated")){
			$('.stack > div ul').animate({"left":-listWidth},500, function(){
				$('.stack > div ul li').first().appendTo($('.stack > div ul'));
				$('.stack > div ul').css('left','0');
			});
		}
		
		return false;
	});
});