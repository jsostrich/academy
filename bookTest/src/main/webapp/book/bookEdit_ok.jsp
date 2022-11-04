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
	//북에디터에서 정보를 입력하고 수정을 누르면 일로온다
	//폼으로 왓으니 인코딩하자
	request.setCharacterEncoding("euc-kr");
	//1.파라미터 읽어오기
	String no = request.getParameter("no");
	String bookName = request.getParameter("bookName");
	String price = request.getParameter("price");
	String pub = request.getParameter("pub");
	//2.db처리
	BookDTO dto = new BookDTO();
	BookDAO dao = new BookDAO();
	dto.setNo(Integer.parseInt(no));
	dto.setTitle(bookName);
	dto.setPrice(Integer.parseInt(price));
	dto.setPublisher(pub);
	
	try{
		int cnt = dao.update(dto);
		
	//3.결과처리
		if(cnt>0){
			System.out.println("업데이트 완료");
			response.sendRedirect("bookDetail.jsp?no="+no);
		}else{
			System.out.println("업데이트 실패");
			response.sendRedirect("bookEdit.jsp?no="+no);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>