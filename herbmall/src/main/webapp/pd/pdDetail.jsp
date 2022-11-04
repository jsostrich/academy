<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mystudy.pd.model.PdDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mystudy.pd.model.PdDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//pdList.jsp 에서 상품명을 클릭하면 get방식으로 이동
	//=> http://localhost:9090/mystudy/pd/pdDetail.jsp?no=14
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
	DecimalFormat df = new DecimalFormat("#,###");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pdDetail.jsp</title>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="pdDelete.jsp?no=<%=no%>";
			}
		});
	});
</script>
</head>
<body>

	<h1>상품 상세보기</h1>
	<p>번호 : <%=no %></p>
	<p>상품명 : <%=dto.getPdName() %></p>
	<p>가격 : <%=df.format(dto.getPrice()) %> 원</p>
	<p>등록일 : <%=dto.getRegdate() %></p>
	<br>
	<a href="pdList.jsp">목록</a> |
	<a href="pdEdit.jsp?no=<%=no%>">수정</a> |
	<a href="#" id="aDel">삭제</a>
</body>
</html>

