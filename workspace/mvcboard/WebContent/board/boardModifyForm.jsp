<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<form name="boardModifyForm" method="post" action="/mvcboard/board/boardModify.do">
	<input type="hidden" name="seq" value="${seq }">
	<input type="hidden" name="pg" value="${pg }">
		<h3>글수정</h3>
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td>제목</td>
				<td colspan="5" style="font-weight: bold; font-size: 1.4em"><input
					type="text" name="subject" id="subject" value="${boardDTO.subject }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5"><pre
						style="overflow: auto; white-space: pre-line; word-break: break-all; width: 400px; height: 200px;">
					<textarea name="content" id="content"
							style="width: 390px; height: 190px; resize: none">${boardDTO.content }</textarea>
				</pre></td>
			</tr>
			<tr>
				<td colspan="6" align="center"><input type="button" value="글수정"
					onclick="checkBoard()"> <input type="reset"
					value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
<script src="../js/board.js" type="text/javascript"></script>
</html>