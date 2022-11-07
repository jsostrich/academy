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
	<h1>jst1 - foreach</h1>
	<h2>1~100까지 짝수의 합 구하기</h2>
	<c:set var="sum" value="0" />
	<c:forEach var="i"  begin="1" end="100">
		<c:if test="${i%2==0 }">
			${i } &nbsp;&nbsp;
			<c:set var="sum" value="${sum+i }"/>
		</c:if>
	</c:forEach>
	<br>
	<p>1~100까지 짝수의 합 : ${sum }</p>
	<h2>foreach 연습2</h2>
	<c:forEach var="head" items="${headerValues }">
		<p>header key : ${head.key }</p>
		<%-- <p>header value : ${head.value }</p> --%>
		<p>header value : 
			<c:forEach var="val" items="${head.value }">
				${val } 
			</c:forEach>
		</p><br>
	</c:forEach>
</body>
</html>