<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<form name="loginForm" method="post"
	action="/miniproject/member/login.do">
	<table border="1" cellspacing="0" cellpadding="5">
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
				onclick="location.href='/miniproject/member/writeForm.do'"></td>
		</tr>
	</table>
</form>
<script src="/miniproject/js/member.js" type="text/javascript">
</script>
