<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/board.css">
<c:if test="${list!=null }">
	<div>
		<select name="gumsek">
			<option value="작성자">작성자</option>
			<option value="제목">제목</option>
		</select>
		<input type="text" placeholder="검색어를 입력하세요">
		<input type="button" value="검색"><br><br>
	</div>
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
				<td width="200"><a href="javascript:void(0)" id="subjectA"
					onclick="isLogin('${boardDTO.seq}','${pg }')">${boardDTO.subject }</a></td>
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
function isLogin(seq, pg){
	 if("${memId}"==""){
		alert("로그인 먼저");
	} else { 
		location.href="/miniproject/board/boardView.do?seq="+seq+"&pg="+pg;
	} 
} 
</script>