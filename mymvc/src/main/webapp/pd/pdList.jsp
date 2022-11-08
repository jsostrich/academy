<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mymvc.pd.model.PdDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>pdList.jsp</title>
</head>
<body>
<%
	//뷰페이지 - request에서 결과를 읽어와서 화면에 출력한다
	//List<PdDTO> list= (List<PdDTO>)request.getAttribute("list");
	
	//3. 결과 처리
	//DecimalFormat df = new DecimalFormat("#,###");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<h1>상품 목록</h1>
<table border="1" style="width:500px">
	<Tr>
		<th>번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>등록일</th>
	</Tr>
	<!-- 반복시작 -->
	<c:forEach var="dto" items="${list }">	
		<tr>
			<td>${dto.no}</td>
			<td>
				<a href="<c:url value='/pd/pdDetail.do?no=${dto.no}'/>">
					${dto.pdName }
				</a>
			</td>
			<td style="text-align: right">
				<fmt:formatNumber value="${dto.price }" pattern="#,###" />
			</td>
			<td>
				<fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
	</c:forEach>	
	<!-- 반복끝 -->
</table>
<br>
<a href="<c:url value='/pd/pdWrite.do'/>">상품 등록</a>
</body>
</html>