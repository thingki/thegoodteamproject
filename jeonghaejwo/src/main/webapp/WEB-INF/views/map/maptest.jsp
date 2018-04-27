<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

<script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/sdras/pen/qOdwdB?limit=all&page=27&q=main" />
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
<style class="cp-pen-styles">
body {
  font-family: 'Montserrat', sans-serif;
  width: 100vw;
  height: 100vh;
  background: #111;
  color: white;
  font-size: 9px;
  letter-spacing: 0.22em;
  text-transform: uppercase;
}

.marker-dialog, .marker-touch {
  width: 315px;
  position: absolute;
  left: 440px;
  top: 50px;
  cursor: pointer;
}

.boxes {
  position: absolute;
  left: 550px;
  top: 160px;
  z-index: 500;
}
.boxes .co-element {
  font-size: 11px;
  letter-spacing: 0.22em;
  text-align: center;
  margin-bottom: 10px;
}

.sent {
  text-align: center;
  line-height: 1.6;
  position: absolute;
  left: 473px;
  top: 141px;
  width: 250px;
  z-index: 300;
}

.sent-main {
  font-size: 13px;
  margin: 4px 0;
}

.message {
  color: #777;
}

.check {
  width: 15px;
  position: absolute;
  top: -52px;
  left: 39px;
  fill: none;
  stroke: #FFFFFF;
  stroke-width: 4;
  stroke-linecap: round;
}

