<%@page import="com.teamfour.orderinfo.model.OrderinfoVO"%>
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
<jsp:useBean id="orderInfoService" class="com.teamfour.orderinfo.model.OrderinfoService"
scope="session"></jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
	
		int size = (int)session.getAttribute("size");
	
		int userno = Integer.parseInt((String)session.getAttribute("userno"));
		String name = request.getParameter("mb_name");
		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		String hp = hp1+"-"+hp2+"-"+"hp3";
		String zipcode = request.getParameter("mb_zip");
		String add1 = request.getParameter("mb_addr1");
		String add2 = request.getParameter("mb_addr2");
		String add3 = request.getParameter("mb_addr3");
		String address = add1+add2+add3;
		String em1 = request.getParameter("email1");
		String em2 = request.getParameter("email2");
		String email = em1+"@"+em2;
		System.out.println(size);
		System.out.println(userno);
		System.out.println(name);
		System.out.println(hp);
		System.out.println(zipcode);
		System.out.println(address);
		System.out.println(email);
		
		OrderinfoVO vo = new OrderinfoVO();
	try{
		for(int i =0;i<size;i++){
			String cartno = request.getParameter("cartno"+i);
			String pdcode = request.getParameter("pdcode"+i);
			String qty = request.getParameter("qty"+i);
			
			System.out.println(cartno);
			System.out.println(pdcode);
			System.out.println(qty);
			
			
			boolean bool = orderInfoService.buyOrder(Integer.parseInt(cartno), userno, 
					Integer.parseInt(pdcode), Integer.parseInt(qty), name,hp, zipcode, 
					address, email);
			if(!bool){
				System.out.println("프로시저 작동 성공");
			}
		}%>
		<script type="text/javascript">
			alert('구매완료 감사합니다!');
			location.href='<%=request.getContextPath()%>/mainpage.jsp';
		</script>
	<%}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	
	
	
	%>			
</body>
</html>