<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL INPUT</title>
</head>
<body>
<form name="" method="post" action="jstlResult.jsp">
	<table border=1 cellspacing="0" cellpadding="5">
		<tr>
			<th width="80">이름</th>
			<td><input type="text" name="name" placeholder="이름입력 ">
			</td>
		</tr>
		<tr>
			<th width="80">나이</th>
			<td><input type="text" name="age" placeholder="나이입력 ">
			</td>
		</tr>
		<tr>
			<th width="80">색깔</th>
			<td><select name="color" style="width: 285px">
					<option value="red">빨강</option>
					<option value="green">초록</option>
					<option value="blue">파랑</option>
					<option value="magenta">보라</option>
					<option value="cyan">하늘</option>
			</select></td>
		</tr>
		<tr>
			<th width="80">취미</th>
			<td>
				<input type="checkbox" name="hobby" value="독서">독서
				<input type="checkbox" name="hobby" value="음악">음악 
				<input type="checkbox" name="hobby" value="영화">영화 
				<input type="checkbox" name="hobby" value="쇼핑">쇼핑 
				<input type="checkbox" name="hobby" value="운동">운동
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="제출">
			</td>
		</tr>
	</table>
</body>
</form>
</html>