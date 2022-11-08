<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fmt-formatNumber, formatDate</h1>
<c:set var="num" value="12345.678"/>
<p>number : <fmt:formatNumber value="${num }" type="number"/></p>
<p>currency : <fmt:formatNumber value="${num }" type="currency"
	currencySymbol="\\"/></p>
<p>percent : <fmt:formatNumber value="${num }" type="percent" /></p>
<p>pattern=".0" : <fmt:formatNumber value="${num }" 
	pattern=".0"/></p>
<p>pattern="#,###" : <fmt:formatNumber value="${num }" 
	pattern="#,###"/></p>

<h2>formatDate</h2>
<c:set var="now" value="<%=new Date() %>" />
<c:out value="${now }"/>

<p>date : <fmt:formatDate value="${now }" type="date"/></p>
<p>time : <fmt:formatDate value="${now }" type="time"/></p>
<p>both : <fmt:formatDate value="${now }" type="both"/></p>
<p>pattern : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
<p>dateStyle-long : <fmt:formatDate value="${now }" 
	type="both" dateStyle="long"/></p>
<p>dateStyle-long : <fmt:formatDate value="${now }" 
	type="both" dateStyle="default"/></p>
<p>dateStyle-short : <fmt:formatDate value="${now }" 
	type="both" dateStyle="short"/></p>
<p>dateStyle-medium : <fmt:formatDate value="${now }" 
	type="both" dateStyle="medium"/></p>
<p>dateStyle-full : <fmt:formatDate value="${now }" 
	type="both" dateStyle="full"/></p>
</body>
</html>