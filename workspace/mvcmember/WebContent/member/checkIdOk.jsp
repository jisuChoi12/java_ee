<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ok</title>
</head>
<body>
	${id} : 사용 가능
	<br>
	<br>
	<input type="button" value="사용하기" onclick="checkIdClose('${id}')">
</body>
<script src="/mvcmember/js/member.js" type="text/javascript">	
</script>
</html>