<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

${sessionScope.memName }님 로그인
<br>
<br>
<input type="button" value="로그아웃"
	onclick="location.href='/miniproject/member/logout.do'" style="width: 100%; border: 0; outline: 0;">
<input type="submit" value="회원정보수정 "
	onclick="location.href='/miniproject/member/modifyForm.do'" style="width: 100%; border: 0; outline: 0;">

