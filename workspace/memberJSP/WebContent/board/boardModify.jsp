<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	String subject = (String)request.getParameter("subject");
	String content = (String)request.getParameter("content");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	int cnt = boardDAO.updateBoard(subject,content,seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
</body>
<script type="text/javascript">
	window.onload = function() {
		alert("글 수정 완료");
		location.href="../board/boardList.jsp?pg=<%=pg%>"; 
	} 
</script>
</html>