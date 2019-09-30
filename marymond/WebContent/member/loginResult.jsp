<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${memberDTO == null}">
{"result" : "fail"}
</c:if>
<c:if test="${memberDTO != null}">
{"result" : "ok"}
</c:if>