$(document).ready(function(){
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
	
	/* 검색키워드 */
	function automove(){
		var auto = setInterval(function(){
			$('.keyword > ul').animate()
		},1000);
	}

	/* 검색 SelectBox */
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

	/* 이용안내 더보기 */
	$('#footer .privacy dl dt a').click(function(){
		if(!$('#footer .privacy dl dd').is(":animated")){
			if($('#footer .privacy dl dd').css('display') == 'block'){
				$('#footer .privacy dl').removeClass('on');
				$('#footer .privacy dl dd').slideUp(250);
			}else{
				$('#footer .privacy dl').addClass('on');
				$('#footer .privacy dl dd').slideDown(250);
			}
		}
		return false;
	});
});