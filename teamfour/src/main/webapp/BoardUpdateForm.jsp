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
<h2>게시글 수정</h2>
<%
	int num=Integer.parseInt(request.getParameter("num").trim());
	
	reboardVO = reboardService.getOneUpdateBoard(num);
%>
<form action="BoardUpdateProc.jsp" method="post">
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td width="120" align="center">작성자</td>
			<td width="180" align="center"><%=reboardVO.getWriter() %></td>
			<td width="120" align="center">작성일</td>
			<td width="180" align="center"><%=reboardVO.getReg_date() %></td>
		</tr>
		
		<tr height="40">
			<td width="120" align="center">제목</td>
			<td width="480" colspan="3">&nbsp;
			<input type="text" name="subject" value="<%=reboardVO.getSubject()%>" size="60">
			</td>
		</tr>
		
		<tr height="40">
			<td width="120" align="center">패스워드</td>
			<td width="480" colspan="3">&nbsp;
			<input type="password" name="password" size="60">
			</td>
		</tr>
		
		<tr height="40">
			<td width="120" align="center">글내용</td>
			<td width="480" colspan="3">
			<textarea rows="10" cols="60" name="content" align="left"><%=reboardVO.getContent() %></textarea>
			</td>
		</tr>
		
		<tr height="40">
			<td colspan="4" align="center">
				<input type="hidden" name="num" value="<%=reboardVO.getNum()%>">
				<input type="submit" value="글수정">&nbsh;&nbsp;
				<input type="button" onclick="location.href='BoardList.jsp'" value="전체 글 보기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>