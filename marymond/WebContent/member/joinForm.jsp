<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/joinForm.css">

<div id="join_form_mary">
	<form class="joinForm" action="">
		<div class="formContainer">
			<div class="joinForm_wrap">
				<div class="join_form">
					<div class="sub_title_box">
						<h3>회원가입</h3>
					</div>
					<table class="join_table" style="width: 100%;">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="join_id" id="join_id"
								style="width: 80%; height: 35px;" placeholder="아이디를 입력해주세요."><input
								type="button" value="중복확인" style="height: 36px;"
								onclick="checkId()">
								<div id="join_idDiv"></div></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="join_pwd" id="join_pwd"
								style="width: 95%; height: 35px;"
								placeholder="비밀번호 영문+숫자 조합 8~16자리">
								<div id="join_pwdDiv"></div></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="repwd" id="repwd"
								style="width: 95%; height: 35px;" placeholder="비밀번호 재확인">
								<div id="repwdDiv"></div></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name"
								style="width: 95%; height: 35px;" placeholder="이름을 입력해주세요">
								<div id="nameDiv"></div></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email1" id="email1"
								style="width: 34%; height: 35px;"><span
								style="font-size: 16px;"> @ </span> <input type="text"
								name="email2" id="email2" style="width: 55%; height: 35px;">
								<div id="emailDiv"></div></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><select id="birthYear"></select> 년 <select
								id="birthMonth"></select> 월 <select id="birthDay"></select> 일
								<div class="birthdayDiv"></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="회원가입"
								style="width: 98%; height: 40px; border: 0; outline: 0; background-color: #333; color: white; font-size: 16px;"
								onclick="checkWrite()">
								<div class="writeDiv"></div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var today = new Date();
	$(document).ready(
			function() {
				for (var i = today.getFullYear(); i >= 1900; i--) {
					$('#birthYear').append('<option>' + i + '</option');
				}
				for (var i = 1; i <= 12; i++) {
					$('#birthMonth').append('<option>' + i + '</option>');
				}
				for (var i = 1; i <= 31; i++) {
					$('#birthDay').append('<option>' + i + '</option>');
				}

				$('#birthYear, #birthMonth').change(
						function() {
							var birthday = new Date($('#birthYear').val(), $(
									'#birthMonth').val(), 0);
							var lastday = birthday.getDate();
							$('#birthDay').empty();
							for (var i = 1; i <= lastday; i++) {
								$('#birthDay').append(
										'<option>' + i + '</option>');
							}
						});

				$('#join_id')
						.keyup(
								function() {
									var id = $('#join_id').val();
									if (id.length == 0) {
										$('#join_idDiv').text("아이디를 입력하세요")
												.css('color', 'red').css(
														'font-size', '10pt');
									} else {
										$('#join_idDiv').empty();
									}
								});
				$('#join_pwd')
						.keyup(
								function() {
									var pwd = $('#join_pwd').val();
									if (pwd.length == 0) {
										$('#join_pwdDiv').text("비밀번호를 입력하세요")
												.css('color', 'red').css(
														'font-size', '10pt');
									} else {
										$('#join_pwdDiv').empty();
									}
								});
				$('#repwd')
						.keyup(
								function() {
									var pwd = $('#join_pwd').val();
									var repwd = $('#repwd').val();
									if (pwd != repwd) {
										$('#repwdDiv').text("비밀번호가 같지 않습니다")
												.css('color', 'red').css(
														'font-size', '10pt');
									} else {
										$('#repwdDiv').empty();
									}
								});
				$('#name').keyup(
						function() {
							var name = $('#name').val();
							if (name.length == 0) {
								$('#nameDiv').text("이름을 입력하세요").css('color',
										'red').css('font-size', '10pt');
							} else {
								$('#nameDiv').empty();
							}
						});
				$('#email1, #email2').keyup(
						function() {
							var email1 = $('#email1').val();
							var email2 = $('#email2').val();
							if (email1 == '' || email2 == '') {
								$('#emailDiv').text("이메일을 입력하세요").css('color',
										'red').css('font-size', '10pt');
							} else {
								$('#emailDiv').empty();
							}
						});

			});
</script>
<script type="text/javascript">
	function checkId() {
		var id = $('#join_id').val();
		if (id.length == 0) {
			$('#join_idDiv').text("아이디를 입력하세요").css('color', 'red').css(
					'font-size', '8pt');
		}
		if (id.length != 0) {
			$.ajax({
				type : 'POST',
				url : '/marymond/member/checkId.do',
				data : "id=" + id,
				dataType : 'json',
				success : function(data) {
					if (data.result == 'ok') {
						$('#join_idDiv').text("사용 가능한 아이디입니다").css('color',
								'blue').css('font-size', '10pt');
					} else if (data.result == 'fail') {
						$('#join_idDiv').text("이미 존재하는 아이디입니다").css('color',
								'blue').css('font-size', '10pt');
					}
				},
				error : function() {
					alert("실패");
				}
			});
		}
	}
	function checkWrite() {
		var id = $('#join_id').val();
		var pwd = $('#join_pwd').val();
		var name = $('#name').val();
		var email1 = $('#email1').val();
		var email2 = $('#email2').val();
		var birthYear = $('#birthYear').val();
		var birthMonth = $('#birthMonth').val();
		var birthDay = $('#birthDay').val();
		var join_idDiv = $('#join_idDiv').text();
		var join_pwdDiv = $('#join_pwdDiv').text();
		var join_repwdDiv = $('#join_repwdDiv').text();

		
		if(id != "" && pwd != "" && name != "" && email1 !="" && email2 !="" && join_idDiv == "사용 가능한 아이디입니다" && join_pwdDiv == "" && join_repwdDiv == ""){
			$.ajax({
				type : 'POST',
				url : '/marymond/member/join.do',
				data : {'id' : id, 'pwd' : pwd, 'name' : name, 'email1' : email1, 'email2' : email2, 'birthYear' : birthYear, 'birthMonth' : birthMonth, 'birthDay' : birthDay},
				dataType : 'json',
				success : function(data) {
					if (data.result == 'ok') {
						alert("회원가입 성공");
						location.href="/marymond/main/index.do";
					} else if (data.result == 'fail') {
						alert("회원가입 실패");
						location.href="/marymond/member/joinForm.do";
					}
				},
				error : function() {
					alert("실패");
				}
			});
		} else {
			$('.writeDiv').text("항목을 다시 확인해주세요").css('color','red').css('font-size', '10pt');
		}
	}
</script>
