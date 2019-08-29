<%@page import="exam.bean.DataDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- useBean 자체적으로 싱글톤 (default생성자만 부를 수 있음) 쓰지말기!! -->
<!-- score=유효범위 : "page"(현재파일) "request"(내장객체) "session"(서버에 잡혀있는 세션값) "application"(전체프로젝트)-->
<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/> <!--DataDTO dataDTO = DataDTO.getInstance(); -->
<jsp:setProperty property="x" name="dataDTO"/> <!-- dataDTO.setX(request.getParameter("x")) -->
<jsp:setProperty property="y" name="dataDTO"/> <!-- dataDTO.setY(request.getParameter("y")) -->

<html>
<head>
<meta charset="UTF-8">
<title>합구하기</title>
</head>
<body>
<form name="sum" method="post" action="mul.jsp">
	<jsp:getProperty property="x" name="dataDTO"/> +
	<jsp:getProperty property="y" name="dataDTO"/> =
	<%=dataDTO.getX()+dataDTO.getY()%>
	<br><br>
	<input type="submit" value="곱구하기">
	<!-- <input type="button" value="곱구하기" onclick="location.href='mul.jsp'"> -->
</form>
</body>
<script>
</script>
</html>