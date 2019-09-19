<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${imageBoardDTO!=null }">
	<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="5">
		<tr>
			<td><img src="../storage/${imageBoardDTO.image1 }" height="150" width="150"></td>
			<td>상품명: ${imageBoardDTO.imageName }
			<br>단가: <fmt:formatNumber value="${imageBoardDTO.imagePrice }" pattern="#,###"/>
			<br>개수: ${imageBoardDTO.imageQty }
			<br>합계: <fmt:formatNumber value="${imageBoardDTO.imageQty*imageBoardDTO.imagePrice }" pattern="#,###" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea style="height: 180px; width: 450px; resize: none; border: none;" readonly="readonly">${imageBoardDTO.imageContent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="location.href='/miniproject/imageboard/imageboardList.do?pg=${pg}'">
			</td>
		</tr>
	</table>
</c:if>
