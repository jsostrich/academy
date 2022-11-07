<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="com.book.model.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookWrite_ok.jsp</title>
</head>
<body>
	<%
	//일단 인코딩
	request.setCharacterEncoding("UTF-8");
	//처리하기
	String bookName=request.getParameter("bookName");
	String bookPrice=request.getParameter("bookPrice");
	String pub=request.getParameter("pub");
	
	BookDTO dto = new BookDTO();
	BookDAO dao = new BookDAO();
	dto.setTitle(bookName);
	dto.setPrice(Integer.parseInt(bookPrice));
	dto.setPublisher(pub);
	
	try{
		int cnt = dao.onBook(dto);
		
		if(cnt>0){
			response.sendRedirect("bookList.jsp");
		}else{
			System.out.println("책 등록 실패");
			response.sendRedirect("bookWrite.jsp");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	%>
	
</body>
</html>