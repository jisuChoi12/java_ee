<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="memberJSP.dao.MemberDAO"%>
<%@page import="memberJSP.bean.MemberDTO"%>

<%
	// 데이터
	
	String id = (String)session.getAttribute("memId");

	// 디비
	MemberDTO memberDTO = MemberDAO.getInstance().getMember(id);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<form name="modifyForm" method="post" action="modify.jsp">
	<img src="../image/ni13.gif" width="80" height="80"
			onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
		<h2>회원정보수정</h2>
		<table border=3 cellspacing="2" cellpadding="2">
			<tr>
				<th width=120>이름</th>
				<td><input type="text" name="name" size=20
					value="<%=memberDTO.getName()%>"></td>
			</tr>

			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size=25
					value=<%=memberDTO.getId()%> readonly></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" size=30></td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="repwd" size=30></td>
			</tr>

			<tr>
				<th>성별</th>
				<td><input type="radio" class="genderRadio" name="gender"
					value="0"> 여성 <input type="radio" class="genderRadio"
					name="gender" value="1"> 남성</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="text" name="email1" size=15
					value=<%=memberDTO.getEmail1()%>> @ <input list="mailaddr"
					name="email2" id="email22" size=15 placeholder="직접입력"> <datalist
						id="mailaddr">
						<option value="gmail.com"></option>
						<option value="naver.com"></option>
						<option value="hotmail.com"></option>
					</datalist></td>
			</tr>

			<tr>
				<th>핸드폰</th>
				<td><select name="tel1" id="tel11">
						<option value="010">010</option>
						<option value="019">019</option>
						<option value="011">011</option>
				</select> <input type="text" name="tel2" size=5
					value=<%=memberDTO.getTel2()%>> <input type="text"
					name="tel3" size=5 value=<%=memberDTO.getTel3()%>></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" id="daum_zipcode" name="zipcode" size=5
					value=<%=memberDTO.getZipcode()%> readonly> <input
					type="button" value="우편번호검색" onclick="checkPost()"> <br>
					<input type="text" id="daum_addr1" name="addr1" size=40
					placeholder="주소 " value="<%=memberDTO.getAddr1()%>" readsonly><br>
					<input type="text" id="daum_addr2" name="addr2" size=40
					placeholder="상세 주소 " value="<%=memberDTO.getAddr2()%>"></td>
			</tr>

			<tr>
				<td colspan=2 align="center"><input type="button"
					value="회원정보수정" onclick="checkModify()"> <input type="reset"
					value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
<script src="/memberJSP/js/member.js" type="text/javascript"></script>
<script type="text/javascript">	
		window.onload=function(){
		document.modifyForm.gender['<%=memberDTO.getGender()%>'].checked = true;
		document.modifyForm.email2.value='<%=memberDTO.getEmail2()%>';
		document.modifyForm.tel1.value='<%=memberDTO.getTel1()%>';
		
		//document.getElementById("email22").value='<%=memberDTO.getEmail2()%>';
		//document.getElementById("tel11").value='<%=memberDTO.getTel1()%>';
	}
</script>
</html>