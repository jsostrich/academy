<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
  <style type="text/css" >
  #ig{
  	background-color: write;
  	border: 0px;
  }
  </style>
  <%
	String ck_value="";
	Cookie[] ckArr=request.getCookies();
	if(ckArr != null){
		for(int i=0;i<ckArr.length;i++){
			if(ckArr[i].getName().equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}//for
	}
%>
<div id="div1">
	<div id="div2">
		<div class="login-box">
			<h2>구매 회원 Login</h2>
			<form name="frmlogin" method="post"
				action="<%=request.getContextPath() %>/loginUser_ok.jsp">
				<div class="user-box">
					<label>UserId</label><br> 
					<input type="text" name="userid"
						required="" value="<%=ck_value%>">
				</div>
				<div class="user-box">
					<label>Password</label><br> 
					<input type="password"
						name="userpwd" required="">
				</div>
				<div>
					<input type="checkbox" name="chkSave" id="chkSave"
						<%if (ck_value != null && !ck_value.isEmpty()) {%>
						checked="checked" <%}%>> 
						<label for="chkSave">아이디 저장하기</label>
				</div>
				<a> <span></span> <span></span> <span></span> <input
					type="submit" id="ig" value="S u b m i t">
				</a>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>