<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reboardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="reboardVO"/>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	try{
		int cnt=reboardService.reWriteBoard(reboardVO);
		if(cnt>0){
			response.sendRedirect("BoardList.jsp");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>