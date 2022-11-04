<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="com.book.model.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookWrite_ok.jsp</title>
</head>
<body>
	<%
	//�ϴ� ���ڵ�
	request.setCharacterEncoding("euc-kr");
	//ó���ϱ�
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
			System.out.println("å ��� ����");
			response.sendRedirect("bookWrite.jsp");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	%>
	
</body>
</html>