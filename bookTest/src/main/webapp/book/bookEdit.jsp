<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="com.book.model.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookEdit.jsp</title>
</head>
<body>
<%
	//상세페이지에서 수정버튼 눌러서 왓음
	//http://localhost:9090/mystudy/book/bookEdit.jsp?no=13
	//1.파라미터 읽어오기
	String no=request.getParameter("no");

	//2.db처리
	BookDTO dto = null;
	BookDAO dao = new BookDAO();
	
	//3.결과출력
	try{
		dto = dao.selectNO(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<h2>상품 수정</h2>
<form name="fred" method="post" action="bookEdit_ok.jsp">
<input type="hidden" name="no" value="<%=no %>"><br>
   책제목:<input type="text" name="bookName" value=" <%=dto.getTitle() %>" ><br>
   가격:<input type="text" name="price" value="<%=dto.getPrice() %>"><br>
   퍼블리셔:<input type="text" name="pub" value=" <%=dto.getPublisher()%>"><br><br>
   <input type="submit" value="등록">
   <input type="button" value="취소">   
</form>
</body>
</html>