.email-box input {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  -webkit-box-shadow: none;
          box-shadow: none;
  border: none;
  outline: none;
  background: #777777;
  color: black;
  -webkit-transition: all 0.7s ease;
  transition: all 0.7s ease;
  padding: 8px 5px 8px 55px;
  width: 125px;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.email-box input:hover {
  background: #888888;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

.email {
  position: absolute;
  top: 9px;
  left: 68px;
  color: black;
}

.submit {
  padding: 8px 5px;
  width: 175px;
  background: #0083b2;
  cursor: pointer;
  color: black;
  -webkit-transition: all 0.7s ease;
  transition: all 0.7s ease;
}
.submit:hover {
  background: #00a9e5;
  -webkit-transition: all 0.7s ease;
  transition: all 0.7s ease;
}

.marker-touch {
  cursor: pointer;
  z-index: 5000;
}

.dialog-text {
  position: absolute;
  left: 575px;
  top: 110px;
  z-index: 300;
}
.dialog-text .details {
  margin: 20px 20px -8px;
  line-height: 2em;
  padding: 0;
  letter-spacing: 0.17em;
}

.lg-circ {
  fill: #005d7f;
}

.md-circ {
  fill: #0083b2;
}

.sm-circ {
  fill: #00a9e5;
}

.main {
  font-size: 11px;
  line-height: 0.5em;
  text-transform: uppercase;
  letter-spacing: 0.22em;
  color: white;
}

.gr {
  color: #777777;
}

.higher {
  position: absolute;
  z-index: 5000;
}

.contact {
  position: absolute;
  z-index: 7000;
}

.contact-stay {
  left: 485px;
  top: 198px;
  position: absolute;
  z-index: 550;
  line-height: 1em !important;
}

a.button {
  padding: 8px;
  border: 1px solid #005d7f;
  color: #00a9e5;
  text-transform: uppercase;
  letter-spacing: 0.12em;
  opacity: 0.75;
  cursor: pointer;
  -webkit-transition: all 0.7s ease;
  transition: all 0.7s ease;
}
a.button:hover {
  -webkit-transition: all 0.4s ease;
  transition: all 0.4s ease;
  opacity: 1;
  background: rgba(0, 93, 127, 0.4);
  color: tint(#00a9e5, 30%) !important;
}

#close {
  cursor: pointer;
}

.scale {
  width: 20px;
  fill: #ccc;
}

.map {
  position: absolute;
  width: 800px;
  height: 350px;
  border: 1px solid #0083b2;
  left: 217px;
  top: 15px;
  background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/28963/map4-opt.jpg") top left no-repeat;
  background-size: cover;
  opacity: 0.85;
}

#box, #corner, .dialog-text span, #close path, .contact, #divider, .co-element, .boxes, .check, .sent {
  visibility: hidden;
}

.hide {
  -webkit-transform: scale(0);
          transform: scale(0);
  visibility: hidden;
  height: 0;
  width: 0;
}

/*----resp -----*/
@media (max-width: 900px) {
  .map {
    left: 117px !important;
  }
}
@media (max-width: 800px) {
  .map {
    left: 17px !important;
  }

  .marker-dialog, .marker-touch {
    left: 240px !important;
  }

  .boxes {
    left: 350px !important;
  }

  .sent {
    left: 273px !important;
  }

  .dialog-text {
    left: 375px !important;
  }

  .contact-stay {
    left: 285px !important;
  }
}
@media (max-width: 700px) {
  .map {
    left: -117px !important;
  }

  .marker-dialog, .marker-touch {
    left: 140px !important;
  }

  .boxes {
    left: 250px !important;
  }

  .sent {
    left: 173px !important;
  }

  .dialog-text {
    left: 275px !important;
  }

  .contact-stay {
    left: 185px !important;
  }
}
@media (max-width: 500px) {
  .map {
    left: -217px !important;
  }

  .marker-dialog, .marker-touch {
    left: 40px !important;
  }

  .boxes {
    left: 150px !important;
  }

  .sent {
    left: 73px !important;
  }

  .dialog-text {
    left: 175px !important;
  }

  .contact-stay {
    left: 85px !important;
  }
}
@media (max-width: 450px) {
  .map {
    left: -217px !important;
    width: 600px !important;
  }

  .marker-dialog, .marker-touch, .boxes, .sent, .dialog-text, .contact-stay {
    margin-left: 0px;
  }
}
@media screen\0 {
  .marker-dialog {
    position: fixed;
    margin-top: -200px;
  }

  .marker-touch {
    margin-top: 50px;
  }

  .check {
    margin-top: -23px;
  }
}
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  .marker-dialog {
    position: fixed;
    margin-top: -200px;
  }

  .marker-touch {
    margin-top: 50px;
  }

  .check {
    margin-top: -23px;
  }
}
@supports (-ms-accelerator: true) {
  .marker-dialog {
    position: fixed;
    margin-top: -200px;
  }

  .marker-touch {
    margin-top: 50px;
  }

  .check {
    margin-top: -23px;
  }
}
</style>
</head>
<body>
<div class="map"></div><!--map-->
<div class="dialog-text">
  <p class="main"><span>Cleveland Offices</span></p>
  <p class="details">
    <span>240 MAIN STREET</span><br>
    <span class="gr">(210) 555 ~ 4598</span>
  </p>
  <p class="details">
    <span>MONDAY - FRIDAY</span><br>
    <span class="gr">8:00AM ~ 5:00PM</span>
  </p>
</div><!--dialog-text-->
<div class="contact"><a class="button contact-stay">Contact</a></div>
<div class="boxes">
  <div class="email-box co-element">
    <input type="email" class="inCo"/>
    <label for="email" class="email">Email</label>
    <div class="bar"></div>
  </div>
  <div class="submit co-element"><span class="sub">Submit</span></div>
  <svg class="check" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
	  viewBox="0 0 50 50">
    <title>check</title>
    <line x1="4.4" y1="28.3" x2="22" y2="45"/>
    <line x1="22" y1="45" x2="45.9" y2="2.3"/>
</svg>
</div><!--boxes-->

<div class="sent">
    <div class="sent-main">Sent Successfully<br></div>
    <span class="message">We will be in touch with you shortly.</span>
</div>

