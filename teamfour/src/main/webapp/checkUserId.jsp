<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userInfoService" class="com.userinfo.model.UserInfoService" 
	scope="session"></jsp:useBean>  
<jsp:useBean id="userInfoVo" class="com.userinfo.model.UserInfoVO" 
scope="page"></jsp:useBean>  
<%
	//[1] createUser.jsp에서 get방식으로 이동(새창 열기)
	//[2] checkUserid.jsp에서 post방식으로 서브밋
	
	request.setCharacterEncoding("utf-8");	
	//1
	String userid=request.getParameter("mb_id");
	
	//2
	int cnt=0;
	if(userid!=null && !userid.isEmpty()){
		try{
			cnt=userInfoService.checkUserId(userid);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkUserid.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			<%-- opener.document.frm1.userid.value="<%=userid%>"; --%>
			
			$(opener.document).find("#uid").val("<%=userid%>");
			$(opener.document).find("#chkId").val("Y");
			
			self.close();
		});
	});
</script>	
	
</head>
<body>
<h2>아이디 중복검사</h2>
<form name="frmUserId" method="post" action="checkUserId.jsp">
	<label for="userId">아이디 : </label>
	<input type="text" name="mb_id" id="mb_id" size="17" 
		value="<%=userid%>">
	<input type="submit" value="아이디확인"> 
	
	<%if(cnt==userInfoService.NO_ID){ %>
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	<%}else if(cnt==userInfoService.OK_ID){ %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
	<%} %>
</form>

</body>
</html>







