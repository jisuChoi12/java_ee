<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="member.bean.ZipcodeDTO"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
td {
	font-size: 8pt;
}

#addressA:Link {
	color: black;
	text-decoration: none;
}

#addressA:visited {
	color: black;
	text-decoration: none;
}

#addressA:hover {
	color: green;
	text-decoration: underline;
}

#addressA:active {
	color: black;
	text-decoration: none;
}
</style>

<form name="" method="post" action="/miniproject/member/checkPost.do">
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
				<input type="submit" value="검색"></td>
		</tr>
		<tr>
			<td align="center">우편번호</td>
			<td align="center" colspan="3">주소</td>
		</tr>
		<c:if test="${list!=null }">
			<c:forEach var="zipcodeDTO" items="${list }">
				<c:set var="address">
						${zipcodeDTO.sido
						} ${zipcodeDTO.sigungu
						} ${zipcodeDTO.yubmyundong
						} ${zipcodeDTO.ri
						} ${zipcodeDTO.roadname
						} ${zipcodeDTO.buildingname }
					</c:set>
				<tr>
					<td align="center">${zipcodeDTO.zipcode }</td>
					<td colspan="3"><a id="addressA" href="#"
						onclick="checkPostClose('${zipcodeDTO.zipcode}', '${address }')"><c:out
								value="${address }" /></a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</form>

<script src="/miniproject/js/member.js" type="text/javascript"></script>
