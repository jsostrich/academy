<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pdDetail.jsp���� [����]Ŭ���ϸ� get������� �̵�
	//=> http://localhost:9090/mystudy/pd/pdEdit.jsp?no=16
	//1. ��û �Ķ���� �о����
	String no=request.getParameter("no");
	
	//2. db�۾�
	PdDAO pdDao = new PdDAO();
	PdDTO dto=null;
	try{
		dto=pdDao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. ��� ó��
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>��ǰ ����</h2>
<form name="frmPd" method="post" action="pdEdit_ok.jsp">
	<!-- ������ no�� �ʿ��ϹǷ� hidden �ʵ忡 �־ ������ -->
	<input type="hidden" name="no" value="<%=no%>">
		
	��ǰ��:<input type="text" name="pdName" 
		value="<%=dto.getPdName()%>"><br>
	����:<input type="text" name="price" 
		value="<%=dto.getPrice()%>"><br><br>
	<input type="submit" value="����">
	<input type="reset" value="���">	
</form>

<br><br>
<a href="pdList.jsp">��ǰ ���</a>
</body>
</html>