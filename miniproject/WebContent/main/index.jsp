<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
<link rel="stylesheet" href="../css/mini.css">
</head>
<body>
	<table border="1" width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<td colspan="2" align="center">
				<jsp:include page="../template/top.jsp"/>
			</td>
		</tr>
		<tr>
			<td width="20%" height="300"><jsp:include page="../template/left.jsp"/></td>
			<td><jsp:include page="../template/body.jsp"/></td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="../template/bottom.jsp"/></td>
		</tr>
	</table>
	<br><br>
	<div id="wrapper">
	<header><jsp:include page="../template/top.jsp"/></header>
	<nav><jsp:include page="../template/left.jsp"/></nav>
	<section>
		<jsp:include page="../template/body.jsp"/>
		<article></article>
	</section>
	<footer><jsp:include page="../template/bottom.jsp"/></footer>
	</div>
</body>
</html>