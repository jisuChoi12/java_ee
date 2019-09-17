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