<svg class="marker-dialog" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 420 310">
  <path id="marker" d="M254.8 179.8c-11.5-11.6-27.3-18.7-44.9-18.7-35 0-63.4 28.5-63.4 63.8 0 26 20.3 48.1 38.2 62.7 16.4 13.4 24 20.4 25.1 21.4.2.1.2.1.9-.6 2.3-2.1 10-9 24.5-20.8 17.8-14.6 38.2-36.7 38.2-62.7 0-17.6-7.1-33.6-18.6-45.1z" />
  <path id="box" d="M2 2h416v283H2z" />
  <g id="target">
    <path class="lg-circ" d="M241.3 211.9c-1.8-4.2-4.2-7.8-7.2-10.8s-6.6-5.5-10.8-7.2c-4.2-1.8-8.6-2.7-13.2-2.7s-9 .9-13.2 2.7c-4.2 1.8-7.8 4.2-10.8 7.2s-5.5 6.6-7.2 10.8c-1.8 4.2-2.7 8.6-2.7 13.2s.9 9 2.7 13.2c1.8 4.2 4.2 7.8 7.2 10.8s6.6 5.5 10.8 7.2c4.2 1.8 8.6 2.7 13.2 2.7s9-.9 13.2-2.7c4.2-1.8 7.8-4.2 10.8-7.2s5.5-6.6 7.2-10.8c1.8-4.2 2.7-8.6 2.7-13.2s-.9-9-2.7-13.2zm-5.7 24.1c-1.5 3.4-3.4 6.4-5.9 8.9-2.5 2.5-5.4 4.5-8.9 5.9-3.4 1.5-7 2.2-10.8 2.2s-7.4-.7-10.8-2.2c-3.4-1.5-6.4-3.4-8.9-5.9-2.5-2.5-4.5-5.4-5.9-8.9-1.5-3.4-2.2-7-2.2-10.8s.7-7.4 2.2-10.8c1.5-3.4 3.4-6.4 5.9-8.9 2.5-2.5 5.4-4.5 8.9-5.9 3.4-1.5 7-2.2 10.8-2.2 3.8 0 7.4.7 10.8 2.2 3.4 1.5 6.4 3.4 8.9 5.9 2.5 2.5 4.5 5.4 5.9 8.9 1.5 3.4 2.2 7 2.2 10.8s-.7 7.3-2.2 10.8z"
    />
    <path class="md-circ" d="M225.3 209.9c-1.9-1.9-4.2-3.5-6.9-4.6-2.7-1.1-5.5-1.7-8.4-1.7s-5.7.6-8.4 1.7-5 2.7-6.9 4.6-3.5 4.2-4.6 6.9c-1.1 2.7-1.7 5.5-1.7 8.4 0 2.9.6 5.7 1.7 8.4s2.7 5 4.6 6.9 4.2 3.5 6.9 4.6c2.7 1.1 5.5 1.7 8.4 1.7s5.7-.6 8.4-1.7 5-2.7 6.9-4.6 3.5-4.2 4.6-6.9c1.1-2.7 1.7-5.5 1.7-8.4 0-2.9-.6-5.7-1.7-8.4s-2.7-5-4.6-6.9zm-1.1 21.3c-.8 1.9-1.9 3.6-3.3 4.9-1.4 1.4-3 2.5-4.9 3.3s-3.9 1.2-6 1.2-4.1-.4-6-1.2-3.6-1.9-4.9-3.3c-1.4-1.4-2.5-3-3.3-4.9-.8-1.9-1.2-3.9-1.2-6s.4-4.1 1.2-6 1.9-3.6 3.3-4.9c1.4-1.4 3-2.5 4.9-3.3 1.9-.8 3.9-1.2 6-1.2s4.1.4 6 1.2 3.5 1.9 4.9 3.3c1.4 1.4 2.5 3 3.3 4.9s1.2 3.9 1.2 6c.1 2.1-.4 4.1-1.2 6z"
    />
    <path class="sm-circ" d="M210 215.9c-2.6 0-4.7.9-6.6 2.7-1.8 1.8-2.7 4-2.7 6.6s.9 4.7 2.7 6.6c1.8 1.8 4 2.7 6.6 2.7s4.7-.9 6.6-2.7c1.8-1.8 2.7-4 2.7-6.6s-.9-4.7-2.7-6.6c-1.9-1.8-4-2.7-6.6-2.7zm2.2 11.4c-.6.6-1.3.9-2.2.9s-1.6-.3-2.2-.9c-.6-.6-.9-1.3-.9-2.2s.3-1.6.9-2.2c.6-.6 1.3-.9 2.2-.9s1.6.3 2.2.9c.6.6.9 1.3.9 2.2s-.3 1.6-.9 2.2z"
    />
  </g>
  <g id="close" stroke-miterlimit="10">
    <rect id="closeback" fill="black" x="370.8" y="20.7" width="24.8" height="24.8"/>
    <path fill="none" stroke="#777" d="M370.8 20.7l24.8 24.8" />
    <path fill="none" stroke="#777" d="M395.6 20.7l-24.8 24.8" />
  </g>
  <g id="corner">
    <defs>
      <path id="SVGID_1_" d="M2 2h227.8L2 231.3z" />
    </defs>
    <clipPath id="SVGID_2_">
      <use xlink:href="#SVGID_1_" overflow="visible" />
    </clipPath>
    <g clip-path="url(#SVGID_2_)">
      <image overflow="visible" width="3210" height="2448" xlink:href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/28963/bridge-opt.jpg" transform="matrix(.098 0 0 .098 -84.265 -32.095)" />
    </g>
    <g>
      <defs>
        <path id="SVGID_3_" d="M2 2h227.8L2 231.3z" />
      </defs>
      <clipPath id="SVGID_4_">
        <use xlink:href="#SVGID_3_" overflow="visible" />
      </clipPath>
    </g>
  </g>
  <path id="divider" fill="none" stroke="#333" stroke-miterlimit="10" d="M204 184h142" />
