<%@page import="com.book.model.BookDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookDelete.jsp</title>
</head>
<body>
<%
	//http://localhost:9090/mystudy/book/bookDetail.jsp?no=19���� ������ư ������ ����
	//1. ��û �Ķ���� ����
	String no = request.getParameter("no");
	
	//2.dbó��
	BookDAO dao = new BookDAO();
	try{
		int cnt = dao.delete(Integer.parseInt(no));
		if(cnt>0){
			System.out.println("�����Ϸ�");
			response.sendRedirect("bookList.jsp");
		}else{
			System.out.println("��������");
			response.sendRedirect("bookDetail.jsp?no="+no);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3.������
%>
</body>
</html>