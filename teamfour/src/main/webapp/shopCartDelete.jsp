<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartService" class="com.teamfour.cart.model.CartService"
	scope="session"></jsp:useBean>
 <jsp:useBean id="cartVO" class="com.teamfour.cart.model.CartVO"
	scope="page"></jsp:useBean>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopCartDelete.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	System.out.println("gd");
	String cartno=request.getParameter("cartno");
	try{
		int cnt=cartService.deleteCart(Integer.parseInt(cartno));
		if(cnt>0){%>
			<script type="text/javascript">
			location.href="shoping-cart.jsp";
			</script>
	   <%} 
		
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>