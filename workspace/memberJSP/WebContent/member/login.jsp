<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberJSP.bean.MemberDTO"%>
<%@ page import="memberJSP.dao.MemberDAO"%>
<%@ page import="java.net.URLEncoder"%>

<%
	//데이터
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	// DB
	String name = MemberDAO.getInstance().login(id, pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form name="" method="post" action="modifyForm.jsp">
		<img src="../image/ni2.png" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;"><br>
		<%
			if (name != null) {
				response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8"));
				//request.getSession().setAttribute("name", name);
				//response.sendRedirect("loginOk.jsp");
			} else {
				response.sendRedirect("loginFail.jsp");
			}
		%>
	</form>
</body>
</html>
