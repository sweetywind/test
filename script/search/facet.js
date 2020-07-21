$(document).ready(function(){
	/* Facet */
	$('.facet > ul > li.type1 > a').click(function(){
		if(!$(".facet > ul > li.type1 > ul").is(':animated')){
			if($(this).parent().hasClass('on')){
				$(this).parent().removeClass('on');
				$(this).next().slideUp(250);
			}else{
				$(this).parent().addClass('on');
				$(this).next().slideDown(250);
			}
		}
		return false;
	});

	$('.facet > ul > li > div > ul > li > p > button').click(function(){
		if(!$(".facet > ul > li > div > ul > div").is(':animated')){
			if($(this).parent().next().css('display')=='block'){
				$(this).parent().next().slideUp(250);
			}else{
				$(this).parent().next().slideDown(250);
			}
		}
	});
});