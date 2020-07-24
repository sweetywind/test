$(function(){
	//월간,주간,리스트 선택-모바일
	$(window).resize(function(){
		if($(window).width()<768){
			$('.schTypeSelect a').toggle(function(){
				$(this).parent().next().show();
				$(this).children().eq(1).attr({'src': IMG_PATH+'solution/common/ico/calTypeClose.png'},{'alt':'닫기'});
			},function(){
				$(this).parent().next().hide();
				$(this).children().eq(1).attr({'src':IMG_PATH+'solution/common/ico/calTypeOpen.png'},{'alt':'열기'});
			});
		}else{
			$('.scheduleType ul').show();
		}
	});
	if($(window).width()<768){
		$('.schTypeSelect a').toggle(function(){
			$(this).parent().next().show();
			$(this).children().eq(1).attr({'src':IMG_PATH+'solution/common/ico/calTypeClose.png'},{'alt':'닫기'});
		},function(){
			$(this).parent().next().hide();
			$(this).children().eq(1).attr({'src':IMG_PATH+'solution/common/ico/calTypeOpen.png'},{'alt':'열기'});
		});
	}
	
	//달력
	var widthType7=$('.grid > td').outerWidth()*7-32;
	var widthType6=$('.grid > td').outerWidth()*6-32;
	var widthType5=$('.grid > td').outerWidth()*5-32;
	var widthType4=$('.grid > td').outerWidth()*4-32;
	var widthType3=$('.grid > td').outerWidth()*3-32;
	var widthType2=$('.grid > td').outerWidth()*2-32;
	var widthType1=$('.grid > td').outerWidth()*1-32;
	$('.widthType7').css('width',widthType7);
	$('.widthType6').css('width',widthType6);
	$('.widthType5').css('width',widthType5);
	$('.widthType4').css('width',widthType4);
	$('.widthType3').css('width',widthType3);
	$('.widthType2').css('width',widthType2);
	$('.widthType1').css('width',widthType1);
	
	$(window).resize(function(){
		widthType7=$('.grid > td').outerWidth()*7-32;
		widthType6=$('.grid > td').outerWidth()*6-32;
		widthType5=$('.grid > td').outerWidth()*5-32;
		widthType4=$('.grid > td').outerWidth()*4-32;
		widthType3=$('.grid > td').outerWidth()*3-32;
		widthType2=$('.grid > td').outerWidth()*2-32;
		widthType1=$('.grid > td').outerWidth()*1-32;
		$('.widthType7').css('width',widthType7);
		$('.widthType6').css('width',widthType6);
		$('.widthType5').css('width',widthType5);
		$('.widthType4').css('width',widthType4);
		$('.widthType3').css('width',widthType3);
		$('.widthType2').css('width',widthType2);
		$('.widthType1').css('width',widthType1);
	});
});

$.datepicker.setDefaults({
    monthNames: CONST_MONTH_NAME,
    dayNamesMin: CONST_DAY_NAME,
    showMonthAfterYear:true,
    dateFormat: 'yymmdd',
    duration: 0
});

$(document).ready(function(){
	$("#yearMonth").datepicker();
	$("#searchDay").datepicker();
	$("#ui-datepicker-div").css('z-index','1000');
});

function checked(form) {
	var ret = false;
	
	if (isEverChecked(form.checkbox)) {
		ret = confirm(MSG_COMMON_WARN_REQUEST);
	} else {
		alert(MSG_COMMON_VALID_CHECK_ITEM);
	}
	
	return ret;
}

// ajax를 이용한 년도 선택은 웹 접근성을 생각해서 지웠음, cvs 초기버젼에 존재함
