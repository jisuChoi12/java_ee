<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.join_form_mary {
	padding-top: 70px;
	border: 1px solid red;
}

.formContainer {
	width: 100%;
	border: 1px solid red;
}

.joinForm_wrap {
	width: 620px;
	margin: 0 auto;
	border: 1px solid red;
}

.join_form {
	padding-bottom: 133px;
	border: 1px solid red;
}

.sub_title_box {
	border-bottom: none;
	position: relative;
	border: 1px solid red;
}
</style>

<div id="join_form_mary">
	<form class="joinForm" action="">
		<div class="formContainer">
			<div class="joinForm_wrap">
				<div class="join_form">
					<div class="sub_title_box">
						<h3>회원가입</h3>
					</div>
					<!-- <div class="join_id">
						<span>아이디</span>&emsp;<input type="text" placeholder="아이디를 입력해주세요">
					</div>
					<div class="join_pwd">
						<span>비밀번호</span> <input type="password"
							placeholder="비밀번호 영문+숫자 조합 8~16자리">
					</div>
					<div class="join_repwd">
						<span>비밀번호확인</span> <input type="password" placeholder="비밀번호 재확인">
					</div>
					<div class="join_name">
						<span>이름</span> <input type="text" placeholder="이름을 입력해주세요">
					</div>
					<div class="join_birthday"></div>
					<div class="join_email">
						<span>이메일</span> <input type="text">&emsp;@&emsp;<input
							type="text">
					</div>
					<div class="join_gender">
						<input type="button" name="gender" value="여성" checked="checked">
						<input type="button" name="gender" value="남성">
					</div> -->
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" id="id"
								style="width: 100%; height: 35px;" placeholder="아이디를 입력해주세요.">
								<div id="idDiv"></div></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" id="pwd"
								style="width: 100%; height: 35px;"
								placeholder="비밀번호 영문+숫자 조합 8~16자리">
								<div id="pwdDiv"></div></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="repwd" id="repwd"
								style="width: 100%; height: 35px;" placeholder="비밀번호 재확인">
								<div id="repwdDiv"></div></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name"
								style="width: 100%; height: 35px;" placeholder="이름을 입력해주세요">
								<div id="nameDiv"></div></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email1" id="email1"
								style="width: 35%; height: 35px;"><span
								style="font-size: 16px;"> @ </span> <input type="text"
								name="email2" id="email2" style="width: 55%; height: 35px;">
								<div id="email"></div><div id="emailDiv"></div></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><div class="birthdayDiv"></div></td>
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
	$(document).ready(function(){
		var today = new Date();
		var year = today.getFullYear();
		var month = (today.getMonth()+1);
		var day = today.getDate();
		
	});
</script>
