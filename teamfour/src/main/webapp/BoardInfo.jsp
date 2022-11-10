<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="reboardVO" class="com.reboard.model.ReboardVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="reboardService" class="com.reboard.model.ReboardService"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr,td{
		border: 1px solid black;
		border-collapse: collapse;		
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int num=Integer.parseInt(request.getParameter("num").trim());
	
	reboardVO = reboardService.getOneBoard(num);
%>

<h2>게시글 보기</h2>
<table style="width: 600px; border: 1px solid gray; background: pink">
	<tr height="40">
		<td width="100" align="center">글번호</td>
		<td width="180" align="left"><%=reboardVO.getNum() %></td>
		<td width="120" align="center">조회수</td>
		<td width="180" align="center"><%=reboardVO.getReadcount() %></td>
	</tr>
	
	<tr height="40">
		<td width="100" align="center">작성자</td>
		<td width="180" align="left"><%=reboardVO.getWriter()%></td>
		<td width="120" align="center">작성일</td>
		<td width="180" align="center"><%=reboardVO.getReg_date() %></td>
	</tr>
	
	<tr height="40">
		<td width="120" align="center">이메일</td>
		<td colspan="3" align="center"><%=reboardVO.getSubject() %></td>
	</tr>
	
	<tr height="80">
		<td width="120" align="center">글 내용</td>
		<td colspan="3" align="center"><%=reboardVO.getContent() %></td>
	</tr>
	
	<tr height="80">
		<td align="center" colspan="4">
			<input type="button" value="답글쓰기"
				onclick="location.href='BoardReWriteForm.jsp?num=<%=reboardVO.getNum()%>&ref=<%=reboardVO.getRef()%>&re_step=<%=reboardVO.getRe_step()%>&re_level=<%=reboardVO.getRe_level()%>'">
			<input type="button" value="수정하기"
				onclick="location.href='BoardUpdateForm.jsp?num=<%=reboardVO.getNum()%>'">
			<input type="button" value="삭제하기"
				onclick="location.href='BoardDeleteForm.jsp?num=<%=reboardVO.getNum()%>'">
			
			<input type="button" value="목록보기"
				onclick="location.href='BoardList.jsp'">
		</td>
	</tr>
</table>
</body>
</html>