function checkBoardWrite(){
	if(document.boardWriteForm.subject.value==""){
		alert("제목을 입력하세요");
		document.boardWriteForm.subject.focus();
	} else if(document.boardWriteForm.content.value==""){
		alert("내용을 입력하세요");
		document.boardWriteForm.content.focus();
	} else {
		document.boardWriteForm.submit();
	}
}

function isLogin(id, seq){
	if(id=='null'){
		alert("로그인 먼저");
	} else {
		location.href="boardView.jsp?seq="+seq;
	}
}




