<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마리몬드를 따라해보자</title>
<link rel="stylesheet" href="../css/index.css">
<link rel="shortcut icon" href="https://marymond.kr//data/icon/favicon/favicon1552013679.ico" />
</head>
<body>
	<header><jsp:include page="../template/top.jsp"/></header>
	<jsp:include page="../template/slide.jsp"></jsp:include>
	<jsp:include page="${display }"></jsp:include>
</body>
</html>