<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC를 이용한 미니프로젝트</title>
<link rel="stylesheet" href="../css/mini.css">
</head>
<body>
	<%-- <header><jsp:include page="../template/top.jsp"/></header><br> --%>
	<div display="inline"><jsp:include page="../template/top.jsp" />
	</div>
	<br>
	<table border="1" width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<td valign="top" width="20.1%" height="500"><jsp:include page="../template/left.jsp" /></td>
			<td align="center"><jsp:include page="${display }" /></td>
		</tr>
	</table>
	<%-- <div id="wrapper">
	<header><jsp:include page="../template/top.jsp"/></header>
	<nav><jsp:include page="../template/left.jsp"/></nav>
	<section>
		<jsp:include page="../template/body.jsp"/>
		<article></article>
	</section>
	</div> --%>
	<footer><jsp:include page="../template/bottom.jsp" /></footer>
</body>
</html>