<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useCookie.jsp</title>
</head>
<body>
	<%
		//생성한 쿠키 정보 읽어오기
		String id = "", age="";
		Cookie[] ckArr = request.getCookies();
		if(ckArr!=null){
			for(int i =0;i<ckArr.length;i++){
				if(ckArr[i].getName().equals("id")){
					id=ckArr[i].getValue();
				}
				if(ckArr[i].getName().equals("age")){
					age=ckArr[i].getValue();
				}
			}//for
		}
	%>
	<p>쿠키 이름 : id, 쿠키의 값 : <%= id %></p>
	<p>쿠키 이름 : age, 쿠키의 값 : <%= age %></p>
</body>
</html>