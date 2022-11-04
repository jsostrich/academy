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
<h1>책 등록</h1>
<form name="bookResister" method="post" action="bookWrite_ok.jsp">
	<p>첵제목: <input type="text" name="bookName"></p>
	<p>가격: <input type="text" name="bookPrice"></p>
	<p>퍼블리셔: <input type="text" name="pub"></p>
	<input type="submit" value="등록"> <input type="reset" value="취소">
</form>
	<br>
	<a href="bookList.jsp">책 목록</a>
</body>
</html>