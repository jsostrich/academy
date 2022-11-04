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
	//http://localhost:9090/mystudy/book/bookDetail.jsp?no=19에서 삭제버튼 눌러서 진행
	//1. 요청 파라미터 진행
	String no = request.getParameter("no");
	
	//2.db처리
	BookDAO dao = new BookDAO();
	try{
		int cnt = dao.delete(Integer.parseInt(no));
		if(cnt>0){
			System.out.println("삭제완료");
			response.sendRedirect("bookList.jsp");
		}else{
			System.out.println("삭제실패");
			response.sendRedirect("bookDetail.jsp?no="+no);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3.결과출력
%>
</body>
</html>