<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:formatNumber type="number" value="123456789" /><br>
<fmt:formatNumber type="number" value="123456789.88" /><br>
<fmt:formatNumber type="number" value="123456789.88" maxFractionDigits="1" /><br>
<fmt:formatNumber type="currency" value="12345.678" currencySymbol="\\" /><br>
<fmt:formatNumber type="currency" value="12345.678" currencyCode="KRW" /><br>
<br>

<fmt:formatNumber type="number" value="123456.78" pattern="#,###"/><br>
<fmt:formatNumber type="number" value="123456.789" pattern=".##"/><br>
<fmt:formatNumber type="number" value="123456.789" pattern="#,###.##"/><br>

<fmt:formatNumber type="number" value="0000.00" pattern="#,###.##"/><br>
<fmt:formatNumber type="number" value="0000.00" pattern="0,000.00"/><br>
<fmt:formatNumber type="number" value="12.3" pattern="000.00"/><br>
<br>

<c:set var="now" value="<%=new java.util.Date() %>"/>
<c:out value="${now }"/><br>
date : <fmt:formatDate value="${now }" type="date"/><br>
time : <fmt:formatDate value="${now }" type="time"/><br>
both : <fmt:formatDate value="${now }" type="both"/><br>

<fmt:formatDate value="${now }" pattern="yy-MM-dd hh:mm" type="both"/><br>
<fmt:formatDate value="${now }" pattern="yy-MM-dd" type="date"/><br>
<fmt:formatDate value="${now }" pattern="yy-MM-dd E요일a" type="date"/><br>
<fmt:formatDate value="${now }" pattern="HH:mm" type="time"/><br>

