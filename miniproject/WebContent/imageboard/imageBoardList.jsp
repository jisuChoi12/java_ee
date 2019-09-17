<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../css/board.css">
<c:if test="${list!=null }">
	<br>
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="2" width="600px">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>단가</th>
			<th>개수</th>
			<th>합계</th>
		</tr>
		<c:forEach var="imageBoardDTO" items="${list }">
			<tr>
				<td align="center">${imageBoardDTO.seq }</td>
				<td align="center"><a href="/miniproject/imageboard/imageboardView.do?pg=${pg }&seq=${imageBoardDTO.seq}"><img src="http://localhost:8080/miniproject/storage/${imageBoardDTO.image1 }" width="110" height="110"></a></td>
				<td align="left">${imageBoardDTO.imageName }</td>
				<td align="center"><fmt:formatNumber value="${imageBoardDTO.imagePrice }" pattern="#,###"/></td>
				<td align="center">${imageBoardDTO.imageQty }</td>
				<td align="center">${imageBoardDTO.imageQty*imageBoardDTO.imagePrice }</td>
			</tr>
		</c:forEach> 
	</table>
	<br>
	<div
		style="display: inline-block; float: left; text-align: center; width: 100%;">${boardPaging.pagingHTML }
	</div>
</c:if>


