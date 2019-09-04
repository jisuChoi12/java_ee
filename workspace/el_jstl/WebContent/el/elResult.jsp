<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL RESULT</title>
</head>
<body>
	${param['x'] } + ${param['y'] } = ${param['x'] + param['y'] }
	<br> ${param['x'] } - ${param['y'] } = ${param['x'] - param['y'] }
	<br> ${param.x } * ${param.y } = ${param.x * param.y }
	<br> ${param.x } div ${param.y } = ${param.x div param.y }
	<br>
</body>
</html>

<!-- 
get, page - getParameter() 라는 함수를 써서 데이터를 가지고 옴
el에서는 param이라는 내장객체를 가진다
  -->