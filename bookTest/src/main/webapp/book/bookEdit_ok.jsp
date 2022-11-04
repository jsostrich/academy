<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="com.book.model.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookEdit_ok.jsp</title>
</head>
<body>
<%
	//�Ͽ����Ϳ��� ������ �Է��ϰ� ������ ������ �Ϸο´�
	//������ ������ ���ڵ�����
	request.setCharacterEncoding("euc-kr");
	//1.�Ķ���� �о����
	String no = request.getParameter("no");
	String bookName = request.getParameter("bookName");
	String price = request.getParameter("price");
	String pub = request.getParameter("pub");
	//2.dbó��
	BookDTO dto = new BookDTO();
	BookDAO dao = new BookDAO();
	dto.setNo(Integer.parseInt(no));
	dto.setTitle(bookName);
	dto.setPrice(Integer.parseInt(price));
	dto.setPublisher(pub);
	
	try{
		int cnt = dao.update(dto);
		
	//3.���ó��
		if(cnt>0){
			System.out.println("������Ʈ �Ϸ�");
			response.sendRedirect("bookDetail.jsp?no="+no);
		}else{
			System.out.println("������Ʈ ����");
			response.sendRedirect("bookEdit.jsp?no="+no);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>