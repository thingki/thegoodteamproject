/*$(document).ready(menuFuc())

	$(window).bind("pageshow", function(event){
		if(event.originalEvent.persisted){
			
		}else{
			$('#menu_checkbox')[0].checked=false
			menuFuc();
		}
	})
*/	
/*function menuFuc(){
	var navStatus=false;
	$('#menu_checkbox').click(function(){
	    if(navStatus==false){
	    	navStatus=true;
	    	$('.menu_grid2').stop().animate({
	            width: "17vw"
	        },600);
	    	$('#mySidenav').stop().animate({
	            right: "0"
	        },600);
	    	$("#mySidenav").css('background-color', "white");
	    }else{
	    	navStatus=false;
	    	$('.menu_grid2').stop().animate({
	            width: "0"
	        },600);
	    	$('#mySidenav').stop().animate({
	            right: "-12vw"
	        },600);
	    	$("#mySidenav").css('background-color', "");
	    }
	});
}*/	


/*
function openNav() {
	$('#mySidenav').click(function(){
        $('#menu_grid2').stop().animate({
            width: "250px"
        },600);
    });
	
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    document.getElementById("mySidenav").style.backgroundColor = "#cacaca";
}

function closeNav() {
	$('#mySidenav').click(function(){
        $('#mySidenav').stop().animate({
            width: "250px",
            right: "0px"
        },600);
    }, function(){
        $('#menu_grid2').stop().animate({
            width: "250px"
        },600);
    });
    document.body.style.backgroundColor = "";
    document.getElementById("mySidenav").style.backgroundColor = "";
}*/

