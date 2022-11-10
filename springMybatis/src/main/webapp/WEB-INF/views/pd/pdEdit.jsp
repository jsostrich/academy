<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	//PdDTO dto=(PdDTO)request.getAttribute("pdDto");
	//String no = request.getParameter("no");
	
	//3. 결과 처리
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 수정</h2>
<form name="frmPd" method="post" 
	action="<c:url value='/pd/pdEdit.do'/>">
	<!-- 수정시 no가 필요하므로 hidden 필드에 넣어서 보낸다 -->
	<input type="hidden" name="no" value="${param.no}">
		
	상품명:<input type="text" name="pdName" 
		value="${dto.pdName}"><br>
	가격:<input type="text" name="price" 
		value="${dto.price}"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">	
</form>

<br><br>
<a href="<c:url value='/pd/pdList.do'/>">상품 목록</a>
</body>
</html>