	<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
		pageEncoding="EUC-KR"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="EUC-KR">
	<title>pdDelete.jsp</title>
	</head>
	<body>
<%
	//pdDetail.jsp���� [����]Ŭ���ϸ� get ������� �̵�	 
	//1. ��û �Ķ���� �о����
	String no = request.getParameter("no");

	//2. db �۾�
	PdDAO pdDao = new PdDAO();
	
	try{
	   int cnt = pdDao.deletePd(Integer.parseInt(no));
	   
	   //3. ���ó��
	   if(cnt > 0){
	      	response.sendRedirect("pdList.jsp");
	   }else{
		   	System.out.println("��ǰ ���� ����!");
	      	response.sendRedirect("pdDetail.jsp?no="+no);
	   }
	}catch(SQLException e){
	   e.printStackTrace();
	}
		
	%>
	</body>
	</html>