<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H3>표현언어 -파라미터값 처리</H3>
	<P>
	<%
	// request.setCharacterEncoding("utf-8");
	%>
	
<fmt:requestEncoding value="utf-8"/>
	<FORM action="paramTest.jsp" method="post">
		이름 : <input type="text" name="name" value="${param['name']}">
		<input type="submit" value="확인">
	</FORM>
	<P>이름: </P>
	<p>표현언어 이용 : ${param.name}</p>
	<p>기존 방식 :<%=request.getParameter("name") %></p>
</body>
</html>