<%@page import="com.reboard.model.ReboardVO"%>
<%@page import="java.util.List"%>
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
	<h2>전체 게시글 보기</h2>
	<%
	request.setCharacterEncoding("utf-8");
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0;
	int number = 0;
	
	int currentPage=Integer.parseInt(pageNum);
	
	count=reboardService.getAllCount();
	
	int startRow=(currentPage-1)*pageSize+1;
	int endRow=currentPage*pageSize;
	
	
	List<ReboardVO> list=reboardService.getAllBoard(startRow, endRow);
			
	number=count-(currentPage-1)*pageSize;
	%>
	
	<table style="width: 700px; border: 1px solid gray; background:pink;">
		<tr height="40">
			<td align="right" colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='BoardWirteForm.jsp'">	
			</td>
		</tr>
		
		<tr height="40">
		<td width="50" align="center">번호</td>
		<td width="320" align="center">제목</td>
		<td width="100" align="center">작성자</td>
		<td width="150" align="center">작성일</td>
		<td width="80" align="center">조회수</td>
		</tr>
<%
	for(int i=0;i<list.size();i++){
		reboardVO = list.get(i);
%>
	<tr height="40">
		<td width="50" align="center"><%=number-- %></td>
		<td width="320" align="left">
			<a href="BoardInfo.jsp?num=<%=reboardVO.getNum()%>"
				style="text-decoration: none;">
			<%
				if(reboardVO.getRe_step()>1){
					
					for(int j=0;j<(reboardVO.getRe_step()-1)*5;j++){
			%>&nbsp;			
					
			<%		}
				}
			%>
			<%=reboardVO.getSubject() %>
			
			</a>
		</td>
		<td width="100" align="center"><%=reboardVO.getWriter() %></td>
		<td width="150" align="center"><%=reboardVO.getReg_date() %></td>
		<td width="80" align="center"><%=reboardVO.getReadcount() %></td>
	</tr>
	<%}%>
	</table>
	<p>
	<%
	if(count>0){
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
	
	
	int startPage=1;
	if(currentPage%10!=0){
		startPage=((int)(currentPage/10))*10+1;
	}else{
		startPage=((int)(currentPage/10)-1)*10+1;
	}
	
	int pageBlock=10;
	int endPage=startPage+pageBlock-1;
	
		if(endPage>pageCount) endPage=pageCount;
		
	if(startPage>10){
	%>
		<a href="BoardList.jsp?pageNum=<%=startPage-10%>">[이전]</a>
	<%		
	}
	
	for(int i=startPage;i<=endPage;i++){
	%>
		<a href="BoardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<%	
	}
	
	if(endPage<pageCount){
	%>
		<a href="BoardList.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
	<%
	}
	}
	%>
	</p>
</body>
</html>