</svg>

<div class="marker-touch">
  <svg viewBox="0 0 420 310">
    <path fill="none" d="M254.8 179.8c-11.5-11.6-27.3-18.7-44.9-18.7-35 0-63.4 28.5-63.4 63.8 0 26 20.3 48.1 38.2 62.7 16.4 13.4 24 20.4 25.1 21.4.2.1.2.1.9-.6 2.3-2.1 10-9 24.5-20.8 17.8-14.6 38.2-36.7 38.2-62.7 0-17.6-7.1-33.6-18.6-45.1z" />
  </svg></div>
<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//code.jquery.com/jquery-3.0.0-alpha1.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js'></script><script src='//s3-us-west-2.amazonaws.com/s.cdpn.io/16327/DrawSVGPlugin.js?r=11'></script>
<script >var tp = $("#target path"),
  marker = $("#marker"),
  corner = $("#corner"),
  close = $("#close path"),
  divide = $("#divider"),
  box = $("#box"),
  boxes = $(".boxes"),
  sent = $(".sent"),
  check = $(".check"),
  coEl = $(".co-element"),
  cont = $(".dialog-text span"),
  button = $(".contact");

TweenMax.set(coEl, {
  opacity: 0,
  visibility: "visible"
});

TweenMax.set(close, {
  drawSVG: "50% 50%",
  opacity: 0
});

TweenMax.set(check, {
  scale: 0,
  visibility: "visible"
});

//animation that's repeated for all of the sections
function revolve() {
  var tl = new TimelineMax({
    repeat: -1
  });

  tl.add("begin");
  tl.staggerFromTo(tp, 2.5, {
    scale: 1,
    opacity: 0.7
  }, {
    scale: 1.2,
    opacity: 0,
    transformOrigin: "50% 50%",
    ease: Expo.easeInOut
  }, 0.2, "begin");
  tl.staggerTo(tp, 0.75, {
    scale: 1,
    opacity: 0.7
  }, 0.25);

  tl.timeScale(1.7);

  return tl;
}
var repeat = revolve();

TweenMax.set(box, {
  visibility: "visible",
  scaleX: .19,
  scaleY: 0,
  transformOrigin: "50% 90%"
});

TweenMax.set(corner, {
  visibility: "visible",
  perspective: 600,
  y: -3
});

TweenMax.set(cont, {
  opacity: 0,
  y: -7,
  visibility: "visible"
});

TweenMax.set("#closeback, .boxes, .sent, .message", {
  opacity: 0,
  visibility: "visible",
});

