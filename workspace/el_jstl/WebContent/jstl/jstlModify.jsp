<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:requestEncoding value="UTF-8"/>
<sql:update var="su" dataSource="jdbc/oracle">
	update usertable set name='${param.name }', pwd='${param.pwd }' where id='${param.id }'
</sql:update>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlModify</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("수정완료");
	location.href="jstlList.jsp"
}
</script>
</html>