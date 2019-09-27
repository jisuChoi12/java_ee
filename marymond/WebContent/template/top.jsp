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

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	/* font-weight: bold; */
}

a:active {
	color: black;
	text-decoration: none;
	/* font-weight: bold; */
}

a {
	cursor: pointer;
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
				<dl style="font-family: 'Nanum Myeongjo';">
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
			<span><a href="/marymond/main/index.do">홈</a></span>&emsp; <span><a
				href="/marymond/main/phonecase.do">폰케이스</a></span>&emsp; <span><a
				href="/marymond/main/pattern.do">패턴스토리</a></span>&emsp; <span>이벤트</span>
		</div>
	</div>
</div>
<!-- 로고모달 -->
<div id="myModal" class="modal">
	<div class="modal-content" style="position: relative;">
		<!-- <img src="../image/popup.jpg" height="667px;" width="375px;">
		<div class="btn_x" onclick="close_pop();"
			style="position: absolute; top: 20px; right: 20px; border: 1px solid red;">
			<a href="javaxcript:void(0);" style="font-size: 30px; color: white;">X</a>
		</div> -->
		<img src="../image/popup.jpg" height="667px;" width="375px;">
		<div class="btn_x" onclick="close_pop();"
			style="position: absolute; top: 20px; right: 20px;">
			<a href="javaxcript:void(0);" style="font-size: 20px; color: white;">X</a>
		</div>
	</div>
</div>
<!-- 로그인모달 -->
<div id="loginModal" class="modal">
	<div class="modal-content"
		style="background-color: white; padding: 0 30px; padding-bottom: 30px;">
		<div align="center">
			<div class="top_title"
				style="padding: 10px 0 0 20px; position: relative;">
				<h3
					style="font-size: 24px; line-height: 28px; text-align: left; color: #111; font-weight: 400;">로그인</h3>
				<div class="btn_x" onclick="close_pop();"
					style="position: absolute; top: 15px; right: 0px; font-size: 15px">
					<a href="javaxcript:void(0);">X</a>
				</div>
			</div>
			<form id="loginForm" method="post" action="/marymond/member/login.do">
				<table style="width: 100%; background-color: white;">
					<tr style="width: 100%;">
						<td><input type="text" name="id" id="id"
							style="width: 100%; height: 35px;" placeholder="아이디를 입력해주세요.">
							<div id="idDiv"></div></td>
					</tr>
					<tr>
						<td><input type="password" name="pwd" id="pwd"
							style="width: 100%; height: 35px;" placeholder="비밀번호를 입력해주세요.">
							<div id="pwdDiv"></div></td>
					</tr>
					<tr>
						<td colspan="1" align="left" style="font-size: 12px;">
							<div style="vertical-align: middle;">
								<p
									style="line-height: 12px; margin-top: 5px; margin-bottom: 5px; margin-left: -3px;">
									<input type="checkbox" value="">로그인 유지
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="center"><input type="button"
							id="loginBtn" value="로그인"
							style="width: 100%; height: 40px; border: 0; outline: 0; background-color: #333; color: white; font-size: 16px;"><br>
							<div id="loginResult"></div></td>
					</tr>
					<tr>
						<td colspan="1" align="center"><input type="button"
							id="signinBtn" value="회원가입"
							style="width: 100%; height: 40px; border: 0; outline: 0; background-color: #333; color: white; font-size: 16px;"><br>
							<div id="signinResult"></div></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
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
				// 로그인
				$('#loginBtn').click(
						function() {
							$('#idDiv').empty();
							$('#pwdDiv').empty();

							var id = $('#id').val();
							var pwd = $('#pwd').val();

							if (id == '') {
								$('#idDiv').text("아이디를 입력하세요").css('color',
										'red').css('font-size', '8pt');
							} else if (pwd == '') {
								$('#pwdDiv').text("비밀번호를 입력하세요").css('color',
										'red').css('font-size', '8pt');
							} else {
								$('#loginForm').submit();
							}
						});
				// 회원가입
				$('#signinBtn').click(function(){
					location.href="/marymond/member/joinForm.do";
				});
			});
	function close_pop() {
		/* $('#myModal').hide(); */
		/* $('.modal').find('text').val('').end(); */
		$('#id').val('');
		$('#pwd').val('');
		$('.modal').hide();
	};
</script>