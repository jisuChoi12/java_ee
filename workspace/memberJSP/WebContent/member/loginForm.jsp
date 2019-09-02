<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<img src="../image/ni10.gif" width="80" height="80"
		onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	<form name="loginForm" method="post" action="login.jsp">
		<h1>로그인</h1>
		<table border=1 cellspacing="0" cellpadding="5">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="로그인"
					onclick="checkLogin()"> <input type="button" value="회원가입"
					onclick="location.href='writeForm.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
<script src="/memberJSP/js/member.js" type="text/javascript">
</script>
</html>