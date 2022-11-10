<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reboardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
	
<%
	request.setCharacterEncoding("utf-8");	

	String pass=request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	String password=reboardService.getPass(num);
	
	if(pass.equals(password)){
		reboardService.deleteBoard(num);
		
		response.sendRedirect("BoardList.jsp");
	}else{%>
		<script type="text/javascript">
			alert('패스워드가 틀려서 삭제할 수 없습니다. 패스워드를 확인해 주세요');
			history.go(-1);
		</script>
		
	
	<%}
%>
</body>
</html>