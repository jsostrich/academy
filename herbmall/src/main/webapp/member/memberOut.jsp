<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../login/checkLogin.jsp" %>
<jsp:useBean id="memberVo" class="com.herbmall.member.model.MemberVO" scope="session">
</jsp:useBean>
<jsp:useBean id="memberService" 
	class="com.herbmall.member.model.MemberService" scope="session" >
</jsp:useBean>
<script type="text/javascript">
	$(function(){
		$('#submit').click(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하셔야 합니다.');
				$('#pwd').focus();
				event.preventDefault();
			}else{
				if(!confirm("정말 삭제하시겠습니까?")){
					event.preventDefault();
				}
			}
		});
	});
</script>
	<article class="simpleForm">
		<form name="frmOut" method="post" action="memberOut_ok.jsp">
			<fieldset>
				<legend>회원 탈퇴</legend>
				<p class="p">회원탈퇴하시겠습니까?</p>
				<div>
					<label for="pwd" class="p">비밀번호</label>
					<input type="password" name="pwd" id="pwd">
				</div>
				<div class="align_center">
					<input type="submit" id="submit" value="회원탈퇴">
					<input type="reset" value="취소">
				</div>
			</fieldset>
		</form>
	</article>
<%@ include file="../inc/bottom.jsp" %>