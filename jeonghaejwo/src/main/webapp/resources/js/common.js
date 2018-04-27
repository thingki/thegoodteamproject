//로딩
var spinner;
	var lodingST = false;
	var opts = {
		lines : 13, // The number of lines to draw
		length : 38, // The length of each line
		width : 17, // The line thickness
		radius : 45, // The radius of the inner circle
		scale : 1, // Scales overall size of the spinner
		corners : 1, // Corner roundness (0..1)
		color : 'white', // CSS color or array of colors
		fadeColor : 'transparent', // CSS color or array of colors
		opacity : 0.25, // Opacity of the lines
		rotate : 0, // The rotation offset
		direction : 1, // 1: clockwise, -1: counterclockwise
		speed : 1, // Rounds per second
		trail : 60, // Afterglow percentage
		fps : 20, // Frames per second when using setTimeout() as a fallback in IE 9
		zIndex : 9999, // The z-index (defaults to 2000000000)
		className : 'spinner', // The CSS class to assign to the spinner
		top : '50%', // Top position relative to parent
		left : '50%', // Left position relative to parent
		shadow : '#424242', // Box-shadow for the lines
		position : 'absolute' // Element positioning 
	};
// 페이지 이동할 때 로딩화면 나옴
window.onbeforeunload = function(e){
	var blindHeight = $(document).height();  
	var blindWidth = $(window).width();
	$(function() {
		spinner = new Spinner(opts).spin().el;
		$('body').append(spinner);
		$('.common_blind').css({'width':blindWidth,'height':blindHeight});  
        //애니메이션 효과
        $('.common_blind').fadeIn(1000);
	});
    if(e != null && e != undefined){
        $('.spinner').css('display','');
        $(window).load(function() {
            $('.spinner').css('display', 'none');
            $('.common_blind').hide();  
         });
    }
};
function lodingSt(){
	var blindHeight = $(document).height();  
	var blindWidth = $(window).width();
	$(function() {
		spinner = new Spinner(opts).spin().el;
		$('body').append(spinner);
		$('.common_blind').css({'width':blindWidth,'height':blindHeight});  
        //애니메이션 효과
        $('.common_blind').fadeIn(1000);  
		$('.spinner').css('display','block');
	});
}

function lodingEnd(){
	$('.spinner').css('display', 'none');
	 $('.common_blind').hide();  
}

//더블클릭시 선택되지 않게
window.document.onselectstart = new Function("return false"); 

//시간 설정 버튼 플러스 마이너스 
var count = 0;
function plus(countEl){
	if(count<6){
	    count++;
	    countEl.value = count+" 시간";
	}
}
function minus(countEl){
	if (count > 1) {
	    count--;
	    countEl.value = count+" 시간";
	}
}