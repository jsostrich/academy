<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useSession.jsp</title>
</head>
<body>
	<%
		String id  = (String)session.getAttribute("id");
		String pwd  = (String)session.getAttribute("pwd");
		int interval = session.getMaxInactiveInterval();// 기본 30분(1800초)
	%>
	
	<p>세션에서 읽은 아이디 : <%=id %></p>
	<p>비밀번호 : <%=pwd %></p>
	<p>세션 유지시간 : <%=interval %>초</p>
	<p>session id : <%=session.getId() %></p>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>