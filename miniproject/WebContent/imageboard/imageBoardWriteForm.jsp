<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form name="imageBoardWriteForm" method="post"
	enctype="multipart/form-data"
	action="/miniproject/imageboard/imageBoardWrite.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="imageId" id="imageId"
				style="width: 300px" placeholder="상품코드 입력"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="imageName" id="imageName"
				style="width: 300px" placeholder="상품명 입력"></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="text" name="imagePrice" id="imagePrice"
				style="width: 300px" placeholder="단가 입력"></td>
		</tr>
		<tr>
			<th>갯수</th>
			<td><input type="text" name="imageQty" id="imageQty"
				style="width: 300px" placeholder="갯수 입력"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="imageContent" id="imageContent"
					style="width: 300px; height: 200px; resize: none"
					placeholder="내용 입력"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" value="찾아보기" name="image1"
				style="width: 100%"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				value="이미지 등록" onclick="checkImageBoard()"> <input
				type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
<script src="../js/imageboard.js" type="text/javascript">
</script>