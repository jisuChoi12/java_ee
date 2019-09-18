<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/board.css">
<c:if test="${list!=null }">
	<div>
		<select id="searchOption">
			<option value="id">작성자</option>
			<option value="subject">제목</option>
		</select> <input type="text" id="keyword" placeholder="검색어를 입력하세요"> <input
			type="button" value="검색" onclick="checkSearch()"><br>
		<br>
	</div>
	<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="2" width="800px">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="boardDTO" items="${list }">
			<tr>
				<c:if test="${boardDTO.pseq != 0 }">
					<td></td>
				</c:if>
				<c:if test="${boardDTO.pseq == 0 }">
					<td align="center">${boardDTO.seq }</td>
				</c:if>
				<td width="300"><a href="javascript:void(0)" id="subjectA" onclick="isLogin('${boardDTO.seq}','${pg }')">
					<c:if test="${boardDTO.pseq != 0 }">
						<c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
							&emsp;
						</c:forEach>
						<img src="../image/reply.gif">
					</c:if>${boardDTO.subject }</a>
				</td>
				<td align="center">${boardDTO.id }</td>
				<td align="center">${boardDTO.logtime }</td>
				<td align="center">${boardDTO.hit }</td>

			</tr>
		</c:forEach>
	</table>
	<br>
	<div
		style="display: inline-block; float: left; text-align: center; width: 100%;">${boardPaging.pagingHTML }
	</div>


</c:if>
<script type="text/javascript">
	function isLogin(seq, pg) {
		if ("${memId}" == "") {
			alert("로그인 먼저");
		} else {
			location.href = "/miniproject/board/boardView.do?seq=" + seq
					+ "&pg=" + pg;
		}
	}
	function checkSearch() {
		if (document.getElementById("keyword").value == "") {
			alert("검색어를 입력하세요");
		} else {
			location.href = "/miniproject/board/boardSearch.do?searchOption="
					+ document.getElementById("searchOption").value
					+ "&keyword=" + document.getElementById("keyword").value
					+ "&pg=1";
		}
	}
</script>