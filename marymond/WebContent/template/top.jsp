<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	margin: auto; /* 15% from the top and centered */
	width: 375px; /* Could be more or less, depending on screen size */
}

.jbFixed {
	position: fixed;
	top: 0px;
	/* margin-top: -100px;
		padding-bottom: 100px; */
}
</style>


<div class="gnb_wrap" style="background-color: white; width: 100%;">
	<div class="gnb_box.deco_ver" style="padding-left: 3%;">
		<div class="deco_box"
			style="display: inline-block; cursor: pointer; width: 300px;">
			<div class="img_box" style="display: inline-block;">
				<img src="../image/logo-deco2.jpg"
					style="width: 100px; height: 100px; padding: 0px;">
			</div>
			<div class="deco_txt"
				style="display: inline-block; font-size: 1; vertical-align: top; padding-top: 20px; height: 80px;">
				<dl>
					<dt style="font-size: 12px;">꿋꿋이 희망의 기록을 남기는</dt>
					<dt>들국화</dt>
				</dl>
			</div>
		</div>
		<ul
			style="padding-inline-start: 0px; display: inline-block; float: right; padding-right: 3%; padding: 12 0px;">
			<li style="display: inline-block;"><span id="cartIcon"
				style="cursor: pointer; font-size: 13px;"> <img
					src="../image/cart.png" style="height: 20px; width: 20px;">
					장바구니
			</span>&emsp;</li>
			<li style="display: inline-block;"><span id="loginIcon"
				style="cursor: pointer; font-size: 13px;"> <img
					src="../image/log-in.png" style="height: 20px; width: 20px;">
					로그인
			</span>&emsp;</li>
			<li style="display: inline-block;"><span id="myPageIcon"
				style="cursor: pointer; font-size: 13px;"> <img
					src="../image/mypage.png" style="height: 20px; width: 20px;">
					마이페이지
			</span>&emsp;</li>
		</ul>
		<div style="padding-bottom: 25px; padding-top: 10px;">
			<span>홈</span>&emsp; <span>폰케이스</span>&emsp; <span>패턴스토리</span>&emsp;
			<span>이벤트</span>
		</div>
	</div>
</div>
<!-- 로고모달 -->
<div id="myModal" class="modal">
	<div class="modal-content">
		<img src="../image/popup.jpg" height="667px;" width="375px;">
		<div
			style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
			onclick="close_pop();">
			<span class="pop_bt" style="font-size: 13pt;">닫기</span>
		</div>
	</div>
</div>
<!-- 로그인모달 -->
<div id="loginModal" class="modal">
	<div class="modal-content">
		<div align="center">
			<table style="background-color: white;">
				<tr>
					<td>안녕하세요</td>
				</tr>
			</table>
			<div
				style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
				onclick="close_pop();">
				<span class="pop_bt" style="font-size: 13pt;">닫기</span>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 로고모달
		$('.deco_box').click(function() {
			$('#myModal').show();
		});
		var offSet = $('.gnb_wrap').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > offSet.top) {
				$('.gnb_wrap').addClass('jbFixed');
			} else {
				$('.gnb_wrap').removeClass('jbFixed');
			}
		});
		// 로그인 모달
		$('#loginIcon').click(function() {
			$('#loginModal').show();
		});
		$('#myPageIcon').click(function() {
			alert("마이페이지로 이동");
		});
		$('#cartIcon').click(function() {
			alert("장바구니페이지로 이동");
		});
	});
	function close_pop() {
		/* $('#myModal').hide(); */
		$('.modal').hide();
	};
</script>