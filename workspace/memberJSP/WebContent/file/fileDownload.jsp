<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>

<%
	String fileName = request.getParameter("fileName");
	String realFolder = request.getServletContext().getRealPath("/storage");
	System.out.println(realFolder+"\\"+fileName);
	
	// 다운로드 받을 파일 생성
	File file = new File(realFolder, fileName);
	fileName = URLEncoder.encode(fileName,"UTF-8").replace("+", " "); // 한글파일 지원x UTF-8로 바꿔야 함
	
	response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
	response.setHeader("Content-length", file.length()+"");
	
	/*
	getOutputStream() has already been called for this response
	JSP에서는 SERVLET으로 변환될 때 내부적으로 out객체가 자동으로 생성하기 때문에 
	따라 out객체를 만들면 충돌이 일어나서 저런 메세지가 뜨는 것이다.
	그래서 먼저 out를 초기화하고 생성하면 된다.
	*/
	out.clear();
	out = pageContext.pushBody();
			
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	int size = (int)file.length();
	byte[] b = new byte[size];
	bis.read(b,0,size);
	bos.write(b);
	bis.close();
	bos.close();
%>



<!-- 
IO Stream
1. byte
	InputStream (추상클래스)
	OutputStream (추상클래스)

2. 문자(2byte)
	Reader (추상클래스)
	Writer (추상클래스)


					BufferedInputStream					FileInputStream
fileDownload.jsp <ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ buffer <ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  storage
				  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ> buffer ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ> 원하는 위치 / 파일명
 -->
 
 
 
 
 