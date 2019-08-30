<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	int pg = Integer.parseInt(request.getParameter("pg"));
	int endNum = pg * 5;
	int startNum = endNum - 4;
	List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
	int totArticle = boardDAO.getTotalArticle();
	int totPage = (totArticle + 4) / 5;

	SimpleDateFormat newFormat = new SimpleDateFormat("YYYY.MM.dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style type="text/css">
#subjectA:link { color: black; text-decoration: none; }
#subjectA:hover { color: green; text-decoration: underline; }
#subjectA:active { color: black; text-decoration: none; }
#subjectA{ cursor: pointer; }
</style>
</head>
<body>
	<img src="../image/ni2.png" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
			<h3>목록</h3>
	<%if (list != null) {%>
	<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="2" width="600px">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%for (BoardDTO boardDTO : list) {%>
		<tr>
			<td align="center"><%=boardDTO.getSeq()%></td>
			<td><a id="subjectA" onclick="isLogin('<%=(String)session.getAttribute("memId")%>','<%=boardDTO.getSeq()%>')"><%=boardDTO.getSubject()%></a></td>
			<td align="center"><%=boardDTO.getId()%></td>
			<td align="center"><%=newFormat.format(boardDTO.getLogtime())%></td>
			<td align="center"><%=boardDTO.getHit()%></td>
		</tr>
		<%}%>
	</table>
	<%}%>
	
	<%for (int i = 1; i <= totPage; i++) {%>
	<a href="../board/boardList.jsp?pg=<%=i%>">[<%=i%>]</a>
	<%}%>
	<br><br>
</body>
<script src="/memberJSP/js/board.js"></script>
</html>