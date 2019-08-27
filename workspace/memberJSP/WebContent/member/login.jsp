<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberJSP.bean.MemberDTO"%>
<%@ page import="memberJSP.dao.MemberDAO"%>

<%
	//데이터
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//MemberDTO memberDTO = new MemberDTO();
	//memberDTO.setId(id);
	//memberDTO.setPwd(pwd);

	// DB
	String name = MemberDAO.getInstance().login(id,pwd);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%if (name != null) { %>
		<%=name %>님 로그인
		<br><br>
		<input type="button" value="로그아웃" onclick="">
		<input type="button" value="회원정보수정" onclick=location.href="modifyForm.jsp?id=<%=id %>">
	<%} else { %>
		아이디 또는 비밀번호가 맞지 않습니다
	<%} %>
</body>
</html>
