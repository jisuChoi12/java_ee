<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/mypage.css">
<div class="mypage_wrap">
	<jsp:include page="mypage_leftside.jsp"/>
	<div class="mypage_right_container_modify">
		<!-- 회원정보 -->
		<div class="mypage_info">
			<h3 style="padding-left: 40px; margin-bottom: 20px;">회원정보 수정</h3>
			<table class="modify_table" style="width: 100%;">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="modify_id" id="modify_id"
								style="width: 95%; height: 35px;" value="${memId }" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>기존 비밀번호</td>
							<td><input type="password" name="old_pwd" id="old_pwd"
								style="width: 95%; height: 35px;"
								placeholder="비밀번호를 입력해주세요">
								<div id="old_pwdDiv"></div></td>
						</tr>
						<tr>
							<td>신규 비밀번호</td>
							<td><input type="password" name="new_pwd" id="new_pwd"
								style="width: 95%; height: 35px;" placeholder="비밀번호 영문+숫자 조합 8~16자리">
								<div id="new_pwdDiv"></div></td>
						</tr>
						<tr>
							<td>신규 비밀번호 확인</td>
							<td><input type="password" name="new_repwd" id="new_repwd"
								style="width: 95%; height: 35px;" placeholder="비밀번호 재확인">
								<div id="new_repwdDiv"></div></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="modify_name" id="modify_name"
								style="width: 95%; height: 35px;" placeholder="이름을 입력해주세요" value="${memName }">
								<div id="modify_nameDiv"></div></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="modify_email1" id="modify_email1"
								style="width: 34%; height: 35px;" value="${memDTO.email1 }"><span
								style="font-size: 16px;"> @ </span> <input type="text"
								name="modify_email2" id="modify_email2" style="width: 52%; height: 35px;" value="${memDTO.email2 }"> 
								<div id="modify_emailDiv"></div></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><select id="modify_birthYear" value="${memDTO.birthYear }"></select> 년 <select
								id="modify_birthMonth" value="${memDTO.birthMonth }"></select> 월 <select id="modify_birthDay" value="${memDTO.birthDay }"></select> 일
								<div class="modify_birthdayDiv"></div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="확인"
								style="width: 98%; height: 40px; border: 0; outline: 0; background-color: #333; color: white; font-size: 16px;"
								onclick="">
								<div class="modifyDiv"></div></td>
						</tr>
					</table>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var today = new Date();
	$(document).ready(function() {
		for (var i = today.getFullYear(); i >= 1900; i--) {
			$('#modify_birthYear').append('<option>' + i + '</option');
		}
		for (var i = 1; i <= 12; i++) {
			$('#modify_birthMonth').append('<option>' + i + '</option>');
		}
		for (var i = 1; i <= 31; i++) {
			$('#modify_birthDay').append('<option>' + i + '</option>');
		}
		$('#modify_birthYear').val('${memDTO.birthYear}');
		$('#modify_birthMonth').val('${memDTO.birthMonth}');
		$('#modify_birthDay').val('${memDTO.birthDay}');
		$('#modify_birthYear, #modify_birthMonth').change(
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
	});
</script>