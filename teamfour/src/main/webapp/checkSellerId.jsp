<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService" 
	scope="session"></jsp:useBean>  
<jsp:useBean id="sellorInfoVo" class="com.sellerinfo.model.SellerInfoVO" 
scope="page"></jsp:useBean>  
<%
	//[1] createUser.jsp에서 get방식으로 이동(새창 열기)
	//[2] checksellorid.jsp에서 post방식으로 서브밋
	
	request.setCharacterEncoding("utf-8");	
	//1
	String sellerid=request.getParameter("mb_id");
	
	//2
	int cnt=0;
	if(sellerid!=null && !sellerid.isEmpty()){
		try{
			cnt=sellerInfoService.checkUserId(sellerid);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checksellorid.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			<%-- opener.document.frm1.sellorid.value="<%=sellorid%>"; --%>
			
			$(opener.document).find("#uid").val("<%=sellerid%>");
			$(opener.document).find("#chkId").val("Y");
			
			self.close();
		});
	});
</script>	
	
</head>
<body>
<h2>아이디 중복검사</h2>
<form name="frmSellorId" method="post" action="checkSellerId.jsp">
	<label for="SellorId">아이디 : </label>
	<input type="text" name="mb_id" id="mb_id" size="17" 
		value="<%=sellerid%>">
	<input type="submit" value="아이디확인"> 
	
	<%if(cnt==sellerInfoService.NO_ID){ %>
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	<%}else if(cnt==sellerInfoService.OK_ID){ %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
	<%} %>
</form>

</body>
</html>







