<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL TEST</title>
</head>
<body>
	<table border="1" width="50%">
		<tr>
			<th width="50%">표현식</th>
			<th width="50%">값</th>
		</tr>
		<tr>
			<td align="center">\${25+3 }</td>
			<td align="center">${25+3 }</td>
		</tr>
		<tr>
			<td align="center">\${25/3 }</td>
			<td align="center">${25/3 }</td> <!-- 정수/실수 구분하지 않음(자료형 없음) -->
		</tr>
		<tr>
			<td align="center">\${25 div 3 }</td>
			<td align="center">${25 div 3 }</td>
		</tr>
		<tr>
			<td align="center">\${25%3 }</td>
			<td align="center">${25%3 }</td>
		</tr>
		<tr>
			<td align="center">\${25 mod 3 }</td>
			<td align="center">${25 mod 3 }</td>
		</tr>
		<tr>
			<td align="center">\${25<3 }</td>
			<td align="center">${25<3 }</td>
		</tr>
		<tr>
			<!-- >(gt), <(lt), >=(ge), <=(le), ==(eq), !=(ne) -->
			<td align="center">\${25 ne 3 }</td>
			<td align="center">${25 ne 3 }</td>
		</tr>
		<tr>
			<td align="center">\${header['host'] }</td>
			<td align="center">${header['host'] }</td>
		</tr>
		<tr>
			<td align="center">\${header.host }</td>
			<td align="center">${header.host }</td>
		</tr>
	</table>
</body>
</html>