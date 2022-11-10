<%@page import="com.teamfour.cart.model.CartVO"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="cartService" class="com.teamfour.cart.model.CartService"
scope="session"></jsp:useBean>
<%
	String userno = (String)session.getAttribute("userno");
	String pdcode = request.getParameter("pdcode");
	String qty = request.getParameter("qty");
	
	CartVO ovo = new CartVO();
	
	ovo.setQty(Integer.parseInt(qty));
	ovo.setPdcode(Integer.parseInt(pdcode));
	ovo.setUserNo(Integer.parseInt(userno));
	
	try{
		int cnt = cartService.insertCart(ovo);
		if(cnt>0){%>
			<script type="text/javascript">
				alert('장바구니 넣기 완료!');
		   		location.href="<%=request.getContextPath()%>/shoping-cart.jsp?pdcode=<%=pdcode%>&qty=<%=qty%>&userno=<%=userno%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert('장바구니 담기 실패..');
				location.href="#";
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>