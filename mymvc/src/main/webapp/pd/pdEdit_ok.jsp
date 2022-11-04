<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pdEdit_ok.jsp</title>
</head>
<body>
<%
	//pdEdit.jsp���� post������� ����Ե�
	request.setCharacterEncoding("euc-kr");

	//1. ��û �Ķ���� �о����
	String pdName =request.getParameter("pdName");
	String price =request.getParameter("price");
	String no =request.getParameter("no");
	
	//2. db�۾�
	PdDAO pdDao = new PdDAO();
	PdDTO dto = new PdDTO();
	dto.setNo(Integer.parseInt(no));
	dto.setPrice(Integer.parseInt(price));
	dto.setPdName(pdName);
	
	try{
		int cnt=pdDao.updatePd(dto);
		
		//3. ��� ó��
		if(cnt>0){
			response.sendRedirect("pdDetail.jsp?no="+no);
		}else{
			System.out.println("��ǰ ��������");
			response.sendRedirect("pdEdit.jsp?no="+no);			
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>




