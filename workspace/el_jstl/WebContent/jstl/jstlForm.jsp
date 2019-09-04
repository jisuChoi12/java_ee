<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlForm</title>
</head>
<body>
	<form name="jstlForm" method="post" action="jstlWrite.jsp">
	<h2>회원가입</h2>
		<table border=1 cellspacing="0" cellpadding="5">
			<tr>
				<th width=120>이름</th>
				<td><input type="text" id="name" name="name" size=20 placeholder="이름 입력"></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size=25 placeholder="아이디 입력"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" size=30></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
					<input type="button" value="목록" onclick="location.href='jstlList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>