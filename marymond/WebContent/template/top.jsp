<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div calss="gnb_wrap">
	<div class="gnb_box.deco_ver" style="padding-left: 3%;">
		<div class="deco_box" style="display: inline-block; cursor: pointer;"
			onclick="popup()">
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
			style="padding-inline-start: 0px; display: inline-block; float: right; padding-right: 3%;">
			<li style="display: inline-block;"><span onclick="cart()"
				style="cursor: pointer; font-size: 13px;"><img
					src="../image/cart.png" style="height: 20px; width: 20px;">
					장바구니</span>&emsp;</li>
			<li style="display: inline-block;"><span onclick="logIn()"
				style="cursor: pointer; font-size: 13px;"><img
					src="../image/log-in.png" style="height: 20px; width: 20px;">
					로그인</span>&emsp;</li>
			<li style="display: inline-block;"><span onclick="myPage()"
				style="cursor: pointer; font-size: 13px;"><img
					src="../image/mypage.png" style="height: 20px; width: 20px;">
					마이페이지</span>&emsp;</li>
		</ul>
		<div style="padding-top: 18px;">
			<span>홈</span>&emsp; <span>폰케이스</span>&emsp; <span>패턴스토리</span>&emsp;
			<span>이벤트</span>
		</div>
	</div>
</div>

<script type="text/javascript">
	function cart() {
		alert("장바구니");
	}
	function logIn() {
		alert("로그인");
	}
	function popup() {
		alert("popup");
	}
	function myPage() {
		alert("마이페이지");
	}
</script>