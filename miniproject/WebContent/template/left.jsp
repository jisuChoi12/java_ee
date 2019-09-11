<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.memId == null }">
	<!-- 로그아웃 상태 -->
	<a href="/miniproject/member/writeForm.do">회원가입</a>
	<br>
	<a href="/miniproject/member/loginForm.do">로그인</a>
	<br>
</c:if>
<c:if test="${sessionScope.memId != null }">
	<!-- 로그인 상태 -->
	<a href="/miniproject/member/logout.do">로그아웃</a>
	<br>
	<a href="/miniproject/member/modifyForm.do">회원정보수정</a>
	<br>
	<a href="/miniproject/board/boardWriteForm.do">글쓰기</a>
	<br>
</c:if>
<a href="/miniproject/board/boardList.do?pg=1">목록</a>
<br>
