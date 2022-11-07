<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>배송비 구하기</h1>
	<c:set var="sum" value="0"></c:set>
   <c:set var="totalPrice" value="25000"></c:set>
   <c:set var="delivery" value="0"></c:set>
   
   <c:if test="${totalPrice<30000}">
      <c:set var="delivery" value="3000"></c:set>
   </c:if>
   
   <c:set var="sum" value="${totalPrice+delivery}"></c:set>
   
   totalPrice: ${totalPrice }<br>
   delivery: ${delivery }<br>
   sum: ${sum }<br>
</body>
</html>