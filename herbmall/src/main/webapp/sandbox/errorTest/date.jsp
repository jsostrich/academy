<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"  %>
<!-- 에러가 발생되면 에러를 처리하는 페이지인 error.jsp 에서 처리함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = sdf.format(d);

%>
<h1>일반 jsp 페이지</h1>
<p>현재 날짜 : <%=strDat %></p> <!-- 고의로 에러 발생 -->
</body>
</html>