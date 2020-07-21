$(document).ready(function(){
	var selectTarget = $('.searchOption select');

	// focus 가 되었을 때와 focus 를 잃었을 때
	selectTarget.on({
		'focus': function() {
			$(this).parent().addClass('focus');
		},
		'blur': function() {
			$(this).parent().removeClass('focus');
		}
	});
	selectTarget.bind('change keyup',function(){
		var select_name = $(this).children('option:selected').text();
		$(this).siblings('label').text(select_name);
	});
	
	$('.shortcutClose').click(function(){
		$('.shortcut').fadeOut(250);
		return false;
	});
	
	/* Tag Canvas */
	if (!$('#myCanvas').tagcanvas({
        textColour: '#ffffff',
		outlineoffset:0,
		outlineThickness:0,
        shape:'sphere',
        reverse: true,
        depth: 0.8,
        maxSpeed: 0.01,
        padding:5,
        minSpeed:0.01,
        textHeight:24,
        offsetY:20,
        stretchX:5,
        initial:[0.2,-0.4],
        zoom:0.7,
        wheelZoom:false,
        textFont:"Roboto, NotoSansM, sans-serif"
        
    }, 'tags')) {
        // something went wrong, hide the canvas container
        $('#myCanvasContainer').hide();
    }
	
	/* Search */
	var $label = $('.selectBoxW > label');
	$label.on('click',function(){
		if(!$(this).parent().hasClass('on')){
			$(this).parent().addClass('on');
			$(this).parent().parent().siblings().find('.divSelectBox').removeClass('on');
			$(this).parent().next().addClass('on');
			$(this).parent().next().children().addClass('on');
		}else{
			$(this).parent().removeClass('on');
			$(this).parent().next().removeClass('on');
			$(this).parent().next().children().removeClass('on');
		}
	});
	$(document).on("click", ".optList > ul > li > a", function(e){
		var optText = $(this).text();
		$(this).parent().parent().parent().parent().prev().find('select').attr('title',$(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().prev().find('label').text($(this).text());//옵션선택시 텍스트 변경
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').removeAttr('selected');
		$(this).parent().parent().parent().parent().siblings().children('select').find('option').filter(function() {return this.text == optText;}).attr('selected', 'selected');
		$label.parent().removeClass('on');
		$label.parent().next().removeClass('on');
		$label.parent().next().children().removeClass('on');
		return false;
	});
	
	/* Search */
	/*$('.search > ul > li > a').click(function(){
		$('.search > ul > li').removeClass();
		$(this).parent().addClass('on');
		var idx = $('.search > ul > li.on').index();
		console.log(idx);
		if(idx == 0){
			$('.search > ul > li').eq(1).addClass('color2');
			$('.search > ul > li').eq(2).addClass('color3');
		}else if(idx==1){
			$('.search > ul > li').eq(0).addClass('color2');
			$('.search > ul > li').eq(2).addClass('color3');
		}else{
			$('.search > ul > li').eq(0).addClass('color2');
			$('.search > ul > li').eq(1).addClass('color3');
		}
		return false;
	});*/
	
	/* 모바일 메뉴 */
	$(".mobileMenu .open").click(function(){
		$('.mobileMenu span.menuBg').fadeIn(500);
		$('.mobileMenu > div').show();
		$('.mobileMenu > div').animate({"right":"0"},500);
		$('html').css('overflow-y','hidden');
	});
	$('.mobileMenu > div a.close').click(function(){
		$('.mobileMenu span.menuBg').fadeOut(500);
		$('.mobileMenu > div').animate({"right":"-50%"},500,function(){
			$('.mobileMenu > div').hide();
		});
		$('html').css('overflow-y','scroll');
	});
	
	/* Quick Menu */
	autoOpacity();
	function autoOpacity(){
		var i = -1;
		var listCnt = $('.quickMenu > ul > li').length;
		
		var auto = setInterval(function(){
			i=i+1;
			//console.log(i);
			if(i > listCnt){
				clearInterval(auto);
			}
			$('.quickMenu > ul > li').eq(i).animate({"opacity":"1"},500);
		},150);
	}
	
	$(".quickMenu > ul > li a").on("mouseover focus", function(){
		var winWidth = window.innerWidth || document.documentElement.clientWidth;
		if(winWidth > 1024){
			$(this).animate({"margin-top":"-15px"},250,function(){
				$(this).animate({"margin-top":"0"},250);
			});
		}
	});
	
	
	/* Book */
	$('.book .tabList > ul > li > a').click(function(){
		$('.book .tabList > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		var idx = $(this).parent().index();
		$('.book > section').removeClass('on').hide();
		$('.book > section').eq(idx).addClass('on').fadeIn(500);
		return false;
	});
	
	
	var dragFlag = false;
	var x,pre_x;
	/*$(function () {
		$('.quickMenu').mousedown(
			function (e) {
				dragFlag = true;
				var obj = $(this);
				x = obj.scrollLeft();
				pre_x = e.screenX;
				$(this).css("cursor", "pointer");
			}
		);
		$('.quickMenu').mousemove(
			function (e) {
				if (dragFlag) {
					var obj = $(this);
					obj.scrollLeft(x - e.screenX + pre_x);
					return false;
				}
			}
		);
		$('.quickMenu').mouseup(
			function () {
				dragFlag = false;				
				$(this).css("cursor", "default");
			}
		);
		$('body').mouseup(
			function () {
				dragFlag = false;
				$(this).css("cursor", "default");
			}
		);
	});*/
	
	$(function () {
		$('.book > section').mousedown(
			function (e) {
				dragFlag = true;
				var obj = $(this);
				x = obj.scrollLeft();
				pre_x = e.screenX;
				$(this).css("cursor", "pointer");
			}
		);
		$('.book > section').mousemove(
			function (e) {
				if (dragFlag) {
					var obj = $(this);
					obj.scrollLeft(x - e.screenX + pre_x);
					return false;
				}
			}
		);
		$('.book > section').mouseup(
			function () {
				dragFlag = false;				
				$(this).css("cursor", "default");
			}
		);
		$('body').mouseup(
			function () {
				dragFlag = false;
				$(this).css("cursor", "default");
			}
		);
	});
});