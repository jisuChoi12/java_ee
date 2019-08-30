<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"></jsp:useBean>
   
<% 
	request.setCharacterEncoding("UTF-8");
	String curSeq = request.getParameter("seq"); 
	boardDAO.updateHit(curSeq);
	BoardDTO boardDTO = boardDAO.getBoard(curSeq);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글</title>
</head>
<body>
<img src="../image/ni2.png" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
<table border="1" frame="hsides" rules="rows">
	<tr>
		<td colspan="6" style="font-weight: bold; font-size: 1.2em"><%=boardDTO.getSubject()%></td>
	</tr>
	<tr>
		<td>글번호: <%=boardDTO.getSeq()%> </td> 
		<td>작성자: <%=boardDTO.getId()%> </td>
		<td>조회수: <%=boardDTO.getHit()%> </td>
	</tr>
	<tr>
		<td colspan="6"><pre style="overflow: auto; white-space: pre-line; word-break: break-all; width: 400px; height: 200px"><%=boardDTO.getContent()%></pre></td>
	</tr>
</table>
<br>
<%if(boardDTO.getId().equals(session.getAttribute("memId"))) {%>
<input type="button" value="글수정">
<input type="button" value="글삭제"><br>
<%} %>
</body>
</html>