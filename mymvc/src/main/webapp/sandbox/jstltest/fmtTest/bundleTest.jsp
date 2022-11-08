<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<fmt:setLocale value="ko"/>
<fmt:bundle basename="bundle.testBundle">    
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>bundleTest.jsp</title>
	</head>
	<body>
		<h1>fmt-bundle</h1>
		<p><fmt:message key="name" /></p>
		<fmt:message key="message" var="msg"/>
		
		<p>message : <c:out value="${msg }" /></p>
		
	</body>
	</html>
</fmt:bundle>