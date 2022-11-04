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
<h2>상품 등록</h2>
<form name="frmPd" method="post" 
	action="<%=request.getContextPath() %>/pd/pdWrite_ok.do">
	상품명:<input type="text" name="pdName" ><br>
	가격:<input type="text" name="price" ><br><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">	
</form>

<br><br>
<a href="pdList.jsp">상품 목록</a>

</body>
</html>