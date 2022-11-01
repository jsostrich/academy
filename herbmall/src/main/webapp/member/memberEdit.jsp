<%@page import="com.herbmall.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<jsp:useBean id="memberService" class="com.herbmall.member.model.MemberService" 
scope="session"></jsp:useBean>
<%
	//세션에서 로그인정보를 갖고와야한다.
	//1
	String userid=(String)session.getAttribute("userid");
	
	//2
	MemberVO vo = new MemberVO();
	
	try{
		//3
		vo = memberService.selectUser(userid);
	}catch(SQLException e){
		e.printStackTrace();	
	}
	


%>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#pwd').focus();
	
	$('#wr_submit').click(function(){
		
		if($('#pwd').val().length<1){
			alert('비밀번호를 입력하세요');
			$('#pwd').focus();
			event.preventDefault();
		}else if($('#pwd').val()!=$('#pwd2').val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#pwd2').focus();
			event.preventDefault();
		}else if(!validate_phone($('#hp2').val())
				|| !validate_phone($('#hp3').val())){
			alert('전화번호는 숫자만 가능합니다.');
			$('#hp2').focus();
			event.preventDefault();
		}
	});
	
    $('#email2').change(function(){
       if($(this).val() == "etc"){
    	   	$('#email3').val("");
          	$('#email3').css('visibility', 'visible');
    	   	$('#email3').focus();
       } else {
          	$('#email3').css('visibility', 'hidden');
       }
    });
    
    
    $('#btnZipcode').click(function(){
    	open('../zipcode/zipcode.jsp','zip',
    		'width=550,height=600,left=0,top=0,location=yes,resizable=yes');	
    });
    
    
 });
 
 function validate_phone(hp){
	 var pattern=new RegExp(/^[0-9]*$/g);
	 return pattern.test(hp);//정규식과 일치하면 true
	 /* 0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
	 닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
 }
 
 function validate_userid(id){
	 var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	 return pattern.test(id);
	 
	 /* a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 
	 시작하거나 끝나야 한다는 의미
	 닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */
 }
</script>

<style type="text/css">
	.width_80{
		width:80px;
	}
	.width_350{
		width:350px;
	}	
</style>
<article>
<div class="divForm">
<form name="frm1" method="post" action="memberEdit_ok.jsp">
<fieldset>
	<legend>회원 정보 수정</legend>
    <div>
    	<span class="sp1">성명</span>        
        <span></span>
    </div>
    <div>
        <span class="sp1">회원 ID</span>        
        <span></span>
        
    </div>
    <div>
        <label for="pwd">비밀번호</label>
        <input type="Password" name="pwd" id="pwd">
    </div>
    <div>
        <label for="pwd2">비밀번호 확인</label>
        <input type="Password" name="pwd2" id="pwd2">
    </div>
    <div>
        <label for="zipcode">주소</label>
        <input type="text" name="zipcode" id="zipcode" ReadOnly  
        	title="우편번호" class="width_80" value="<%=vo.getZipcode()%>">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly title="주소"  
        class="width_350" value="<%=vo.getAddress() %>"   ><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  class="width_350"
         value="<%=vo.getAddressDetail() %>" >
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;<select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80">
    </div>
    <div>
        <label for="email1">이메일 주소</label>
        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
        <select name="email2" id="email2"  title="이메일주소 뒷자리">
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="etc">직접입력</option>
        </select>
        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
        	style="visibility:hidden">
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>
        
</form>
</div>
</article>

<%@ include file="../inc/bottom.jsp"%>










