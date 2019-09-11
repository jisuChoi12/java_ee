<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	window.onload = function() {
		alert("글 수정 완료");
		location.href="/miniproject/board/boardList.do?pg=${pg}";
	} 
</script>
</html>
