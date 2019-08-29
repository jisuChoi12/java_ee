<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/> <!--DataDTO dataDTO = DataDTO.getInstance(); -->
<jsp:setProperty property="x" name="dataDTO"/> <!-- dataDTO.setX(request.getParameter("x")) -->
<jsp:setProperty property="y" name="dataDTO"/> <!-- dataDTO.setY(request.getParameter("y")) -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>곱구하기</title>
</head>
<body>
	<jsp:getProperty property="x" name="dataDTO"/> *
	<jsp:getProperty property="y" name="dataDTO"/> =
	<%=dataDTO.getX()*dataDTO.getY()%>
</body>
</html>