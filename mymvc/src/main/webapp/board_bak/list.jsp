<%@page import="com.mymvc.common.PagingVO"%>
<%@page import="com.mymvc.board.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//[1] write_ok.jsp에서 등록 성공하면 get방식으로 이동
	//[2] write.jsp에서 글목록 클릭하면 get방식으로 이동
	//[3] 검색의 경우 - list.jsp에서 [검색]클릭하면 post방식으로 서브밋됨
	//[4] 페이징 처리의 경우 - list.jsp에서 [페이지번호]클릭하면 get방식으로 이동
			
	List<BoardVO> list=(List<BoardVO>)request.getAttribute("list");
	PagingVO pageVo =(PagingVO)request.getAttribute("pageVo");
	
	String condition = request.getParameter("searchCondition");
	String keyword = request.getParameter("searchKeyword");
	
	if(keyword==null) keyword="";
	
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>자유게시판 글 목록 - 허브몰</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<script type="text/javascript">	

</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<h2>자유게시판</h2>
<%if(keyword!=null && !keyword.isEmpty()){%>
   <p>검색어 : <%= keyword%>, <%=list.size() %>건 검색되었습니다.</p>
<% }%>
<div class="divList">
<table class="box2"
	 	summary="기본 게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>기본 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:15%;" />
		<col style="width:15%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>  
	  <%if(list==null || list.isEmpty()){ %>
	  		<tr><td colspan="5">데이터가 없습니다.</td></tr>
	  <%}else{ %>		
		  <!--게시판 내용 반복문 시작  -->
		  <%
		  int num = pageVo.getNum();
		  int curPos = pageVo.getCurPos();
		  
		  for(int i=0;i<pageVo.getPageSize();i++){
			  	if(num<1) break;
			  	
		  		BoardVO vo=list.get(curPos++);		  		
		  		num--;		  		
		  %>	
			<tr  style="text-align:center">
				<td><%=vo.getNo() %></td>
				<td style="text-align:left">
<a href="<%=request.getContextPath() %>/board/countUpdate.do?no=<%=vo.getNo() %>">
					<%=vo.getTitle() %></a></td>
				<td><%=vo.getName() %></td>
				<td><%=sdf.format(vo.getRegdate()) %></td>
				<td><%=vo.getReadcount() %></td>		
			</tr>
		  <%}//for %>	 
		  <!--반복처리 끝  -->
	  <%}//if %>	  
	  </tbody>
</table>	   
</div>
<div class="divPage">
	<!-- 이전블럭으로 이동 -->
	<%	if(pageVo.getFirstPage()>1){ %>
<a href="<%=request.getContextPath() %>/board/list.do?currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				<img src="../images/first.JPG">
			</a>	
	<%	}	%>
	<!-- 페이지 번호 추가 -->
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;
			
			if(i==pageVo.getCurrentPage()){%>
				<span style="color:blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
="<%=request.getContextPath() %>/board/list.do?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i %>]</a>
			<%} %>
	<%	}	%>	
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%if(pageVo.getLastPage()<pageVo.getTotalPage()){ %>
		<a href="<%=request.getContextPath() %>/board/list.do?currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/last.JPG">
		</a>
	<%} %>
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" 
   		action='<%=request.getContextPath() %>/board/list.do'>
        <select name="searchCondition">
            <option value="title" 
            	<%if("title".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >제목</option>
            <option value="content"
            	<%if("content".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >내용</option>
            <option value="name" 
            	<%if("name".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력"
        	value="<%= keyword%>">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <a href='<%=request.getContextPath() %>/board/write.do' >글쓰기</a>
</div>

</body>
</html>

