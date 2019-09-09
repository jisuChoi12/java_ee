<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>MAIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/member.css">
<!-- 구글 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
</head>

<header>
	<h2>Hello :D</h2>
	<img src="../image/ni8.png" width="390" height="200">
</header>
<body id="body">
	<section>
		<nav>
			<ul>
				<li><a href="loginForm.jsp" target="iframe_main">로그인</a></li>
				<li><a href="writeForm.jsp" target="iframe_main">회원가입</a></li>
			</ul>
		</nav>
	</section>
	<article>
		<iframe id="frame" name="iframe_main"></iframe>
	</article>
	<aside></aside>
	<footer></footer>
</body>
<script src="../js/member.js" type="text/javascript"></script>
</html>