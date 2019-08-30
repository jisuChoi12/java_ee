<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//String name = request.getParameter("name");
	//String name = (String)request.getSession().getAttribute("name");
	
	String name = null;
	String id = null;
	
	// 쿠키 - 특정 쿠키만 가져오기 안됨... 모든 쿠키를 가져온다
	/*
	Cookie[] ar = request.getCookies(); // 배열로 모든 쿠키 가져오기
	if(ar!=null){
		for(int i=0; i<ar.length; i++){
			//String cookieName = ar[i].getName(); // 쿠키명 
			//String cookieValue = ar[i].getValue(); // 값
			//System.out.println(cookieName+", "+cookieValue);
			if(ar[i].getName().equals("memName")){
				name = ar[i].getValue();
			}
			if(ar[i].getName().equals("memId")){
				id = ar[i].getValue();
			}		
		}
	}*/
	
	// 세션
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
%>

<img src="../image/ni2.png" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;"><br>
<%=name%>님 로그인
<br>
<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<input type="submit" value="회원정보수정 " onclick="location.href='modifyForm.jsp'">