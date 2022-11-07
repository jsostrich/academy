<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jstl - url</h1>
<a href='<c:url value='/sandbox/elTest/eltest1.jsp' ></c:url>'>elTest1.jsp로 이동</a>
<br><br>
<img src='<c:url value='/images/herb.JPG' />'>
<br>
<p>context path :${pageContext.request.contextPath }</p>
<img src = "${pageContext.request.contextPath }/images/herb.JPG ">
</body>
</html>