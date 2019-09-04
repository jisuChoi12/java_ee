<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL TEST</title>
</head>
<body>

<h3>** 변수 설정 **</h3>
<c:set var="name">홍길동</c:set>
<c:set var="age" value="25"/>
나의 이름은 <c:out value="${name }"/> 입니다<br> <!-- jstl -->
내 나이는 ${age }살 입니다<br> <!-- el -->
내가 좋아하는 색깔은 ${color } 입니다<br> <!-- 없으면 안나옴 -->

<h3>** 변수 삭제 **</h3>
<c:remove var="name"/>
나의 이름은 <c:out value="${name }"/> 입니다<br>
내 나이는 ${age } 입니다<br>

<h3>** forEach **</h3>
<c:forEach var="i" begin="1" end="10" step="1"> <!-- for(int i=0; i<10; i++) -->
	${i } 
	<c:set var="sum" value="${sum+i }"/>
</c:forEach>
<br>1부터 10까지의 합 = ${sum}

<h3>** forEach2 **</h3>
<c:forEach var="i" begin="1" end="10" step="1">
	${11-i }
</c:forEach>

<h3>** 문자열 분리 **</h3>
<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
	${car }<br>
</c:forTokens>

<h3>** jstlExam.jsp에서 넘어온 데이터 출력 **</h3>
결과 = ${requestScope.list } <!-- requestScope.list의 주소값이 찍힘 [호랑이, 사자, 기린, 코끼리, 타조, 코알라, 여우] -->

<h3>** 인덱스 2번째 데이터 출력 **</h3>
결과 = ${list[2] } <!-- requestScope 생략 가능 -->
<br><br>
<c:forEach var="personDTO" items="${requestScope.list2 }"> <!-- for(PersonDTO personDTO : list2) -->
	<!-- ${personDTO }<br> -->
	이름 = ${personDTO.getName() } &nbsp; &emsp; 나이 = ${personDTO.getAge() }<br>
	이름 = ${personDTO.name } &nbsp; &emsp; 나이 = ${personDTO.age }<br>  <!-- name/age 필드 아니고 메소드명 -->
</c:forEach>

</body>
</html>