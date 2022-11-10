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
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="reboardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="reboardVO"/>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
	
<%
	String pass=reboardService.getPass(reboardVO.getNum());

	if(pass.equals(reboardVO.getPassword())){
		reboardService.updateBoard(reboardVO);
		response.sendRedirect("BoardList.jsp");
	}else{
	%>
		<script type="text/javascript">
			alert('패스워드가 일치하지 않습니다. 다시 확인후 수정해주세요');
			history.go(-1);
		</script>
		
	<%
	}
%>
</body>
</html>