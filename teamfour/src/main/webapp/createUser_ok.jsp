<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userInfoVo" class="com.userinfo.model.UserInfoVO" 
 scope="session"></jsp:useBean>
<jsp:useBean id="userInfoService"  class="com.userinfo.model.UserInfoService" 
scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입중</title>
<script src="js/jquery-3.6.1.min"></script>
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
		
		userInfoVo.setUser_name(name);
		userInfoVo.setUser_nick(nick);
		userInfoVo.setUser_id(id);
		userInfoVo.setUser_pwd(pwd);
		userInfoVo.setUser_tel(hp);
		userInfoVo.setUser_zipcode(zipcode);
		userInfoVo.setUser_address(address);
		userInfoVo.setUser_email(email);
		try{
			int cnt = userInfoService.insertUser(userInfoVo);
			
			if(cnt>0){%>
				<script type="text/javascript">
					alert("회원 가입 완료!");
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