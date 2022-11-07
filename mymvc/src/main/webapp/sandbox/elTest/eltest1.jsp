<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//표현언어 - EL : 기존의 JSP 표현식을 대체하는 효과
	//EL 표현식에는 연산자 사용 가능, 내장객체 지원함
	//NULL에 관대하고 형변환도 자동으로 해줌
%>
<h1>el 표현식</h1>
<p>\${2+5 } : ${2+5 }</p>
<p>\${10/3 } : ${10/3 }</p>
<p>\${10%3 } : ${10%3 }</p>
<p>\${header.host } : ${header.host }</p>
<p>\${header["user-agent"] } : ${header["user-agent"] }</p>

<h2>기존 jsp 방식</h2>
<%
	String host= request.getHeader("host");
	String agent= request.getHeader("user-agent");	
%>
<p>host:<%=host %></p>
<p>user-agent:<%=agent %></p>




</body>
</html>