<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/checkLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOut_ok.jsp</title>
</head>
<body>
<%	
	//세션 검사 인클루드 호출
	//memberOut.jsp에서 form형식으로 넘어왔으니 인코딩 진행
	request.setCharacterEncoding("utf-8");
	
	//입력한 비밀번호가 맞는지 확인하기 위한 유효성 검사 진행
	
	//현재 세션의 아이디 불러오기 => 추후 유효성검사때 쓸 where 값
	String userid =(String)session.getAttribute("userid");
	
	//pwd 파라미터 읽어오기 -> userid에서 가져온 delete문과 연동
	String pwd = request.getParameter("pwd");
	
	//로그인 체크메서드까지
	
	//db진행
	//dao 및 service 생성
	//service 문 진행=> 성공하면 int가 1로 넘어감, 이때 매개변수는 세션id값과 파라미터pwd값
	//int가 0이 아니라면 비밀번호가 맞지 않는다는 것이므로
	//비밀번호가 맞지 않는다는 메시지와 함께 memberOut.jsp로 돌아가기
	
	//성공하면 탈퇴처리
	//탈퇴처리하고 로그아웃된 메인페이지로 이동 => 
	//쿠키지우고 세션id삭제 하고 메인페이지로 이동
	



%>
</body>
</html>