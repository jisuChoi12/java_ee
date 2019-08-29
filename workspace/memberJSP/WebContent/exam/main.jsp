<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String name = "죠르디";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<body>

	<h3>** include directive **</h3>
	<%@ include file="today.jsp"%> <!-- 파일들을 합친다음 컴파일 (변수명까지 신경써야 함) -->

	<h3>** include JSP tag **</h3>
	<jsp:include page="image.jsp" /> <!-- 각각 컴파일 하고 결과만 합한다 -->
	
	<br>
	main.jsp name = <%=name%>
	
	<h3>** 3초 뒤에 페이지 이동 **</h3>
	<%response.setHeader("Refresh","3;url=input.jsp");%>

</body>
</html>