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
	MemberDTO memberDTO = MemberDAO.getInstance().login(id, pwd);
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
			if (memberDTO != null) {
				//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8"));
				//request.getSession().setAttribute("name", name);
				//response.sendRedirect("loginOk.jsp");
				
				// 쿠키
				/*
				Cookie cookie1 = new Cookie("memName",name); // 생성
				cookie1.setMaxAge(30*60); // 초 단위
				response.addCookie(cookie1); // 클라이언트에 저장
				
				Cookie cookie2 = new Cookie("memId", id); // 생성
				cookie2.setMaxAge(30*60); // 초 단위
				response.addCookie(cookie2); // 클라이언트에 저장
				*/
				
				// 세션
				//HttpSession session = request.getSession(); // 세션 생성 -> 이미 있음
				session.setAttribute("memName", memberDTO.getName());
				session.setAttribute("memId", id);		
				session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
				//session.setAttribute("memDTP",memberDTO); 한번에 다 담기
				
				response.sendRedirect("loginOk.jsp"); // 모든 정보가 쿠키 안에 있으니까 그냥 가면 된다
				
			} else {
				response.sendRedirect("loginFail.jsp");
			}
		%>
	</form>
</body>
</html>
