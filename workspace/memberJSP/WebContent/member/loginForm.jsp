<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form name="loginForm" method="post" action="login.jsp">
		<h1>로그인</h1>
		<table border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="로그인" onclick="checkLogin()"> 
				</td>
			</tr>
		</table>
	</form>
</body>
<script src="/memberJSP/js/member.js" type="text/javascript">
</script>
</html>