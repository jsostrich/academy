<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
<h1>main 페이지입니다.</h1>
<p>session id : <%=session.getId() %></p>
<a href = "setSession.jsp">setSession.jsp로 이동</a>
</body>
</html>