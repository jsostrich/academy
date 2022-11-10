<%@page import="com.teamfour.orderinfo.model.OrderinfoService"%>
<%@page import="com.userinfo.model.UserInfoService"%>
<%@page import="com.userinfo.model.UserInfoVO"%>
<%@page import="com.teamfour.orderinfo.model.OrderinfoVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.teamfour.cart.model.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	OrderinfoService orderService = new OrderinfoService();

	List<CartVO> list = (List<CartVO>)request.getAttribute("list");
	List<OrderinfoVO> orderList = null;
	String userid = (String)session.getAttribute("userid");
	int user_no = 0;
	try{
		UserInfoService userService = new UserInfoService();
		UserInfoVO vo = userService.selectUser(userid);
		user_no = vo.getUser_no();
	} catch(SQLException e){
		e.printStackTrace();
	}

	try{
		for(CartVO cartVo : list){
			OrderinfoVO orderVo = new OrderinfoVO();
			
			orderVo.setUser_no(user_no);
			orderVo.setPdcode(cartVo.getPdcode());
			orderVo.setQty(cartVo.getQty());
			orderVo.setTotalprice(cartVo.getQty() * cartVo.getPrice());
			
			int cnt = orderService.insertOrderinfo(orderVo);
		}
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	response.sendRedirect("mainpage.jsp");
%>

</body>
</html>