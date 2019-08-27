<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form name="writeForm" method="post" action="write.jsp">
		<h2>회원가입</h2>
		<table border=3 cellspacing="2" cellpadding="2">
			<tr>
				<th width=120>이름</th>
				<td><input type="text" id="irum" name="name" size=20
					placeholder="이름 입력"></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size=25 placeholder="아이디 입력">
					<input type="button" value=중복체크 onclick="checkId()"><input
					type="hidden" name="check" value=""></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" size=30></td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="repwd" size=30></td>
			</tr>

			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="0"
					checked="checked"> 여성 <input type="radio" name="gender"
					value="1"> 남성</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" name="email1" size=15> @ <input
					list="mailaddr" name="email2" size=15 placeholder="직접입력"> <datalist
						id="mailaddr">
						<option value="gmail.com"></option>
						<option value="naver.com"></option>
						<option value="hotmail.com"></option>
					</datalist></td>
			</tr>

			<tr>
				<th>핸드폰</th>
				<td><select name="tel1">
						<option value="010">010</option>
						<option value="019">019</option>
						<option value="011">011</option>
				</select> <input type="text" name="tel2" size=5> <input type="text"
					name="tel3" size=5></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" id="daum_zipcode" name="zipcode" size=5
					readonly> <input type="button" value="우편번호검색"
					onclick="checkPost()"> <br> <input type="text"
					id="daum_addr1" name="addr1" size=40 placeholder="주소 " readsonly><br>
					<input type="text" id="daum_addr2" name="addr2" size=40
					placeholder="상세 주소 "></td>
			</tr>

			<tr>
				<td colspan=2 align="center"><input type="button" value="회원가입"
					onclick="checkWrite()"> <input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
<!-- <form> 안에 <form>을 중첩할 수 없다 ! -->

<script src="/memberJSP/js/member.js" type="text/javascript">
	
</script>
<!-- webcontent는 이클립스에서 제공하는 임시 폴더이므로 주소에 포함되지 않는다.  -->

</html>