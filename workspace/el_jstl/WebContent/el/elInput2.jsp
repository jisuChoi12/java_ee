<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL INPUT2</title>
</head>
<body>
	<form name="inputForm" method="get" action="elResult2.jsp">
	<h3>자바클래스의 메소드를 이용하여 계산</h3>
		<table border=0 cellspacing="2" cellpadding="5">
			<tr>
				<td>X</td>
				<td><input type="text" name="x"></td>
			</tr>
			<tr>
				<td>Y</td>
				<td><input type="text" name="y"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="계산"></td>
			</tr>
		</table>
	</form>
</body>
</html>