TweenMax.set([button, divide, close], {
  visibility: "visible"
});

TweenMax.set(marker, {
  scaleX: 1
});

function sceneOne() {
  var tl = new TimelineMax({
    paused: true
  });

  tl.add("start");
  tl.staggerFromTo(tp, 0.75, {
    scale: 1,
    opacity: 0.8
  }, {
    scale: 1.6,
    opacity: 0,
    transformOrigin: "50% 50%",
    ease: Circ.easeInOut
  }, 0.08, "start");
  tl.to(".map", 3, {
    scale: 1.008,
    transformOrigin: "50% 50%",
    ease: Linear.easeNone
  }, 0.2, "start");
  tl.fromTo(marker, 0.7, {
    scaleX: 1
  }, {
    scaleX: 0.62,
    transformOrigin: "50% 50%",
    ease: Sine.easeIn
  }, "start+=0.05");
  tl.to(box, 0.7, {
    scaleY: 0.7,
    transformOrigin: "50% 120%",
    ease: Expo.easeIn
  }, "start+=0.05");
  tl.to(marker, 0.5, {
    scaleX: 0.62,
    transformOrigin: "50% 50%",
    ease: Sine.easeIn
  }, "start+=1.2");
  tl.to(box, 0.5, {
    scale: 1,
    y: 90,
    transformOrigin: "50% 130%",
    ease: Expo.easeOut
  }, "start+=1");
  tl.fromTo(close, 0.1, {
    opacity: 0
  }, {
    opacity: 1
  }, "start");
  tl.fromTo(corner, 0.4, {
    opacity: 0,
    scale: 1
  }, {
    opacity: 1,
    scale: 1,
    ease: Sine.easeOut
  }, "start+=1.4");
  tl.staggerTo(cont, 1, {
    y: 0,
    opacity: 1,
    ease: Sine.easeOut
  }, 0.11, "start+=1.25");
  tl.fromTo(button, 0.8, {
    opacity: 0,
    y: -2
  }, {
    opacity: 1,
    y: 0,
    ease: Sine.easeOut
  }, "start+=1.9");
  tl.fromTo(divide, 1, {
    scaleX: 0
  }, {
    scaleX: 1,
    ease: Expo.easeOut
  }, "start+=2");
  tl.fromTo(close, 1.1, {
    drawSVG: "50% 50%"
  }, {
    drawSVG: true,
    ease: Expo.easeOut,
  }, "start+=2");

  tl.timeScale(1.1);

  return tl;
}
var master = sceneOne();

//contact in
function contact() {
  var tl = new TimelineMax({
    paused: true
  });

  tl.add("over");
  tl.to(boxes, 0.1, {
    opacity: 1
  }, "over");
  tl.to(button, 0.5, {
    y: -62,
    x: 78,
    lineHeight: "0.5em",
    ease: Expo.easeOut
  }, "over");
  tl.staggerTo(cont, 0.5, {
    opacity: 0,
    ease: Expo.easeOut
  }, 0.1, "over");
  tl.fromTo(coEl, 0.5, {
    opacity: 0
  }, {
    opacity: 1,
    ease: Circ.easeOut
  }, "over");
  tl.to(divide, 1, {
    scaleX: 0,
    ease: Expo.easeOut
  }, "over");

  //tl.timeScale(1.5);

  return tl;
}
var contactbox = contact();

