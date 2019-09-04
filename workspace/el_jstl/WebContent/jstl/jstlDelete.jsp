<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<sql:update var="su" dataSource="jdbc/oracle"> 
	delete from usertable where id='${param.id }' 
</sql:update> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlDelete</title>
</head>
<body>
</body>
<script type="text/javascript">
window.onload=function(){
	alert("삭제 완료");
	location.href="jstlList.jsp";
}
</script>
</html>