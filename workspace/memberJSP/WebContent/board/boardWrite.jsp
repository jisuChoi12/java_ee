<%@page import="memberJSP.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>

<!-- useBean쓰면 싱글톤으로 생성. getInstance()가 필요 없어진다 -->
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" scope="session"></jsp:useBean>

<%
	// 데이터
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	//String email = MemberDAO.getInstance().getEmail(id);

	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setId(id);
	boardDTO.setName(name);
	boardDTO.setEmail(email);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);

	boardDAO.write(boardDTO);
%>

<%-- <jsp:useBean id="boardDTO" class="board.bean.BoardDTO" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="boardDTO" /> --%>

<%-- <% 
	// DB
	int cnt = BoardDAO.getInstance().insert(boardDTO);
%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 결과</title>
</head>
<body>
</body>
<script type="text/javascript">
	window.onload = function() {
		alert("글쓰기 성공");
	}
</script>
</html>