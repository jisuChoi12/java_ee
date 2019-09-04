<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL RESULT2</title>
</head>
<body>
	<h3>자바클래스의 메소드를 이용하여 계산</h3>
	${param['x'] } + ${param['y'] } = ${angel:sum(param['x'],param['y']) }
	<!-- 자바의 sum() 함수 호출, 해당 함수가 어디에 있는지 알려주기 위해 커스텀 태그-->
	<br> ${param['x'] } - ${param['y'] } =
	${angel:sub(param.x,param.y) }
	<br> ${param.x } * ${param.y } =
	${angel:mul(param['x'],param['y']) }
	<br>
</body>
</html>
