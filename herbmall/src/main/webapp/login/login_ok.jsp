<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memberService" class="com.herbmall.member.model.MemberService"
 scope="session"></jsp:useBean>
	<%
	
		//아이디 비밀번호는 세션에 저장하는게 중요하다!!!
		// 아이디 저장하기는 쿠키에 저장하는것
			request.setCharacterEncoding("utf-8");
		//1
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String chkSave = request.getParameter("chkSave");
		
		String msg = "로그인 처리 실패", url="login.jsp";
		//2
		try{
			int result = memberService.loginCheck(userid, pwd);
			
			//3
			if(result==memberService.LOGIN_OK){
				//[1] 세션에 저장하고.
				session.setAttribute("userid", userid);
				
				//[2] 쿠키에 저장한다. -아이디 저장하기가 체크되었다면
					Cookie ck = new Cookie("ck_userid",userid);
				
				//체크박스에 밸류값이 없을때 체크되면 on 안되면 null
				if(chkSave!=null ){ //체크된 경우 => on값인데 null이 있으므로 null로 체크
					ck.setMaxAge(1000*24*60*60); // 쿠키 유지시간 1000일
					ck.setPath("/"); 
					response.addCookie(ck);
				}else{ //체크 아닌경우 =>> null인경우
					ck.setMaxAge(0); // 쿠키 유지시간 0초 // 즉시 사라짐
					response.addCookie(ck);
				}
				msg=userid + "님 로그인되었습니다";
				url="../index.jsp";
			}else if(result==memberService.DISAGREE_PMD){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==memberService.NONE_USEID){
				msg="해당 아이디가 존재하지 않습니다.";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
	%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>