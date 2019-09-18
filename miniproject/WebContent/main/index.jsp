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
	<header style="background-color: #39373b; height: 200px;"><jsp:include page="../template/top.jsp"/></header><br>
	<%-- <header>
	<div display="inline" style="background-color: aqua;"><jsp:include page="../template/top.jsp" />
	</div></header> --%>
	<br>
	<table border="0" width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<td valign="top" width="20.1%" height="500"><c:if test="${memId != null }"><img src="../image/jordy.png" style="width: 70px; height: 70px;"><br></c:if><jsp:include page="../template/left.jsp" /></td>
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
	<footer style="background-color: #39373b;"><jsp:include page="../template/bottom.jsp" /></footer>
</body>
</html>