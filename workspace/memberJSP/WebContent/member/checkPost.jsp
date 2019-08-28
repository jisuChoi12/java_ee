<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="memberJSP.bean.ZipcodeDTO"%>
<%@page import="memberJSP.bean.MemberDTO"%>
<%@page import="memberJSP.dao.MemberDAO"%>

<%
	// 데이터
	request.setCharacterEncoding("UTF-8");
	String sido = request.getParameter("sido");
	String sigungu = request.getParameter("sigungu");
	String roadname = request.getParameter("roadname");
	System.out.println(sido + " " + sigungu + " " + roadname);

	// DB
	List<ZipcodeDTO> list = null;
	MemberDAO memberDAO = MemberDAO.getInstance();
	if (sido != null && roadname != null) {
		list = memberDAO.getZipcodeList(sido, sigungu, roadname);
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소</title>
<style type="text/css">
td {
	font-size: 8pt;
}
#addressA:Link { color: black; text-decoration: none; } 
#addressA:visited { color: black; text-decoration: none; } 
#addressA:hover { color: green; text-decoration: underline; }
#addressA:active { color: black; text-decoration: none; } 
</style>
</head>
<body>
	<form name="" method="post" action="checkPost.jsp">
		<table border=1 width="100%" cellpadding="2" cellspacing="1">
			<tr>
				<td align="center">시도</td>
				<td><select name="sido" style="width: 120px">
						<option>시도선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="광주">광주</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option></td>
				<td align="center">시.군.구</td>
				<td><input name="sigungu" type="text"></td>
			</tr>
			<tr>
				<td align="center">도로명</td>
				<td colspan="3"><input type="text" name="roadname" size="35">
					<input type="submit" value="검색" onclick=""></td>
			</tr>
			<tr>
				<td align="center">우편번호</td>
				<td align="center" colspan="3">주소</td>
			</tr>

			<%if(list!=null) { %>
			<% for (ZipcodeDTO zipcodeDTO : list) { 
				String address = zipcodeDTO.getSido()+" "
						+zipcodeDTO.getSigungu()+" "
						+zipcodeDTO.getYubmyundong()+" "
						+zipcodeDTO.getRi()+" "
						+zipcodeDTO.getRoadname()+" "
						+zipcodeDTO.getBuildingname();
			%><tr>
				<td align="center"><%=zipcodeDTO.getZipcode()%></td>
				<td colspan="3"><a id="addressA" href="#" onclick="checkPostClose('<%=zipcodeDTO.getZipcode()%>','<%=address%>')"><%=address%></a></td>
			</tr>
			<%} %>
			<%} %>

		</table>
	</form>
</body>
<script src="/memberJSP/js/member.js" type="text/javascript"></script>
</html>