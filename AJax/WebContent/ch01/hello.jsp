<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
	String name = request.getParameter("name");
%>
안녕하세요 <%=name%> 회원님 :D --%>
<fmt:requestEncoding value="UTF-8"/>
안녕하세요 ${param.name } 회원님 :D
