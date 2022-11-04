<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookList.jsp</title>
<style type="text/css">
	body{
		margin: 20px;
		position: absolute;
		left : 100px;
	}
</style>
</head>
<body>
<%
	//이게 bookWrite_ok에서 넘어온 자료들임
	//인코딩
	request.setCharacterEncoding("euc-kr");

	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");
	
	if(keyword==null) keyword="";
	
	//1.요청한 파라미터 읽어오기
	BookDAO bookDao = new BookDAO();
	List<BookDTO> list = null;
	//2 db작업
	try{
		list=bookDao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	//
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	///페이지 이벤트
	int currentPage = 1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int totalRecord = 0;
	if(list!=null&&!list.isEmpty()){
		totalRecord = list.size();
	}
	
	int pageSize = 6;
	int totalPage = (int)Math.ceil((float)totalRecord/pageSize);
	
	int blockSize = 10;
	
	int firstPage = currentPage-((currentPage-1)%blockSize);
	
	int lastPage = firstPage+(blockSize-1);
	int curPos = (currentPage-1)*pageSize;
	int num = totalRecord-curPos;
	
	
%>
<h1>책 목록</h1>
<%
	if(keyword!=null && !keyword.isEmpty()){%>
		<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
	<%}
%>
<table border="1" style="width : 500px;border-collapse: collapse;" >
	<tr>
		<th>번호</th>
		<th>책 이름</th>
		<th>가격</th>
		<th>퍼블리셔</th>
		<th>등록일</th>
	</tr>
	<%
	for(int i =0;i<pageSize;i++){
		if(num<1) break;
		
		BookDTO dto =list.get(curPos++);
		num--;
	%><tr>
		<td><%=dto.getNo() %></td>
		<td><a href="bookDetail.jsp?no=<%=dto.getNo() %>">
			<%=dto.getTitle() %></a></td>
		<td><%=dto.getPrice() %></td>
		<td><%=dto.getPublisher() %></td>
		<td><%=sdf.format(dto.getJoindate()) %></td>
	</tr>
	<%}
	%>
</table>
	<a href="bookWrite.jsp">등록하는곳으로 돌아가기</a>
	<br>
	<a>책 제목을 누르면 상세 정보가 나옵니다</a><br>
	<%
		if(firstPage>1){%>
			<a 
			href="bookList.jsp?currentPage=<%=firstPage-1 %>&searchCondition=<%=condition %>&searchKeyword=<%=keyword %>">
			<img src="../images/first.JPG"></a>
		<%}%>
	<%
		for(int i = firstPage;i<=lastPage;i++){
			if(totalPage<i) break;
			
			if(i==currentPage){%>
				<span style="color:blue;font-weight : bold
				;font-size:1em"><%=i %></span>
			<%}else{ %>
			<a href="bookList.jsp?currentPage=<%=i%>&searchCondition=<%=condition %>&searchKeyword=<%=keyword%>">[<%=i %>]</a>
			<%}%>
		<%}%>
			
	<%
		if(lastPage<totalPage){%>
		<a 
			href="bookList.jsp?currentPage=<%=lastPage+1 %>&searchCondition=<%=condition %>&searchKeyword=<%=keyword %>">
			<img src ="../images/last.JPG"></a>
		<%}%>
	<div class="divSearch">
		<form name="frmSearch" method="post" action="bookList.jsp">
		<select name="searchCondition">
			<option value="title"
			<%if("title".equals(condition)){%>
				selected="selected" 
			<%} %>
			>책 제목</option>
			<option value="publisher"
			<%if("publisher".equals(condition)){%>
				selected="selected" 
			<%} %>
			>출판사</option>
		</select>
		<input type="text" name="searchKeyword" title="검색어 입력"
		value="<%= keyword%>">
		<input type="submit" value="검색"><br>
		<a href="bookList.jsp"><input type="button" value="초기로 돌아가기" ></a>
		</form>
	</div>
</body>
</html>