<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reboardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
<%

	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));

	reboardVO = reboardService.getOneUpdateBoard(num);
%>

<form action="BoardDeleteProc.jsp" method="post">
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center"><%=reboardVO.getWriter() %></td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center"><%=reboardVO.getReg_date() %></td>
		</tr>
		
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td align="left" colspan="3"><%=reboardVO.getSubject() %></td>
		</tr>
		
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td align="left" colspan="3"><input type="password" name="password"></td>
		</tr>
		
		<tr height="40">
			<td align="center" colspan="4">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="submit" value="글삭제">&nbsp;&nbsp;
				<input type="button" onclick="location.href='BoardList.jsp'" value="목록보기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>