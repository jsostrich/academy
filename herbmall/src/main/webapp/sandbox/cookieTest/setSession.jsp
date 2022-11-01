<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setSession.jsp</title>
</head>
<body>
	<%
		//Session = > 사용자의 정보를 저장하는 방법 = > 웹서버에 저장된다
		String id = "hong";
		String pwd = "1234";
		
		session.setAttribute("id", id); //name, value 쌍으로 넣는다.
		session.setAttribute("pwd", pwd);
		
	%>
	
	<p>session에 정보가 저장되었습니다.</p>
	<a href="useSession.jsp">세션 정보 읽어오기</a>
	<p>session id : <%= session.getId() %></p>
</body>
</html>