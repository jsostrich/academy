<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pdList.jsp</title>
</head>
<body>
<%
	//[1] pdWrite_ok.jsp���� �����ϸ� get������� �̵�
	//[2] pdWrite.jsp���� [��ǰ���] Ŭ���ϸ� get������� �̵� 
	
	//1. ��û �Ķ���� �о����	
	//2. db�۾�
	PdDAO pdDao = new PdDAO();
	List<PdDTO> list=null;
	
	try{
		list=pdDao.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. ��� ó��
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>
<h1>��ǰ ���</h1>
<table border="1" style="width:500px">
	<Tr>
		<th>��ȣ</th>
		<th>��ǰ��</th>
		<th>����</th>
		<th>�����</th>
	</Tr>
	<!-- �ݺ����� -->
	<%
		for(int i=0;i<list.size();i++){
			PdDTO dto=list.get(i); %>
			<tr>
				<td><%=dto.getNo() %></td>
				<td>
					<a href="pdDetail.jsp?no=<%=dto.getNo()%>">
						<%=dto.getPdName() %>
					</a>
				</td>
				<td style="text-align: right">
					<%=df.format(dto.getPrice()) %></td>
				<td><%=sdf.format(dto.getRegdate()) %></td>
			</tr>
	<%	}%>	
	<!-- �ݺ��� -->
</table>
<br>
<a href="pdWrite.jsp">��ǰ ���</a>
</body>
</html>