<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookWrite.jsp</title>
</head>
<body>
<!-- http://localhost:9090/mystudy/book/bookWrite.jsp -->
<h1>å ���</h1>
<form name="bookResister" method="post" action="bookWrite_ok.jsp">
	<p>ý����: <input type="text" name="bookName"></p>
	<p>����: <input type="text" name="bookPrice"></p>
	<p>�ۺ���: <input type="text" name="pub"></p>
	<input type="submit" value="���"> <input type="reset" value="���">
</form>
	<br>
	<a href="bookList.jsp">å ���</a>
</body>
</html>