<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${imageBoardDTO!=null }">
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="5">
		<tr>
			<td rowspan="4"><img src="../storage/${imageBoardDTO.image1 }"
				height="150" width="150" id="productImg"><img
				src="../image/zoom.png" onclick="bigImage()"
				style="position: relative; left: -30px"></td>
			<td>상품명</td>
			<td>${imageBoardDTO.imageName }</td>
		</tr>
		<tr>
			<td>단가</td>
			<td><fmt:formatNumber value="${imageBoardDTO.imagePrice }"
					pattern="#,###" /></td>
		</tr>
		<tr>
			<td>개수</td>
			<td>${imageBoardDTO.imageQty }</td>
		</tr>
		<tr>
			<td>합계</td>
			<td><fmt:formatNumber
					value="${imageBoardDTO.imageQty*imageBoardDTO.imagePrice }"
					pattern="#,###" /></td>
		</tr>
		<tr>
			<td colspan="6"><textarea
					style="height: 180px; width: 450px; resize: none; border: none;"
					readonly="readonly">${imageBoardDTO.imageContent }</textarea></td>
		</tr>
		<tr>
			<td colspan="6" align="center"><input type="button" value="목록"
				onclick="location.href='/miniproject/imageboard/imageboardList.do?pg=${pg}'">
			</td>
		</tr>
	</table>
</c:if>

<script type="text/javascript">
	function bigImage() {
		var newWindow = window.open("", "", "width=520, height=520");
		var img = newWindow.document.createElement("img");
		img
				.setAttribute("src",
						"http://localhost:8080/miniproject/storage/${imageBoardDTO.image1}");
		img.setAttribute("width", "500");
		img.setAttribute("height", "500");
		img.setAttribute("style", "cursor: pointer");
		newWindow.document.body.appendChild(img);
	}
</script>