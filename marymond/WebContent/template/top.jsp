<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/top.css">

<div class="gnb_wrap">
	<div class="gnb_box_deco_ver">
		<div class="deco_box">
			<div class="img_box">
				<img id="logo_deco2" src="../image/logo-deco2.jpg">
			</div>
			<div class="deco_txt">
				<dl>
					<dt style="font-size: 12px;">꿋꿋이 희망의 기록을 남기는</dt>
					<dt style="font-family: 'Nanum Myeongjo';">들국화</dt>
				</dl>
			</div>
		</div>
		<ul id="options">
			<li><span id="cartIcon"> <img src="../image/cart.png">장바구니
			</span> &emsp;</li>
			<li id="loginStatus"></li>
			<li><span id="myPageIcon"> <img src="../image/mypage.png">
					마이페이지
			</span>&emsp;</li>
		</ul>
		<div id="pages">
			<span><a href="/marymond/main/index.do">홈</a></span>&emsp; <span><a
				href="/marymond/main/phonecase.do">폰케이스</a></span>&emsp; <span><a
				href="/marymond/main/pattern.do">패턴스토리</a></span>&emsp; <span><a
				href="/marymond/main/event.do">이벤트</a></span>
		</div>
	</div>
</div>
<!-- 로고모달 -->
<div id="myModal" class="modal">
	<div class="modal-content">
		<img src="../image/popup.jpg">
		<div class="btn_x" onclick="close_pop();">
			<a href="javaxcript:void(0);">X</a>
		</div>
	</div>
</div>
<!-- 로그인모달 -->
<div id="loginModal" class="modal">
	<div class="modal-content">
		<div align="center">
			<div class="top_title">
				<h3>로그인</h3>
				<div class="btn_x" onclick="close_pop();">
					<a href="javaxcript:void(0);">X</a>
				</div>
			</div>
			<form id="loginForm" method="post" action="/marymond/member/login.do">
				<table>
					<tr>
						<td><div id="loginResultDiv"></div>
							<input type="text" name="id" id="id" style="width: 100%; height: 35px;" placeholder="아이디를 입력해주세요.">
							<div id="idDiv"></div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pwd" id="pwd" style="width: 100%; height: 35px;" placeholder="비밀번호를 입력해주세요.">
							<div id="pwdDiv"></div>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="left" style="font-size: 12px;">
							<div style="vertical-align: middle;">
								<p>
									<input type="checkbox" name="keepLogin" id="keepLogin">로그인 유지
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="center">
							<input type="button" id="loginBtn" value="로그인"><br>
							<div id="loginResult"></div></td>
					</tr>
					<tr>
						<td colspan="1" align="center"><input type="button" id="joinBtn" value="회원가입"><br>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ('${memId}' != "") {
			$('#loginStatus').append("<span id='logoutIcon'><img src='../image/log-out.png'><span> ${memId}: 로그아웃</span></span>&emsp;");
		} else if ('${memId}' == "") {
			$('#loginStatus').append("<span id='loginIcon'><img src='../image/log-in.png'><span> 로그인</span></span>&emsp;");
		}
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
		// 로그아웃
		$('#logoutIcon').click(function() {
			location.href = "/marymond/member/logout.do";
		});
		$('#myPageIcon').click(function() {
			var id = '${memId}';
			if (id == "") {
				alert("로그인이 필요한 페이지입니다");
				$('#loginModal').show();
			} else {
				location.href="/marymond/member/mypage.do";
			}
		});
		$('#cartIcon').click(function() {
			alert("장바구니페이지로 이동");
		});
		// 로그인
		$('#loginBtn').click(function() {
			$('#idDiv').empty();
			$('#pwdDiv').empty();

			var id = $('#id').val();
			var pwd = $('#pwd').val();
			var keepLogin = document
					.getElementById("keepLogin").checked;

			if (id == '') {
				$('#idDiv').text("아이디를 입력하세요").css('color', 'red').css('font-size', '8pt');
			} else if (pwd == '') {
				$('#pwdDiv').text("비밀번호를 입력하세요").css('color', 'red').css('font-size', '8pt');
			} else {
				$.ajax({
					type : 'POST',
					url : '/marymond/member/login.do',
					data : {
						'id' : id,
						'pwd' : pwd,
						'keepLogin' : keepLogin
					},
					dataType : 'json',
					success : function(data) {
						if (data.result == 'ok') {
							alert(id+ "님 환영합니다");
							location.href = "/marymond/main/index.do";
						} else if (data.result == 'fail') {
							$('#loginResultDiv').text("아이디와 비밀번호를 다시 확인해주세요").css('color','red').css('font-size','8pt');
						}
					},
					error : function() {
						alert("실패");
					}
				});
			}
		});
		// 회원가입
		$('#joinBtn').click(function() {
			location.href = "/marymond/member/joinForm.do";
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