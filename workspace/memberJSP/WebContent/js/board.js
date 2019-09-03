 function checkBoard() {
	if (document.getElementById("subject").value == "") {
		alert("제목을 입력하세요");
		document.boardWriteForm.subject.focus();
	} else if (document.getElementById("content").value == "") {
		alert("내용을 입력하세요");
		document.boardWriteForm.content.focus();
	} else {
		document.forms[0].submit();
	}
}