function submitted() {
  var eB = $(".inCo"),
    subM = $(".submit"),
    tl = new TimelineMax({
      paused: true
    });

  tl.add("done");
  tl.to("label", 0.5, {
    opacity: 0,
    ease: Sine.easeIn
  }, "done");
  tl.to(".sub", 0.5, {
    opacity: 0,
    ease: Sine.easeIn
  }, "done");
  tl.to(button, 0.5, {
    opacity: 0,
    ease: Sine.easeIn
  }, "done");
  tl.fromTo(eB, 0.05, {
    width: "125px",
    height: "auto",
    padding: "8px 5px 8px 55px",
    opacity: 1,
    x: 0,
    borderRadius: "0"
  }, {
    width: 20,
    height: 20,
    padding: 0,
    opacity: 0.15,
    x: 60,
    borderRadius: "1000px",
    ease: Circ.easeInOut
  }, "done+=1");
  tl.to(subM, 0.05, {
    width: 20,
    height: 20,
    padding: 0,
    opacity: 0.15,
    x: 60,
    borderRadius: "1000px",
    ease: Circ.easeInOut
  }, "done+=1");
  tl.to(subM, 0.5, {
    opacity: 0.8,
    y: "-=30",
    ease: Circ.easeInOut
  }, "done+=1.5");
  tl.to(eB, 0.5, {
    opacity: 0.8,
    y: "+=30",
    ease: Circ.easeInOut
  }, "done+=1.5");
  tl.to(subM, 0.5, {
    opacity: 0.2,
    y: "+=30",
    ease: Circ.easeInOut
  }, "done+=2.5");
  tl.to(eB, 0.5, {
    opacity: 0.2,
    y: "-=30",
    ease: Circ.easeInOut
  }, "done+=2.5");
  tl.to(subM, 0.5, {
    opacity: 0.8,
    y: "-=30",
    ease: Circ.easeInOut
  }, "done+=3.5");
  tl.to(eB, 0.5, {
    opacity: 0.8,
    y: "+=30",
    ease: Circ.easeInOut
  }, "done+=3.5");
  tl.to(subM, 0.25, {
    opacity: 0.8,
    y: "+=15",
    ease: Circ.easeInOut
  }, "done+=4.5");
  tl.to(eB, 0.25, {
    opacity: 0.8,
    y: "-=15",
    ease: Circ.easeInOut
  }, "done+=4.5");
  tl.to(subM, 0.5, {
    backgroundColor: "#09CA51",
    transformOrigin: "50% 50%",
    scale: 1.75,
    y: "-=70",
    x: "-=23",
    ease: Power3.easeIn
  }, "done+=5.5");
  tl.to(corner, 0.5, {
    opacity: 0,
    scale: 0.9,
    ease: Circ.easeIn
  }, "done+=5.5");
  tl.to(".email-box", 0.02, {
    opacity: 0,
    ease: Circ.easeIn
  }, "done+=5.2");
  tl.to(eB, 0.02, { //makes it prepped for reopening
    opacity: 1
  }, "done+=5.5");
  tl.fromTo(check, 0.2, {
    scale: 0,
    rotation: -30
  }, {
    scale: 1,
    rotation: 0,
    transformOrigin: "50% 50%",
    ease: Back.easeOut
  }, "done+=7.1");
  tl.to(subM, 0.05, {
    scale: 1.25,
    transformOrigin: "50% 50%",
    ease: Back.easeOut
  }, "done+=6.65");
  tl.fromTo(".sent", 0.1, {
    opacity: 0
  }, {
    opacity: 1,
    ease: Sine.easeOut
  }, "done+=5");
  tl.fromTo(".sent-main", 0.75, {
    opacity: 0
  }, {
    opacity: 1,
    ease: Sine.easeOut
  }, "done+=7");
  tl.fromTo(".message", 0.75, {
    opacity: 0
  }, {
    opacity: 1,
    ease: Sine.easeOut
  }, "done+=7.1");

  //tl.timeScale(1.1);

  return tl;
}
var complete = submitted();

