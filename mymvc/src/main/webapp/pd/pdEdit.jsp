<%@page import="com.mymvc.pd.model.PdService"%>
<%@page import="com.mymvc.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//pdDetail.jsp에서 [수정]클릭하면 get방식으로 이동
	//=> http://localhost:9090/mystudy/pd/pdEdit.jsp?no=16
	//1. 요청 파라미터 읽어오기
	
	//PdDTO dto = (PdDTO)request.getAttribute("pdDto");
	
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
	action="<c:url value='/pd/pdEdit_ok.do' />">
	<!-- 수정시 no가 필요하므로 hidden 필드에 넣어서 보낸다 -->
	<input type="hidden" name="no" value="${param.no }">
		
	상품명:<input type="text" name="pdName" 
		value="${pdDto.pdName }"><br>
	가격:<input type="text" name="price" 
		value="${pdDto.price }"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">	
</form>

<br><br>
<a href="<c:url value='/pd/pdList.do'/>">상품 목록</a>

</body>
</html>