<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberJSP.bean.MemberDTO"%>
<%@ page import="memberJSP.dao.MemberDAO"%>

<%
	// 데이터
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberDTO" class="memberJSP.bean.MemberDTO"
	scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="memberDTO" />

<%
	// DB
	int cnt = MemberDAO.getInstance().insert(memberDTO);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!-- 회원가입 성공 /실패  -->
	<%
		if (cnt == 1) {
	%>
	회원가입을 축하합니다
	<br>
	<br>
	<input type="button" value="로그인" onclick=location.herf='loginForm.jsp'>
	<%
		} else {
	%>
	다시 작성해주세요
	<%
		}
	%>
</body>
</html>

<!-- 모델1기법 -->