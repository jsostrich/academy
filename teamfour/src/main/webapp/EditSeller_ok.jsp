<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService"
scope="session"></jsp:useBean>
<jsp:useBean id="vo" class="com.sellerinfo.model.SellerInfoVO"
scope="page"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String sellerinfo = (String)session.getAttribute("d_sellerid");
	
	String zipcode = request.getParameter("mb_zip");
	String address1 = request.getParameter("mb_addr1");
	String address2 = request.getParameter("mb_addr2");
	String address3 = request.getParameter("mb_addr3");
	
	String address = address1+" "+address2+" "+address3;
	
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	
	String hp =hp1+"-"+hp2+"-"+hp3;
	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");
	
	if(email3.equals("직")){
		email3 = email2;
	}
	String email = email1+"@"+email3;
	
	vo.setSeller_address(address);
	vo.setSeller_tel(hp);
	vo.setSeller_email(email);
	vo.setSeller_zipcode(zipcode);
	vo.setSeller_id(sellerinfo);
	
	try{
		int cnt = sellerInfoService.sellerUpdate(address, hp, email, zipcode, sellerinfo);
				
		if(cnt>0){%>
			<script type="text/javascript">
				alert("판매자 회원 수정 완료!");
location.href="<%=request.getContextPath() %>/sellerDetail.jsp?d_sellerid=<%=sellerinfo %>";
			</script>
		<%}else{%>
			<script type="text/javascript">
			alert("수정 실패!");
			history.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}


%>
</body>
</html>