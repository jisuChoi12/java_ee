<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<c:set var="year" value="${fn:substring(sysYear,0,4)}" />

<fmt:requestEncoding value="UTF-8" />
<c:set var="dateParts" value="${fn:split(param.birth, '/') }" />

${param.name}님의 생일은 ${dateParts[0]}년 ${dateParts[1]}월 ${dateParts[2]}일
입니다 나이는 ${year-dateParts[0]+1}살 입니다
