<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pdWrite_ok.jsp</title>
</head>
<body>
<%
	//pdWrite.jsp 에서 post방식으로 서브밋됨
	//요청 파라미터에 대한 한글 인코딩 처리
	request.setCharacterEncoding("euc-kr");

	//1. 요청 파라미터 읽어오기
	String pdName=request.getParameter("pdName");
	String price=request.getParameter("price");
	
	//2. db작업
	PdDAO pdDao = new PdDAO();
	PdDTO dto = new PdDTO();
	dto.setPdName(pdName);
	dto.setPrice(Integer.parseInt(price));
	try{
		int cnt=pdDao.insertPd(dto);
		
		//3. 결과 처리
		if(cnt>0){
			response.sendRedirect("pdList.jsp");
		}else{
			System.out.println("상품 등록 실패");
			response.sendRedirect("pdWrite.jsp");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>