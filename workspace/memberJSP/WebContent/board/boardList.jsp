<%@page import="board.bean.BoardPaging"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" scope="session"></jsp:useBean>
<%-- <jsp:useBean id="boardPaging" class="board.bean.BoardPaging" scope="sesison"></jsp:useBean> --%>

<%
	request.setCharacterEncoding("UTF-8");
	String memId = "";
	if ((String) session.getAttribute("memId") != null) {
		memId = (String) session.getAttribute("memId");
	}
	int pg = Integer.parseInt(request.getParameter("pg"));
	int endNum = pg * 5;
	int startNum = endNum - 4;
	List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
	int totArticle = boardDAO.getTotalArticle();
	int totPage = (totArticle + 4) / 5;

	SimpleDateFormat newFormat = new SimpleDateFormat("YYYY.MM.dd");

	//페이징 처리
	BoardPaging boardPaging = new BoardPaging(); // 클래스 생성
	int totalA = boardDAO.getTotalArticle(); // 총글수를 board테이블에서 가져오기
	boardPaging.setCurrentPage(pg); // 현재 페이지는 pg
	boardPaging.setPageBlock(3); // 1블록당 페이지 3개씩
	boardPaging.setPageSize(5); // 1페이지당 글 5개씩
	boardPaging.setTotalA(totalA); // 총글수
	boardPaging.makePagingHTML(); // 페이징html

	// 쿠키 boardView.jsp
	/* Cookie[] cookies = request.getCookies(); // 쿠기 불러오기
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("memHit")) {
				cookies[i].setMaxAge(0); // 쿠키삭제
				response.addCookie(cookies[i]); // 클라이언트에 저장
			}
		}
	} */
	
	// 강사님 방법2 조회수 - 새로고침 방지
	if(session.getAttribute("memId")!=null){
		Cookie cookie = new Cookie("memHit","0");
		cookie.setMaxAge(30*60); 
		response.addCookie(cookie); // 클라이언트에 저장
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body>
	<h3>목록</h3>
	<%
		if (list != null) {
	%>
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="2" width="600px">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			for (BoardDTO boardDTO : list) {
		%>
		<tr>
			<td align="center"><%=boardDTO.getSeq()%></td>
			<td width="200"><a href="javascript:void(0)" id="subjectA"
				onclick="isLogin('<%=memId%>',<%=boardDTO.getSeq()%>,<%=pg%>)"><%=boardDTO.getSubject()%></a></td>
			<td align="center"><%=boardDTO.getId()%></td>
			<td align="center"><%=newFormat.format(boardDTO.getLogtime())%></td>
			<td align="center"><%=boardDTO.getHit()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<div style="display: inline-block; float: left;">
		<img src="../image/ni13.gif" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	</div>
	<div
		style="display: inline-block; float: left; text-align: center; width: 460px;">
		<%=boardPaging.getPagingHTML()%>
		<%
			}
		%>
	</div>
	<br>
	<br>
</body>
<script type="text/javascript">
function isLogin(id, seq, pg){
	if(id==""){
		alert("로그인 먼저");
	} else {
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
}
</script>
</html>