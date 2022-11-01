<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
	<%
		//세션의 모든정보 삭제
		session.invalidate();
	%>
	<p>session id : <%=session.getId() %></p>
	<%
		response.sendRedirect("main.jsp");
	%>
</body>
</html>