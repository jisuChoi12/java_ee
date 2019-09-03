<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일</title>
</head>
<body>
	<form name="" method="post" enctype="multipart/form-data" action="fileUpload.jsp">
		<!-- <img src="../image/ni13.gif" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;"> -->
		<h2>파일</h2>
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject"
					style="width: 300px"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content"
						style="width: 300px; height: 200px; resize: none"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="upload1" size="50"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="upload2" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="파일업로드""> <input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>