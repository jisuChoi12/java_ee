<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마리몬드를 따라해보자</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css">
<link rel="shortcut icon"
	href="https://marymond.kr//data/icon/favicon/favicon1552013679.ico" />
<style type="text/css">
.jbContent {
	height: 2000px;
}

/* * {
	font-family: 'Nanum Myeongjo';
} */

a#topBtn {
	position: fixed; /* 포지션 고정 */
	right: 5%; /* 오른쪽에서 2% - %도 할수 있음*/
	bottom: 70px; /* 밑에서 5px */
	display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */
	z-index: 9999; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
}

</style>
</head>
<body>
	<header><jsp:include page="../template/top.jsp" /></header>
	<jsp:include page="${display }"></jsp:include>
	<a id="topBtn" href="#"><img src="../image/go_top_btn.png"
		width="50px;" height="50px;"></a>
	<footer><jsp:include page="../template/bottom.jsp" /></footer>
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	// 상단으로 이동하는 버튼
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 250) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});
		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
</html>