<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	// 쿠키
	/* 	Cookie[] cookies = request.getCookies(); // 모든 쿠키 얻어오기 (특정 쿠키만 가져오기 안됨)
		Cookie viewCookie = null; // 비교를 위한 새로운 쿠키 초기값은 null
		if (cookies != null && cookies.length > 0) { // 쿠키가 있을 경우
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("memHit")) {
					viewCookie = cookies[i]; // viewCookie에 값 주기
				}
			}
		}
	
		if (viewCookie == null) { // 처음 방문
			Cookie newCookie = new Cookie("memHit", "[" + seq + "]"); // 새로운 쿠키 생성
			response.addCookie(newCookie); // 쿠키 담기	
			boardDAO.boardHit(seq); // 조회수 증가 
		} */

	/* // 강사님 방법1 조회수 - 쿠키 시간을 30분 사용
	boolean sw = false;
	String memId = (String) session.getAttribute("memId");
	Cookie[] ar = request.getCookies();
	if (ar != null) {
		for (int i = 0; i < ar.length; i++) {
			if (ar[i].getName().equals(memId + seq)) { 
				sw = true;
			}
		}
		if (!sw) { // 처음 방문
			boardDAO.boardHit(seq);
			Cookie cookie = new Cookie(memId + seq, seq + "");
			System.out.println("쿠키명:" + (memId+seq) + " 값:" + seq + "");
			cookie.setMaxAge(30*60);
			response.addCookie(cookie);
		}
	} */

	// 강사님 방법2 조회수 - 새로고침 방지
	Cookie[] ar = request.getCookies();
	if (ar != null) {
		for (int i = 0; i < ar.length; i++) {
			if (ar[i].getName().equals("memHit")) {
				boardDAO.boardHit(seq); // 조회수 증가
				ar[i].setMaxAge(0); // 쿠키 삭제
				response.addCookie(ar[i]); // 클라이언트에 저장
			}
		}
	}

	BoardDTO boardDTO = boardDAO.getBoard(seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글</title>
</head>
<body>
	<img src="../image/ni13.gif" width="80" height="80"
		onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	<%
		if (boardDTO != null) {
	%>
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="5">
		<tr>
			<td colspan="6" style="font-weight: bold; font-size: 1.4em"><%=boardDTO.getSubject()%></td>
		</tr>
		<tr>
			<td>글번호: <%=boardDTO.getSeq()%>
			</td>
			<td align="center">작성자: <%=boardDTO.getId()%>
			</td>
			<td align="right">조회수: <%=boardDTO.getHit()%>
			</td>
		</tr>
		<tr>
			<td colspan="6"><pre
					style="overflow: auto; white-space: pre-line; word-break: break-all; width: 400px; height: 200px"><%=boardDTO.getContent()%></pre></td>
		</tr>
	</table>
	<br>
	<input type="button" value="목록"
		onclick="location.href='boardList.jsp?pg=<%=pg%>'">
	<%
		if (boardDTO.getId().equals(session.getAttribute("memId"))) {
	%>
	<input type="button" value="글수정"
		onclick="location.href='boardModifyForm.jsp?seq=<%=seq%>&pg=<%=pg%>'">
	<input type="button" value="글삭제" onclick="">
	<br>
	<%
		}
	%>
	<%
		}
	%>
</body>
</html>