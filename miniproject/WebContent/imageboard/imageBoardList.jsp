<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="../css/board.css">
<form name="imageBoardList" action="/miniproject/imageboard/imageboardDelete.do">
<c:if test="${list!=null }">
	<br>
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="2" width="600px">
		<tr>
			<th><input type="checkbox" name="checkAll" onclick="check_All()">번호</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>단가</th>
			<th>개수</th>
			<th>합계</th>
		</tr>
		<c:forEach var="imageBoardDTO" items="${list }">
			<tr>
				<td align="center"><input type="checkbox" value="${imageBoardDTO.seq }" name="chk">${imageBoardDTO.seq }</td>
				<td align="center"><a href="/miniproject/imageboard/imageboardView.do?pg=${pg }&seq=${imageBoardDTO.seq}"><img src="http://localhost:8080/miniproject/storage/${imageBoardDTO.image1 }" width="110" height="110"></a></td>
				<td align="left">${imageBoardDTO.imageName }</td>
				<td align="center"><fmt:formatNumber value="${imageBoardDTO.imagePrice }" pattern="#,###"/></td>
				<td align="center">${imageBoardDTO.imageQty }</td>
				<td align="center"><fmt:formatNumber value="${imageBoardDTO.imageQty*imageBoardDTO.imagePrice }" pattern="#,###" /></td>
			</tr>
		</c:forEach> 
	</table>
	<input type="button" value="선택삭제" onclick="checkDelete()">
	<br>
	<div
		style="display: inline-block; float: left; text-align: center; width: 100%;">${boardPaging.pagingHTML }
	</div>
</c:if>
</form>

<script>
function check_All(){
		if(imageBoardList.checkAll.checked){
			for(i=0; i<imageBoardList.chk.length; i++){
				imageBoardList.chk[i].checked=true;
			}
		} else {
			for(i=0; i<imageBoardList.chk.length; i++){
				imageBoardList.chk[i].checked=false;
			}
		}
	}	
function checkDelete(){
	var seqs = new Array();
	for(i=0; i<imageBoardList.chk.length; i++){
		if(imageBoardList.chk[i].checked) {
			seqs.push(imageBoardList.chk[i].value);
		}
	}

	if(seqs.length==0){
		alert("항목을 선택하세요");
	} else {
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="/miniproject/imageboard/imageboardDelete.do?seqs="+seqs;
		} 
	}
}
</script>


