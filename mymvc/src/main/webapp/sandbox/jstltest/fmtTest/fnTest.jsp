<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fn</h1>
	<h2>abcd=>ABCD로 바꾸기</h2>
	<c:set var="str" value="abcd" />
	<p>str 변수의 값 : ${str } </p>
	<p>replace 함수 사용 후 : ${fn:replace(str, "a", "A") } </p>
	<p>${fn:replace("abcdef", "a", "A") } </p>
	
	<h2>str변수에서 b의 위치 구하기</h2>
	<p>${fn:indexOf(str,"b") }</p>
	
	<h2>birth 변수에서 월만 잘라내기</h2>
	
	<c:set var="birth" value = "1999-09-12" />
	<p>${fn:substring(birth, 5,7 )}</p>
	
	<h2>split 함수 이용</h2>
	<c:set var="result" value="${fn:split(birth, '-')}"/>
	<p>${result[0]}년 ${result[1] }월 ${result[2] }일</p>
	
	<h2>함수의 결과를 변수에 넣기</h2>
	<c:set var="result2" value="${fn:replace(str,'b','B') }" > </c:set>
	<p>${result2 }</p>	
	
</body>
</html>