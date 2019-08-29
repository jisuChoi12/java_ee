<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setAttribute("apple", "사과");

	// 페이지 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); // 상대번지
	
	// 제어권 넘기기 : 하나의 request와 response를 공유하기 때문에 제어권을 넘겨줘야 한다
	dispatcher.forward(request, response);
%>

<%-- <jsp:forward page="forwardResult.jsp"/> --%> <!-- 잘 안쓴다 -->
