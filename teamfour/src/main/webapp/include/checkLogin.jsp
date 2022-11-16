<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkLogin.jsp</title>
</head>
<body>
<%
	String d_userid=(String)session.getAttribute("d_userid");
	if(d_userid==null || d_userid.isEmpty()){ %>
		<script type="text/javascript">
			alert('먼저 로그인하세요');
			location.href
			="<%=request.getContextPath()%>/loginClass.jsp";
		</script>
		
	<%	return;
	}
%>
</body>
</html>