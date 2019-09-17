<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>
	<img src="../image/pandaJr.png" width="70" height="70"
		onclick="location.href='/miniproject/main/index.do'"
		style="cursor: pointer"><br>MVC를 이용한 미니프로젝트
</h3>
<br>
<font size="3" style="font-weight: bold;"> <c:if
		test="${sessionScope.memId != null }">
		<!-- 로그인 상태 -->
		<a href="/miniproject/board/boardWriteForm.do">글쓰기</a>&emsp;
		<c:if test="${sessionScope.memId == 'admin' }">
			<a href="/miniproject/imageboard/imageBoardWriteForm.do">이미지등록</a>
			<!-- 로그인 아이디가 admin 비밀번호는 111 -->
			&emsp;
		</c:if>
		<a href="/miniproject/imageboard/imageboardList.do?pg=1">이미지목록</a>&emsp;
	</c:if> <a href="/miniproject/board/boardList.do?pg=1">목록</a>
</font>

