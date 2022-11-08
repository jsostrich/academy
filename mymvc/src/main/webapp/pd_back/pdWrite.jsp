<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>pdWrite.jsp</title>
</head>
<body>
<!-- 
http://localhost:9090/mystudy/day2/pdWrite.jsp
http://localhost:9090/testsite/day2/test02.jsp -->
<h2>상품 등록</h2>
<form name="frmPd" method="post" 
	action='<c:url value="/pd/pdwrite_ok.do"/>'>
	상품명:<input type="text" name="pdName" ><br>
	가격:<input type="text" name="price" ><br><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">	
</form>

<br><br>
<a href=" <c:url value='/pd/pdList.do'/>" >상품 목록</a>

</body>
</html>