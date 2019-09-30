<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${isExist==true }">
{"result" : "fail"}
</c:if>
<c:if test="${isExist==false }">
{"result" : "ok"}
</c:if>