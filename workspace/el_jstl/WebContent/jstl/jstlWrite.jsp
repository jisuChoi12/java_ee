<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:requestEncoding value="UTF-8"/>
<!-- insert/update/delete 기능을 update가 한번에 가진다 -->
<sql:update var="su" dataSource="jdbc/oracle"> 
	insert into usertable values('${param.name }','${param.id }','${param.pwd }')
</sql:update> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlWrite</title>
</head>
<body>
<c:if test="${su==1 }">등록 성공</c:if>
<c:if test="${su!=1 }">등록 실패</c:if>
<br><br>
<input type="button" value="목록" onclick="location.href='jstlList.jsp'">
</body>
</html>

<!-- 
Connection Pool
Connection을 서버에 미리 만들어 놓은 것

Connection Pool은 Project당 만들어야 한다
 -->