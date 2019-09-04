<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable where id='${param.id }'
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlModifyForm</title>
</head>
<body>
<form name="" method="post" action="jstlModify.jsp">
	<h2>수정</h2>
	<table border=1 cellspacing="0" cellpadding="5">
		<c:forEach var="row" items="${rs.rowsByIndex }">
			<tr>
				<th width=120>이름</th>
				<td><input type="text" id="name" name="name" size=20
					value="${row[0]}"></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size=25 value="${row[1] }"
					readonly="readonly"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" size=30
					value="${row[2] }"></td>
			</tr>
			<tr>
				<td colspan=2 align="center">
					<input type="submit" value="수정">
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>