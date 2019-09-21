<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="../css/board.css">
<form name="imageBoardList" method="get" action="/miniproject/imageboard/imageboardDelete.do">
<c:if test="${list!=null }">
	<br>
	<table border="1" frame="hsides" rules="rows" cellspacing="0"
		cellpadding="2" width="600px">
		<tr>
			<th><input type="checkbox" name="checkAll" id="all" onclick="check_All()">번호</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>단가</th>
			<th>개수</th>
			<th>합계</th>
		</tr>
		<c:forEach var="imageBoardDTO" items="${list }">
			<tr>
				<td align="center"><input type="checkbox" value="${imageBoardDTO.seq }" name="check">${imageBoardDTO.seq }</td>
				<td align="center"><a href="/miniproject/imageboard/imageboardView.do?pg=${pg }&seq=${imageBoardDTO.seq}"><img src="http://localhost:8080/miniproject/storage/${imageBoardDTO.image1 }" width="110" height="110"></a></td>
				<td align="left">${imageBoardDTO.imageName }</td>
				<td align="center"><fmt:formatNumber value="${imageBoardDTO.imagePrice }" pattern="#,###"/></td>
				<td align="center">${imageBoardDTO.imageQty }</td>
				<td align="center"><fmt:formatNumber value="${imageBoardDTO.imageQty*imageBoardDTO.imagePrice }" pattern="#,###" /></td>
			</tr>
		</c:forEach> 
	</table>
	<div style="float: center; border: 0; width: 600px; ">
		<input type="button" value="선택삭제" onclick="checkDelete()" style="float: right;">
	</div>
	<br>
	<div
		style="display: inline-block; float: left; text-align: center; width: 100%;">${boardPaging.pagingHTML }
	</div>
</c:if>
</form>

<script>
/* function check_All(){
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
	var check = new Array();
	for(i=0; i<imageBoardList.chk.length; i++){
		if(imageBoardList.chk[i].checked) {
			check.push(imageBoardList.chk[i].value);
		}
	}

	if(check.length==0){
		alert("항목을 선택하세요");
	} else {
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="/miniproject/imageboard/imageboardDelete.do?check="+check;
		} 
	}
} */
/* 강사님 */
function check_All(){
	var check = document.getElementsByName("check")
	
	if(document.getElementById("all").checked){
		for(i=0; i<check.length; i++){
			check[i].checked = true;
		}
	}else{
		for(i=0; i<check.length; i++){
			check[i].checked = false;
		}
	}	
}

function checkDelete(){
	var check = document.getElementsByName("check")
	var count=0;
	for(i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}
	
	if(count==0) 
		alert("항목을 선택하세요");
	else{
		if(confirm("정말로 삭제하시겠습니까?"))
			document.imageBoardList.submit();
	}
}
</script>

<!-- 
	document.getElementById("all").checked; // 보통 하나일때 Id속성
	
	document.getElementsByName("check") // 여러개일때는 name속성

 -->
