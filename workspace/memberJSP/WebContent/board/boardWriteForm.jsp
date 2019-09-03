<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<form name="boardWriteForm" method="post" action="boardWrite.jsp">
		<img src="../image/ni13.gif" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
		<h2>글쓰기</h2>
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject"
					style="width: 300px" placeholder="제목 입력"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content"
						style="width: 300px; height: 200px; resize: none"
						placeholder="내용 입력"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="글쓰기"
					onclick="checkBoard()"> <input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
<script src="/memberJSP/js/board.js" type="text/javascript">
	
</script>
</html>