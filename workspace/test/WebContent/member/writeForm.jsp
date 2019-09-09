<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/member.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
</head>
<body id="body">
	<form name="writeForm" method="post" action="">
		<div id="container">
			<div id="joiner">
				<div id="form">
					<fieldset>
						<legend>JOIN</legend>
						<input type="text" name="name" placeholder="이름을 입력하세요"><br><br>
						<input type="text" name="id" placeholder="아이디를 입력하세요"><br><br>
						<input type="password" name="pwd" placeholder="비밀번호를 입력하세요"><br><br>
						<input type="password" name="repwd" placeholder="비밀번호 재입력"><br><br>
						<input type="button" value="회원가입" onclick="checkWrite()">
						<input type="reset" value="다시작성"><br><br>
						<a href="loginForm.jsp">계정이 있다면 로그인</a>
					</fieldset>
				</div>
			</div>
		</div>
	</form>
</body>
<script src="../js/member.js" type="text/javascript"></script>
</html>