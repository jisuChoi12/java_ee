<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	BoardDTO boardDTO = boardDAO.getBoard(seq);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
	<form name="boardModifyForm" method="post" action="boardModify.jsp?seq=<%=seq%>&pg=<%=pg%>">
		<h3>글 수정</h3>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td>제목</td>
				<td colspan="5" style="font-weight: bold; font-size: 1.4em"><input
					type="text" name="subject" id="subject" value="<%=boardDTO.getSubject()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5"><pre
						style="overflow: auto; white-space: pre-line; word-break: break-all; width: 400px; height: 200px;">
					<textarea name="content" id="content"
							style="width: 390px; height: 190px; resize: none"><%=boardDTO.getContent()%></textarea>
				</pre></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="button" value="글수정"
					onclick="checkBoardWrite()"> <input type="reset"
					value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
<script src="/memberJSP/js/board.js" type="text/javascript"></script>
</html>