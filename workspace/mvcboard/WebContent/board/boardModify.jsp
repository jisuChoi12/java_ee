<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
</body>
<script type="text/javascript">
	window.onload = function() {
		alert("글 수정 완료");
		location.href="/mvcboard/board/boardList.do?pg=${pg}";
	} 
</script>
</html>

<!-- 
Collection
: 객체를 모아주는 것

1. Collection coll = new ArrayList(); - 순서O(들어가는 순서대로 빠져나온다), 중복O
2. Set set = new HashSet(); - 순서X, 중복X 
3. Map<Key, Value>
	Map<"name","홍길동">
-->
