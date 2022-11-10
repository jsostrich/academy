<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/subtop2.jsp" %>
<script type="text/javascript" src="js/jquery-3.6.1.min.js">
</script>
<script type="text/javascript">
$(function(){
	$('#btn1').click(function(){
		var va = $('#mem:checked').val();
		if(va==1){
			location.href="<%=request.getContextPath()%>/loginUser.jsp";
		}else{
			location.href="<%=request.getContextPath()%>/loginSeller.jsp";

		}
	});
});
</script>
<style type="text/css">
div{
	text-align: center;
}
#btn1{
	background-color: #7fad39;
	width : 200px;
	height: 50px;
	border: 0px;
}
</style>
<div>
<h2>회원 구분</h2>
<br><br>
<p>로그인하고자 하는 회원종류를 선택하세요</p>
<input type = "radio" name ="member" value="1" checked="checked" id="mem">구매회원
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "radio" name ="member" value="2" id ="mem">판매회원
<br><br>
<input type = "button" value ="다음 화면으로.." id="btn1">
<br><br><br><br><br><br><br><br>

</div>
<%@include file="../include/bottom.jsp"%>