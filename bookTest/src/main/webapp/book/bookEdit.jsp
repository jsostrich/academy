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
	//������������ ������ư ������ ����
	//http://localhost:9090/mystudy/book/bookEdit.jsp?no=13
	//1.�Ķ���� �о����
	String no=request.getParameter("no");

	//2.dbó��
	BookDTO dto = null;
	BookDAO dao = new BookDAO();
	
	//3.������
	try{
		dto = dao.selectNO(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<h2>��ǰ ����</h2>
<form name="fred" method="post" action="bookEdit_ok.jsp">
<input type="hidden" name="no" value="<%=no %>"><br>
   å����:<input type="text" name="bookName" value=" <%=dto.getTitle() %>" ><br>
   ����:<input type="text" name="price" value="<%=dto.getPrice() %>"><br>
   �ۺ���:<input type="text" name="pub" value=" <%=dto.getPublisher()%>"><br><br>
   <input type="submit" value="���">
   <input type="button" value="���">   
</form>
</body>
</html>