<%@page import="com.mymvc.pd.model.PdService"%>
<%@page import="com.mymvc.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pdDetail.jsp���� [����]Ŭ���ϸ� get������� �̵�
	//=> http://localhost:9090/mystudy/pd/pdEdit.jsp?no=16
	//1. ��û �Ķ���� �о����
	
	PdDTO dto = (PdDTO)request.getAttribute("pdDto");
	
	String no = request.getParameter("no");
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
<form name="frmPd" method="post" 
	action="<%=request.getContextPath() %>/pd/pdEdit_ok.do">
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
<a href="<%=request.getContextPath() %>/pd/pdList.do">��ǰ ���</a>
</body>
</html>