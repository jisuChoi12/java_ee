<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
    
<%
	/* 
	Eclipse
	가상폴더
	C:\Users\bitcamp\Documents\GitHub\java_ee\workspace\memberJSP\WebContent\storage
	실제폴더
	C:\Users\bitcamp\Documents\GitHub\java_ee\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\memberJSP\storage 
	*/
	
	// 실제 폴더
	String realFolder = request.getServletContext().getRealPath("/storage");
	System.out.println("실제폴더: "+realFolder);
	
	// 업로드
	MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	// DefaultFileRenamePoliy를 쓰면 두가지 다 필요
	String originalFileName1 = multi.getOriginalFileName("upload1"); // 원래 파일명
	String originalFileName2 = multi.getOriginalFileName("upload2"); 
	
	String fileName1 = multi.getFilesystemName("upload1"); // 시스템 파일명
	String fileName2 = multi.getFilesystemName("upload2");
	
	File file1 = multi.getFile("upload1"); // 파일명으로 파일 생성
	File file2 = multi.getFile("upload2");
	
	long fileSize1 = 0;
	long fileSize2 = 0;
	if(file1!=null) fileSize1 = file1.length();
	if(file2!=null) fileSize2 = file2.length();
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<h3>업로드 완료</h3>
<ul>
	<li>제 목 : <%=subject %><br>
	<li>내 용 : <pre><%=content %></pre><br>
	<li>파 일 : <a href="fileDownload.jsp?fileName=<%=URLEncoder.encode(originalFileName1,"UTF-8") %>"><%=originalFileName1 %></a><br>
	<li>파 일 : <%=fileName1 %><br>
	<li>크 기 : <%=fileSize1 %><br>
	--------------------------------------
	<li>파 일 : <%=originalFileName2 %><br>
	<li>파 일 : <%=fileName2 %><br>
	<li>크 기 : <%=fileSize2 %><br>

</ul>
</body>
</html>














