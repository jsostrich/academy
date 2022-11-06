<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookWrite.jsp</title>
</head>
<body>
<!-- http://localhost:9090/mystudy/book/bookWrite.jsp -->
<h1>책 등록</h1>
<form name="bookResister" method="post" 
	action="<%=request.getContextPath() %>/book/bookWrite_ok.do">
	<p>첵제목: <input type="text" name="bookName"></p>
	<p>가격: <input type="text" name="bookPrice"></p>
	<p>퍼블리셔: <input type="text" name="pub"></p>
	<input type="submit" value="등록"> <input type="reset" value="취소">
</form>
	<br>
	<a href="bookList.jsp">책 목록</a>
</body>
</html>