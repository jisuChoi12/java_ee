<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fail</title>
</head>
<body>
	<form name="" method="get" action="/mvcmember/member/checkId.do">
		${id } : 사용 불가능 <br>
		<br> 아이디 <input type="text" name="id"> <input
			type="submit" value="중복체크">
	</form>
</body>
</html>