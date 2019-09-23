<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="toady" value="${now }" pattern="yyyy" />
<fmt:requestEncoding value="UTF-8" />
<c:set var="birth" value="${fn:split(param.birth, '/') }" />
<c:set var="year" value="${birth[0]}"/>
<c:set var="month" value="${birth[1]}"/>
<c:set var="day" value="${birth[2]}"/>

${param.name}님의 생일은 ${year}년 ${month}월 ${day}일 입니다.
 나이는 ${toady-year+1}살 입니다
