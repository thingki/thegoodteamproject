/* 시간 설정 */
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

function mypage_plus(){
	var countEl = document.getElementById("time_count");
	plus(countEl)
}
function mypage_minus(){
	var countEl = document.getElementById("time_count");
	minus(countEl);
}