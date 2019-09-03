<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" scope="session"></jsp:useBean>

<%
	// 데이터
	request.setCharacterEncoding("UTF-8");
	String subject = (String)request.getParameter("subject");
	String content = (String)request.getParameter("content");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	// DB
	/* int cnt = boardDAO.updateBoard(subject,content,seq); 이것도 되지만 이제는 map을 써보자! */
	
	Map<String,String> map = new HashMap<String,String>(); 
	map.put("seq", seq+"");
	map.put("subject",subject);
	map.put("content",content);
	boardDAO.boardModify(map);
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

<!-- 
Collection
: 객체를 모아주는 것

1. Collection coll = new ArrayList(); - 순서O(들어가는 순서대로 빠져나온다), 중복O
2. Set set = new HashSet(); - 순서X, 중복X 
3. Map<Key, Value>
	Map<"name","홍길동">
-->
