<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pdWrite.jsp</title>
</head>
<body>
<!-- 
http://localhost:9090/mystudy/day2/pdWrite.jsp
http://localhost:9090/testsite/day2/test02.jsp -->
<h2>��ǰ ���</h2>
<form name="frmPd" method="post" 
	action="<%=request.getContextPath() %>/pd/pdWrite_ok.do">
	��ǰ��:<input type="text" name="pdName" ><br>
	����:<input type="text" name="price" ><br><br>
	<input type="submit" value="���">
	<input type="reset" value="���">	
</form>

<br><br>
<a href="pdList.jsp">��ǰ ���</a>

</body>
</html>