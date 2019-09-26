<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#disp{
		border: 1px solid black;
	}
</style>

<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 10px;
  width: 10px;
  margin: 2.5px;
  background-color: #ccc;
  border-radius: 60%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: white;
/*   background-color: #717171; */
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
<div class="mainBody" style="height: 1500px; border: 1px solid blue;">
<div class="slideshow-container" align="center" style="border: 1px red solid;">
	<div class="mySlides fade">
		<img src="../image/slide1.PNG" style="width: 100%" style="width:100%">
	</div>
	<div class="mySlides fade">
		<img src="../image/slide2.PNG" style="width: 100%" style="width:100%">
	</div>
	<div class="mySlides fade">
		<img src="../image/slide3.PNG" style="width: 100%" style="width:100%">
	</div>
</div>
<br>
<div style="text-align: center; display: block; position: relative; top: -60px;">
	<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
</div>

</div>

<script type="text/javascript">
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 5000); // Change image every 2 seconds
	}
</script>

 
