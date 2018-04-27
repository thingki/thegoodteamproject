<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Vanilla JS Calendar</title>
<style>
		* {
  padding: 0; margin: 0;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}
body {
  font-family: Helvetica, Arial, sans-serif;
  background-color: #f7f7f9;
  color: #777;
  border-top: 5px solid #4d4d4d;
  font-size: 9pt;
}
a:link, a:active, a:visited {
  color: #777;
  text-decoration: none;
}
.dt, .day, .mo {
  text-align: right;
  width: 60px;
  height: 25px;
}
.day, .mo {
  font-weight: bold;
  color: #555;
}
.day, .dt {
  margin-bottom: 5px;
}
.mo {
  margin-bottom: 20px;
}
table, td {
  border-spacing: 0;
  vertical-align: top;
}
h1 {
  display: inline-block;
  font-size: 4.5em;
  margin: 30px 0 0 40px;
}
h2 {
  margin: 0 0 30px 40px;
}

#cal {
  margin: 0 auto;
  width: 780px;
}
#time {
  float: right;
}

body.night {
  background-color: #111;
  color: #EEE;
}
body.night h1 { color: #EEE; }
body.night .day, body.night .mo { color: #aaa; }
	</style>
</head>

<body>
<div id="cal">
  <header>
    <h1 id="caltitle"></h1>
    <h1 id="time"></h1>
    <h2>
      <a id="prev" href=""></a>
      <a id="next" href=""></a>
    </h2>
  </header>

  <table>
    <tr>
      <td>
        <div class="day mo"></div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
        <div class="day">Tu</div>
        <div class="day">We</div>
        <div class="day">Th</div>
        <div class="day">Fr</div>
        <div class="day">Sa</div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
        <div class="day">Tu</div>
        <div class="day">We</div>
        <div class="day">Th</div>
        <div class="day">Fr</div>
        <div class="day">Sa</div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
        <div class="day">Tu</div>
        <div class="day">We</div>
        <div class="day">Th</div>
        <div class="day">Fr</div>
        <div class="day">Sa</div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
        <div class="day">Tu</div>
        <div class="day">We</div>
        <div class="day">Th</div>
        <div class="day">Fr</div>
        <div class="day">Sa</div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
        <div class="day">Tu</div>
        <div class="day">We</div>
        <div class="day">Th</div>
        <div class="day">Fr</div>
        <div class="day">Sa</div>
        <div class="day">Su</div>
        <div class="day">Mo</div>
      </td>
      <td>
        <table id="months">
          <tr id="mtoprow">
            <td class="mc" valign="top"><span id="p0"></span></td>
            <td class="mc" valign="top"><span id="p1"></span></td>
            <td class="mc" valign="top"><span id="p2"></span></td>
            <td class="mc" valign="top"><span id="p3"></span></td>
            <td class="mc" valign="top"><span id="p4"></span></td>
            <td class="mc" valign="top"><span id="p5"></span></td>
            <td class="mc" valign="top"><span id="p6"></span></td>
            <td class="mc" valign="top"><span id="p7"></span></td>
            <td class="mc" valign="top"><span id="p8"></span></td>
            <td class="mc" valign="top"><span id="p9"></span></td>
            <td class="mc" valign="top"><span id="p10"></span></td>
            <td class="mc" valign="top"><span id="p11"></span></td>
          </tr>
        </table>
      </td>
    </tr>	
  </table>
</div>

<div id="tmp">
  <span id="m0" style="display:none">
    <div class="months">
      <div class="mo">Month</div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
      <div class="dt"></div>
    </div>
  </span>
</div>
</body>
<script>
var today = new Date();
var year = today.getUTCFullYear();
var month = today.getUTCMonth();
var day = today.getUTCDate();
var hour = today.getHours();
var minute = today.getMinutes();
var second = today.getSeconds();
var timeish = hour + '.' + (minute * 60);
	
var timeDiff = {
	setStartTime : function () {
		d = new Date();
		time  = d.getTime();
	},

	getDiff : function () {
		d = new Date();
		return (d.getTime()-time);
	}
}

var mtbl  = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var mnames = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun",
	"Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

// End-of-month Julian Day lookup tables for normal and leap years
var jdtbln = new Array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
var jdtbll = new Array(0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335);

var leap = false;
var jdtbl = jdtbln;
var yearpattern = /^\d{4,5}$/;
var displayStyle = "std";
var abtlinkhidden = true;

function isLeap(year) {
	return (year % 100 != 0) && (year % 4 == 0) || (year % 400 == 0);
}
function julianDay(day, month) {
	return day + jdtbl[month-1];
}

// returns the day of week as an integer: 1=Sun, 2=Mon, ..., 7=Sat
function dayOfWeek(day, month, year) {
	leap = isLeap(year);
	jdtbl = leap? jdtbll : jdtbln;
	var dow = (year + julianDay(day, month)
		+ Math.floor((year-1)/4) - Math.floor((year-1)/100)
		+ Math.floor((year-1)/400)) % 7;
	return dow == 0? 7: dow;
}

function renderMonth(parent, month, year) {
	var dateCells = $(parent + " div.dt");
	var cellid = dayOfWeek(1, month, year) - 1;
	var max = mtbl[month-1];
	if (max == 28 && leap) max = 29;

	dateCells.eq(cellid++).html(1);
	for (var ix = 2; ix <= max; ix++) {
		dateCells.eq(cellid++).html(ix);
	}
	$(parent + " div.mo").html(mnames[month-1]);
}

function getMonthSequence(mainMonth) {
	var tmp = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
	if (mainMonth == 0) return tmp;
	
	var monthseq = new Array();
	monthseq.push(mainMonth);
	if (mainMonth == 11) {
		// n+1 isn't possible
		monthseq.push(9);
		monthseq.push(10);
		tmp.splice(9, 3);
	} else {
		monthseq.push(mainMonth-1);
		monthseq.push(mainMonth+1);
		tmp.splice(mainMonth-1, 3);
	}
	return monthseq.concat(tmp);
}

function getIdPrefix(ix) {
	return "#p";
}

function showSelective() {
	$("div#cal").show();
	$("p.prinvis").show();
	$("#mtoprow").show();
}

function renderCalendar(startMonth, stopMonth, year) {
	year = parseInt(year);

	timeDiff.setStartTime();
	var d = new Date();
	var seqargs = 0;
	var monthHtml = $("span#m0").html();
	var monthseq = getMonthSequence(seqargs);

	$("#caltitle").text(year);
	$("title").text(year);
	$('#prev').attr('href', '#' + (year-1)).text(year-1);
	$('#next').attr('href', '#' + (year+1)).text(year+1);

	for (var ix = startMonth-1; ix < stopMonth; ix++) {
		var newId = getIdPrefix(ix) + ix;
		if ($(newId).length == 1) {
			$(newId).html(monthHtml);
			renderMonth(newId, monthseq[ix]+1, year);
		}
	}

	showSelective();
}

// Clock

function convertToHHMM(info) {
	var hrs = parseInt(Number(info));
	var min = Math.round((Number(info)-hrs) * 60);
	return hrs+':'+min;
}
function startTime() {
	var today = new Date();
	var hour = today.getHours();
	var minute = today.getMinutes();
	var second = today.getSeconds();

	if (hour > 12) {
		hour -= 12;
	} else if (hour === 0) {
		hour = 12;
	}

	minute = checkTime(minute);
	second = checkTime(second);
	$('#time').text(hour + ":" + minute + ":" + second);
	t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
	if (i < 10) {
		i = "0" + i;
	}
	return i;
}

$(window).on('hashchange', function() {
	if (window.location.hash) {
		var hash = window.location.hash.replace('#', '');
	}

	if(/^\d{4}$/.test(hash)) {
		renderCalendar(1, 12, hash);
	} else {
		renderCalendar(1, 12, year);
	}
});


// Lets get this shit started
$(document).ready(function () {

	if (window.location.hash) {
		var hash = window.location.hash.replace('#', '');
	}

	if(/^\d{4}$/.test(hash)) {
		renderCalendar(1, 12, hash);
	} else {
		renderCalendar(1, 12, new Date().getFullYear());
	}

	startTime();
	
});
</script>
</html>