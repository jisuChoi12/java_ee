<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
	request.setCharacterEncoding("UTF-8");
	String memId = "";
	if ((String) session.getAttribute("memId") != null) {
		memId = (String) session.getAttribute("memId");
	}

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
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body>
	<h3>목록</h3>
	<c:if test="${list!=null }">
		<table border="1" frame="hsides" rules="rows" cellspacing="0"
			cellpadding="2" width="600px">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="boardDTO" items="${list }">

				<tr>
					<td align="center">${boardDTO.seq }</td>
					<td width="200"><a href="javascript:void(0)" id="subjectA" onclick="isLogin('${boardDTO.seq}','${pg }')">${boardDTO.subject }</a></td>
					<td align="center">${boardDTO.id }</td>
					<td align="center">${boardDTO.logtime }</td>
					<td align="center">${boardDTO.hit }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<div style="display: inline-block; float: left; text-align: center; width: 600px;">${boardPaging.pagingHTML }</div>
	</c:if>
	<br>
	<br>
</body>
<script type="text/javascript">
/* function isLogin(id, seq, pg){
	if(id==""){
		alert("로그인 먼저");
	} else {
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
} */
function isLogin(seq, pg){
	/* if("${memId}"==""){
		alert("로그인 먼저");
	} else { */
		location.href="/mvcboard/board/boardView.do?seq="+seq+"&pg="+pg;
/* 		location.href="boardView.jsp?seq="+seq+"&pg="+pg; */
	/* } */
} 
</script>
</html>