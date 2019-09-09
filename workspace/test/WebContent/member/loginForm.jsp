<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>LOGIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/member.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
</head>
<body id="body">
	<form name="loginForm" action="post" action="">
		<div id="container">
			<div id="loginer">
				<div id="form">
					<fieldset>
						<legend>LOGIN</legend>
						<input type="text" name="id" placeholder="아이디를 입력하세요"><br><br>
						<input type="password" name="pwd" placeholder="비밀번호를 입력하세요"><br><br>
						<input type="button" value="로그인" onclick="checkLogin()">
						<input type="reset" value="다시작성"><br><br>
						<a href="writeForm.jsp">계정이 없다면 회원가입</a>
					</fieldset>
				</div>
			</div>
		</div>
	</form>
</body>
<script src="../js/member.js" type="text/javascript"></script>
</html>