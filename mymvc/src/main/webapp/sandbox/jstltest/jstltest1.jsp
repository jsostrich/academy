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
	<h1>jstl core : set, remove, out</h1>
	<c:set var="browser" value="${header['user-agent'] }"></c:set>
	<h2>el 표현식 이용 </h2>
	<p>브라우저 정보 : ${browser }</p>
	
	<h2>jst1 이용-out</h2>
	<p>브라우저 정보 : 
		<c:out value="${browser }"></c:out>
	</p>
	<h3>browser 변수 제거 후</h3>
	<c:remove var="browser"/>
	<p>브라우저 정보 : ${browser }</p>
	
	
	
</body>
</html>