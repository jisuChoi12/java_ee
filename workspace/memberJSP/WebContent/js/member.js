function checkWrite() {
	if (document.getElementById("irum").value == "") {
		alert("이름을 입력하세요");
		document.writeForm.name.focus();
	} else if (document.writeForm.id.value == "") {
		alert("아이디를 입력하세요");
		document.writeForm.id.focus();
	} else if (document.writeForm.pwd.value == "") {
		document.writeForm.pwd.focus();
	} else if (document.writeForm.repwd.value != document.writeForm.pwd.value) {
		alert("패스워드가 일치하지 않습니다.");
		document.writeForm.repwd.focus();
	} else if (document.writeForm.check.value != document.writeForm.id.value) {
		alert("중복체크 하세요");
	} else {
		document.writeForm.submit();
	}
}

function checkLogin() {
	if (document.loginForm.id.value == "") {
		alert("아이디를 입력하세요");
		document.loginForm.id.focus();
	} else if (document.loginForm.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		document.loginForm.pwd.focus();
	} else {
		document.loginForm.submit();
	}
}

function checkId() {
	var sId = document.writeForm.id.value;
	if (sId == "") {
		alert("먼저 아이디를 입력하세요");
	} else {
		window.open("http://localhost:8080/memberJSP/member/checkId.jsp?id="
				+ sId, "",
				"width=400 height=150 left=500 top=150 locations=yes");
	}
}

function checkIdClose(id) {
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}

function checkPostClose(zipcode, address){
	//opener.writeForm.zipcode.value = zipcode;
	//opener.writeForm.addr1.value = address;

	opener.document.getElementById("daum_zipcode").value = zipcode;
	opener.document.getElementById("daum_addr1").value = address;
	window.close();
	opener.document.getElementById("daum_addr2").focus();
}

function checkPost() {
	window.open("checkPost.jsp","","width=700 height=500 left=800 top=150 locations=yes scrollbar=yes");
}

function checkModify(){
	if (document.modifyForm.name.value == "") {
		alert("이름 입력하세요");
		document.modifyForm.name.focus();
	} else if (document.modifyForm.pwd.value == "") {
		alert("패스워드름 입력하세요");
		document.modifyForm.pwd.focus();
	} else if (document.modifyForm.repwd.value != document.modifyForm.pwd.value) {
		alert("패스워드가 일치하지 않습니다.");
		document.modifyForm.repwd.focus();
	} else {
		document.modifyForm.submit();
	}
}

