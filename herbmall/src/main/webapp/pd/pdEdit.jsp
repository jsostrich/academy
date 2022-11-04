<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pdDetail.jsp에서 [수정]클릭하면 get방식으로 이동
	//=> http://localhost:9090/mystudy/pd/pdEdit.jsp?no=16
	//1. 요청 파라미터 읽어오기
	String no=request.getParameter("no");
	
	//2. db작업
	PdDAO pdDao = new PdDAO();
	PdDTO dto=null;
	try{
		dto=pdDao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3. 결과 처리
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>상품 수정</h2>
<form name="frmPd" method="post" action="pdEdit_ok.jsp">
	<!-- 수정시 no가 필요하므로 hidden 필드에 넣어서 보낸다 -->
	<input type="hidden" name="no" value="<%=no%>">
		
	상품명:<input type="text" name="pdName" 
		value="<%=dto.getPdName()%>"><br>
	가격:<input type="text" name="price" 
		value="<%=dto.getPrice()%>"><br><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">	
</form>

<br><br>
<a href="pdList.jsp">상품 목록</a>
</body>
</html>