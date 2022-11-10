<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sellerInfoVo" class="com.sellerinfo.model.SellerInfoVO" 
 scope="session"></jsp:useBean>
<jsp:useBean id="sellerInfoService"  class="com.sellerinfo.model.SellerInfoService" 
scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입중</title>
<script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("mb_id");
		String pwd = request.getParameter("mb_password");
		String name = request.getParameter("mb_name");
		String nick = request.getParameter("mb_nick");
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
		
		sellerInfoVo.setSeller_name(name);
		sellerInfoVo.setSeller_nick(nick);
		sellerInfoVo.setSeller_id(id);
		sellerInfoVo.setSeller_pwd(pwd);
		sellerInfoVo.setSeller_tel(hp);
		sellerInfoVo.setSeller_zipcode(zipcode);
		sellerInfoVo.setSeller_address(address);
		sellerInfoVo.setSeller_email(email);
		
		
		try{
			int cnt = sellerInfoService.insertUser(sellerInfoVo);
			
			if(cnt>0){%>
				<script type="text/javascript">
					alert("판매자 회원 가입 완료!");
					location.href="<%=request.getContextPath() %>/mainpage.jsp";
				</script>
			<%}else{%>
				<script type="text/javascript">
				alert("회원 가입 실패!");
				history.back();
				</script>
			<%}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>