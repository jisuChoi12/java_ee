<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL RESULT</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<ul>
		<li>이름 : ${param.name }</li>
		<li>나이 : ${param.age }살 
			<c:if test="${param.age>=20 }">성인</c:if> 
			<c:if test="${param.age<20 }">청소년</c:if>
		</li>
		<li>색깔 : 
			<c:choose>
				<c:when test="${param.color=='red' }">빨강</c:when>
				<c:when test="${param.color=='green' }">초록</c:when>
				<c:when test="${param.color=='blue' }">파랑</c:when>
				<c:when test="${param.color=='magenta' }">보라</c:when>
				<c:otherwise>하늘</c:otherwise>
			</c:choose>
		</li>
		<li>취미 : 
				<!--  
				${paramValues['hobby'][0] }
				${paramValues['hobby'][1] }
				${paramValues['hobby'][2] }
				${paramValues['hobby'][3] }
				${paramValues['hobby'][4] }
				-->
			<c:forEach var="i" begin="0" end="4" step="1">
				${paramValues['hobby'][i] }
			</c:forEach>
			<!--
			<c:forEach var="i" items="${paramValues.hobby }">
				${i }
			</c:forEach>
			-->
		</li>
	</ul>
</body>
</html>