<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = (String) session.getAttribute("memName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
</head>
<body>
<img src="../image/ni5.gif"><br>
	<h3>*** 메인화면 ***</h3>
	<%if (id == null) {%>
		<a href="../member/writeForm.jsp">회원가입</a><br>
		<a href="../member/loginForm.jsp">로그인</a><br>
	<%} else {%>
		<a href="../member/modifyForm.jsp">회원정보수정</a><br>
		<a href="../member/logout.jsp">로그아웃</a><br>
		<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
	<%}%>
	<a href="../board/boardList.jsp?pg=1">목록</a><br>
</body>
</html>