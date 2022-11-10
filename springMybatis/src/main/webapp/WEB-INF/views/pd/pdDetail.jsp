<%@page import="com.sp.pd.model.PdDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//pdList.jsp 에서 상품명을 클릭하면 get방식으로 이동
	//=> http://localhost:9090/mystudy/pd/pdDetail.jsp?no=14
	//1. 요청 파라미터 읽어오기
	//PdDTO dto = (PdDTO)request.getAttribute("dto");
	
	//String no = request.getParameter("no");
	
	//2. db작업
	//3. 결과 처리
	//DecimalFormat df = new DecimalFormat("#,###");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>pdDetail.jsp</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
<script type="text/javascript">
	$(function(){
		$('#aDel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href
				="<c:url value='/pd/pdDelete.do?no=${param.no }' />";
			}
		});
	});
</script>
</head>
<body>

	<h1>상품 상세보기</h1>
	<p>번호 : ${param.no }</p>
	<p>상품명 : ${dto.pdName }</p>
	<p>가격 : <fmt:formatNumber value="${dto.price }" pattern="#,###" /> 원</p>
	<p>등록일 : ${dto.regdate}</p>
	<br>
	<a href="<c:url value='/pd/pdList.do' />">목록</a> /
	<a href="<c:url value='/pd/pdEdit.do?no=${param.no}' />">수정</a> |
	<a href="#" id="aDel">삭제</a>
</body>
</html>

