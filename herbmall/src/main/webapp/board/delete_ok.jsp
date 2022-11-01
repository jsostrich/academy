<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_ok.jsp</title>
</head>
<body>
<%
	//delete.jsp에서 post방식으로 서브밋됨
	//1
	request.setCharacterEncoding("utf-8");
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//2
	BoardDAO dao = new BoardDAO();
	try{
		int cnt=dao.deleteBoard(Integer.parseInt(no), pwd);
		
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert('글삭제되었습니다.');
				location.href="list.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('글삭제 실패!');
				history.back();
			</script>			
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>