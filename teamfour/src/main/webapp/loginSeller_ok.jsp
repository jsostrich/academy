<%@page import="com.sellerinfo.model.SellerInfoService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService"
scope="session"></jsp:useBean>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
	
		String sellerid = request.getParameter("sellerid");
		String pwd = request.getParameter("sellerpwd");
		String chkSave = request.getParameter("chkSave");
		
		String msg = "로그인 처리 실패", url="loginSeller.jsp";
	
		try{
			int result = sellerInfoService.sellerCheck(sellerid, pwd);
			
			//3
			if(result==sellerInfoService.LOGIN_OK){
				
				session.setAttribute("sellerid", sellerid);
				
				Cookie ck = new Cookie("ck_sellerid",sellerid);
				
				if(chkSave!=null ){ 
					ck.setMaxAge(365*24*60*60); 
					ck.setPath("/"); 
					response.addCookie(ck);
				}else{ 
					ck.setMaxAge(0); 
					response.addCookie(ck);
				}
				msg=sellerid + "님 로그인되었습니다";
				url="mainpage.jsp";
			}else if(result==sellerInfoService.NO_PWD){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==sellerInfoService.NONE_ID){
				msg="해당 아이디가 존재하지 않습니다.";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
	%>
<jsp:forward page="common/message.jsp"></jsp:forward>
</body>
</html>