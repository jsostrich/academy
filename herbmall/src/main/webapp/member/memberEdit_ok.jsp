<%@page import="com.herbmall.member.model.MemberVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/checkLogin.jsp" %>
<jsp:useBean id="memberVo" class="com.herbmall.member.model.MemberVO"
scope="session"></jsp:useBean>
<jsp:useBean id="memberService" class="com.herbmall.member.model.MemberService"
scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit_ok.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String s_userid = (String) session.getAttribute("userid");
	//1
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String addressDetail = request.getParameter("addressDetail");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email3 = request.getParameter("email3");

	String msg = "수정실패", url = "../index.jsp";

	if (hp2 == null || hp3 == null ||
			hp2.length()!=4 || hp3.length()!=4) {
		msg = "휴대폰 번호를 제대로 입력해주세요.";
		url = "memberEdit.jsp";
	}

	String hp = hp1 + "-" + hp2 + "-" + hp3;

	if (email3 == null || email3.isEmpty() || email1 == null || email1.isEmpty()) {
		msg = "이메일 주소를 입력해주세요";
		url = "memberEdit.jsp";
	}

	if (email2.equals("etc")) {
		email2 = email3;
	}
	String email = email1 + "@" + email2;

	if (!pwd.equals(pwd2)) {
	%>
	<script type="text/javascript">
		alert('비밀번호가 맞지 않아요');
		history.back();
	</script>
	<%
	}
	//2
	memberVo = new MemberVO();
	memberVo.setEmail(email);
	memberVo.setHp(hp);
	memberVo.setZipcode(zipcode);
	memberVo.setAddress(address);
	memberVo.setAddressDetail(addressDetail);
	memberVo.setUserid(s_userid);

	try {
	//3
	int result = memberService.loginCheck(s_userid, pwd);
	if (result > 0) {
		int cnt = memberService.updateUser(memberVo);
		if (cnt > 0) {
			msg = "수정완료되었습니다!";
			url = "memberEdit.jsp";
		}

	}
	} catch (SQLException e) {
	e.printStackTrace();
	}

	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>
	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>