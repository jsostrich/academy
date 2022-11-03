<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foodResult.jsp</title>
</head>
<body>
<h1>음식 추천 결과</h1>
<%
	String result=(String)request.getAttribute("result");
%>

추천 음식 : <%=result %>
</body>
</html>






