<%@page import="com.sellerinfo.model.SellerInfoService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sellorInfoService" class="com.sellerinfo.model.SellerInfoService" 
	scope="session"></jsp:useBean>  
<jsp:useBean id="sellerInfoVo" class="com.sellerinfo.model.SellerInfoVO"
scope="session"></jsp:useBean>
<%
	//[1] createUser.jsp에서 get방식으로 이동(새창 열기)
	//[2] checkUserid.jsp에서 post방식으로 서브밋
	
	request.setCharacterEncoding("utf-8");
	//1
	String sellernick=request.getParameter("mb_nick");
	
	//2
	int cnt=0;
	if(sellernick!=null && !sellernick.isEmpty()){
		try{
			cnt=sellorInfoService.checkUserNick(sellernick);
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checksellornick.jsp</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			<%-- opener.document.frm1.userid.value="<%=userid%>"; --%>
			
			$(opener.document).find("#unick").val("<%=sellernick%>");
			$(opener.document).find("#chkNick").val("Y");
			
			self.close();
		});
	});
</script>	
	
</head>
<body>
<h2>닉네임 중복검사</h2>
<form name="frmsellornick" method="post" action="checkSellerNick.jsp">

	<label for="sellornick">닉네임 : </label>
	<input type="text" name="mb_nick" id="mb_nick" size="17" 
		value="<%=sellernick%>">
	<input type="submit" value="아이디확인"> 
	
	<%if(cnt==sellorInfoService.NO_ID){ %>
		<p>이미 등록된 닉네임입니다. 다른 닉네임을 입력하세요</p>
	<%}else if(cnt==SellerInfoService.OK_ID){ %>
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 닉네임입니다. [사용하기]버튼을 클릭하세요</p>
	<%} %>
</form>

</body>
</html>







