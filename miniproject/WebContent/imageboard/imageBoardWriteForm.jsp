<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="imageBoardWriteForm" method="post"
	action="/miniproject/imageboard/imageBoardWrite.do">
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="imageId" id="imageId"
				style="width: 300px" value="img_"></td>
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
			<td colspan="2">
				<input type="file" value="찾아보기" name="image1" style="width: 100%">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="이미지 등록"
				onclick="checkImageBoard()"> <input type="reset" value="다시작성"></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
function checkImageBoard(){
	if(document.imageBoardWriteForm.imageId.value == "img_"){
		alert("상품코드를 입력하세요");
		document.imageBoardWriteForm.imageId.focus();
	} else if(document.imageBoardWriteForm.imageName.value == "") {
		alert("상품명을 입력하세요");
		document.imageBoardWriteForm.imageName.focus();
	} else if(document.imageBoardWriteForm.imagePrice.value == "") {
		alert("단가를 입력하세요");
		document.imageBoardWriteForm.imagePrice.focus();
	} else if(document.imageBoardWriteForm.imageQty.value == "") {
		alert("갯수를 입력하세요");
		document.imageBoardWriteForm.imageQty.focus();
	} else if(document.imageBoardWriteForm.imageContent.value == "") {
		alert("내용을 입력하세요");
		document.imageBoardWriteForm.imageContent.focus();
	} else if(document.imageBoardWriteForm.image1.value == "") {
		alert("파일을 선택하세요");
		document.imageBoardWriteForm.image1.focus();
	} else {
		document.imageBoardWriteForm.submit();
	}
}
</script>