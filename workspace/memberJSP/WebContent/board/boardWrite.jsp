<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>

<% 
	// 데이터
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="boardDTO" class="board.bean.BoardDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="boardDTO" />

<% 
	// DB
	int cnt = BoardDAO.getInstance().insert(boardDTO);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 결과</title>
</head>
<body>
	<%if(cnt !=0) {%>
	글쓰기 성공
	<% } else { %>
	글쓰기 실패
	<% } %>
</body>
</html>