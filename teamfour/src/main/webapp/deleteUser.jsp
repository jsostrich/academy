<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/subtop2.jsp"%>
<style type="text/css">
	#deletefrm{
		text-align: center;
	}
	#subm{
		width:150px;
		height:50px;
	}
</style>

<form id="deletefrm" method="post" action="deleteUser_ok.jsp">
<div>
	<br><br><br><br><br><br><br>
	<h2>진짜로 탈퇴하시게요?</h2>
	<p>그렇다면 가입한 비밀번호를 입력해주세요.</p>
	<input type="text" name="pwd"> <br><br>
	<input type="submit" value="탈퇴하기" id="subm">
	<input type="button" value="돌아가기" id="subm"
	onclick="location.href='<%=request.getContextPath()%>/mainpage.jsp'">
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
</div>
</form>
<%@include file="../include/bottom.jsp"%>