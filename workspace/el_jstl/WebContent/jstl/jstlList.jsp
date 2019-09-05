<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="rs" dataSource="jdbc/oracle">
	select name as 이름,id as 아이디,pwd as 비밀번호 from usertable
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlList</title>
</head>
<body>
	<h2>목록</h2>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<!-- 필드명 -->
			<c:forEach var="colName" items="${rs.columnNames }">
				<th>${colName }</th>
			</c:forEach>
			<th>비고</th>
		</tr>
		<!-- 필드 -->
		<c:forEach var="row" items="${rs.rowsByIndex }"> <!-- 행 rowsByIndex는 rs에 있는 함수명(앞에 get을 빼고 부른거임) -->
			<tr>
				<c:forEach var="col" items="${row }"> <!-- 열 -->
					<td width="100" align="center">${col }</td>
				</c:forEach>
				<td width="150" align="center">
					<input type="button" value="수정" onclick="location.href='jstlModifyForm.jsp?id=${row[1]}'">
					<input type="button" value="삭제" onclick="del('${row[1]}')">
				</td> 
			</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
function del(id){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="jstlDelete.jsp?id="+id;
	}
}
</script>
</html>