<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	window.onload = function() {
		alert("답글 작성 완료");
		location.href="/miniproject/board/boardList.do?pg=${pg}";
	} 
</script>