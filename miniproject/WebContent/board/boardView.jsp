<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${boardDTO!=null }">
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="5">
		<tr>
			<td align="left" colspan="6"
				style="font-weight: bold; font-size: 1.4em">${boardDTO.subject }</td>
		</tr>
		<tr>
			<td colspan="2" align="left">글번호: ${boardDTO.seq }</td>
			<td colspan="2" align="center">작성자: ${boardDTO.id }</td>
			<td colspan="2" align="right">조회수: ${boardDTO.hit }</td>
		</tr>
		<tr>
			<td colspan="6" align="left"><pre
					style="overflow: auto; white-space: pre-line; word-break: break-all; width: 400px; height: 200px">${boardDTO.content }</pre>
			</td>
		</tr>
		<tr>
			<td colspan="6"><input type="button" value="목록"
				onclick="location.href='/miniproject/board/boardList.do?pg=${pg}'">
				<c:if test="${sessionScope.memId == boardDTO.id }">
					<input type="button" value="글수정"
						onclick="location.href='/miniproject/board/boardModifyForm.do?seq=${boardDTO.seq}&pg=${pg}'">
					<input type="button" value="글삭제"
						onclick="location.href='/miniproject/board/boardDelete.do?seq=${boardDTO.seq}'">
				</c:if>
			</td>
		</tr>
	</table>
</c:if>