//contact out
function conOut() {
  var tl = new TimelineMax({
    paused: true
  });

  tl.add("cOut");
  tl.to(boxes, 0.1, {
    opacity: 0,
    ease: Expo.easeIn
  }, "cOut");
  tl.to(button, 0.3, {
    opacity: 0,
    ease: Expo.easeIn
  }, "cOut");
  tl.fromTo(close, 1.1, {
    drawSVG: true
  }, {
    drawSVG: "50% 50%",
    ease: Expo.easeOut,
  }, "cOut");
  tl.to(corner, 0.4, {
    opacity: 0,
    scale: 1,
    ease: Sine.easeOut
  }, "cOut");
  tl.to(".sent", 0.3, {
    opacity: 0,
    ease: Sine.easeOut
  }, "cOut");
  tl.to(close, 0.4, {
    drawSVG: "50% 50%"
  }, "cOut");
  tl.to(check, 0.4, {
    scale: 0,
    transformOrigin: "50% 50%",
    ease: Sine.easeOut
  }, "cOut");
  tl.to("label", 0.4, {
    scale: 1,
    x: 0,
    opacity: 1
  }, "cOut");
  tl.to(".map", 3, {
    scale: 1,
    transformOrigin: "50% 50%",
    ease: Linear.easeNone
  }, "cOut");
  tl.to(button, 0.1, {
    x: 0,
    lineHeight: "1"
  }, "cOut+=1");
  tl.to(box, 1, {
    scaleY: 0.8,
    scaleX: .19,
    transformOrigin: "50% 0%",
    ease: Expo.easeInOut
  }, "cOut");
  tl.to("label", 0.5, {
    opacity: 1,
    ease: Sine.easeIn
  }, "cOut+=1");
  tl.to(".sub", 0.5, {
    opacity: 1,
    ease: Sine.easeIn
  }, "cOut+=1");
  tl.to(".inCo", 0.1, {
    width: "125px",
    height: "auto",
    padding: "8px 5px 8px 55px",
    opacity: 1,
    x: 0,
    y: 0,
    borderRadius: "0"
  }, "cOut+=1");
  tl.to(".submit", 0.1, {
    width: "175px",
    height: "auto",
    padding: "8px 5px",
    backgroundColor: "#0083b2",
    scale: 1,
    opacity: 1,
    x: 0,
    y: 0,
    borderRadius: "0"
  }, "cOut+=1");
  tl.to(box, 0.75, {
    scaleX: .19,
    scaleY: 0,
    transformOrigin: "50% 90%",
    ease: Expo.easeIn
  }, "cOut+=1");
  tl.to(marker, 0.5, {
    scaleX: 1,
    transformOrigin: "50% 50%",
    ease: Sine.easeIn
  }, "cOut+=1.5");

  tl.timeScale(2);

  return tl;
}
var contactOut = conOut();

$(document).ready(function() {
  var mt = $(".marker-touch"),
    md = $(".marker-dialog"),
    coBut = $(".button");

  $("#close").on("click", function(e) {
    e.preventDefault();
    $(mt).removeClass("hide");

    if ($(md).hasClass("contactOpen")) {
      $(button).removeClass("hide");
      $(coBut).removeClass("main");
      $(coBut).addClass("button");
      contactOut.restart();
    } else {
      master.reverse();
      master.timeScale(1.8);
    }

    repeat.progress(0);
    TweenMax.set(tp, {
      opacity: 0,
    });
    TweenMax.delayedCall(1.6, function() {
      repeat.restart()
    });
    $(md).removeClass("contactOpen");
    $("input[type=email]").val("");
  });

  $(mt).on("click", function(e) {
    e.preventDefault();
    master.restart();
    repeat.pause();
    $(this).addClass("hide");
  });

  $(button).on("click", function(e) {
    e.preventDefault();
    contactbox.restart();
    $(md).addClass("contactOpen");
    $(this).addClass("hide");
    $(this).find(".button").addClass("main");
    $(this).find(".button").removeClass("button");
  });

  $('.email-box input').on("mousenter focus",
    function(e) {
      e.preventDefault();
      TweenMax.to("label", 0.2, {
        scale: 0.75,
        x: -65,
        opacity: 0.75,
        ease: Sine.easeOut
      });
    });

  $('label').on("click",
    function(e) {
      e.preventDefault();
      TweenMax.to("label", 0.2, {
        scale: 0.75,
        x: -65,
        opacity: 0.75,
        ease: Sine.easeOut
      });
    });

  $(".submit").on("click", function(e) {
    e.preventDefault();
    $("input[type=email]").val("");
    complete.restart();
  });

});
//# sourceURL=pen.js
</script>
</body></html>