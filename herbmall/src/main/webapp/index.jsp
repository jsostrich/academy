<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

<article id="centerCon">
	<img src = "<%=request.getContextPath()%>/images/herb.JPG"
	alt = "메인 이미지"	>
</article>
<article id="rightCon">
	<!-- 공지사항 -->
	<%@ include file = "inc/mainNotice.jsp" %>
</article>
<article id="listCon">
	<!-- 상품목록 -->
	<h2>상품 목록</h2>
</article>
<%@ include file="inc/bottom.jsp" %>
