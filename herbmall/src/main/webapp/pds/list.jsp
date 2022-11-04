<%@page import="com.mymvc.common.PagingVO"%>
<%@page import="com.mymvc.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.herbmall.reboard.model.ReBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.herbmall.reboard.model.ReBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	//[1] write_ok.jsp에서 등록 성공하면 get방식으로 이동
	//[2] write.jsp에서 글목록 클릭하면 get방식으로 이동
	//[3] 검색의 경우 - list.jsp에서 [검색]클릭하면 post방식으로 서브밋됨
	//[4] 페이징 처리의 경우 - list.jsp에서 [페이지번호]클릭하면 get방식으로 이동
			
	//1	
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");	
	String keyword=request.getParameter("searchKeyword");	

	if(keyword==null) keyword="";
	
	//2
	List<ReBoardVO> list=null;
	try{
		ReBoardDAO dao = new ReBoardDAO();
		list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//현재 페이지와 무관한 변수들
	int totalRecord=0;  //총 레코드 개수, 예) 17
	if(list!=null && !list.isEmpty()){
		totalRecord=list.size();				
	}
	
	int pageSize=5;  //한페이지에 보여줄 레코드 개수
	int blockSize=10; //한 블럭에 보여줄 페이지 수
	
	PagingVO pagevo = new PagingVO(currentPage,totalRecord,pageSize,blockSize);
	
	
	
%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>자료실 글 목록 - 허브몰</title>
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
<h2>자료실</h2>
<%if(keyword!=null && !keyword.isEmpty()){%>
   <p>검색어 : <%= keyword%>, <%=list.size() %>건 검색되었습니다.</p>
<% }%>
<div class="divList">
<table class="box2"
	 	summary="자료실에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
	<caption>자료실</caption>
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
	  		<tr><td colspan="5" class="align_center">데이터가 없습니다.</td></tr>
	  <%}else{ %>		
		  <!--게시판 내용 반복문 시작  -->
		  
		  <%
		  int num = pagevo.getNum();
		  int curPos = pagevo.getCurPos();
		  
		  for(int i=0;i<pagevo.getPageSize();i++){
			  	if(num<1) break;
			  	
		  		ReBoardVO vo=list.get(curPos++);		  		
		  		num--;		  		
		  %>	
			<tr  style="text-align:center">
				<td><%=vo.getNo() %></td>
				<td style="text-align:left">
					<!-- 파일이 첨부된 경우 파일 이미지 보여주기 -->
					<%=Utility.displayFile(vo.getFileName()) %>
					
					<!-- 답변글인 경우 화살표 이미지 보여주기 -->
					<%=Utility.displayRe(vo.getStep()) %>				
					
					<a href="countUpdate.jsp?no=<%=vo.getNo() %>">
						<!-- 제목이 긴 경우 일부만 보여주기 -->						
						<%=Utility.cutTitle(vo.getTitle(), 30) %>
					</a>
					
					<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
					<%=Utility.displayNew(vo.getRegdate()) %>
				</td>
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
	<%	if(pagevo.getFirstPage()>1){ %>
			<a href="list.jsp?currentPage=<%=pagevo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				<img src="../images/first.JPG">
			</a>	
	<%	}	%>
	<!-- 페이지 번호 추가 -->
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=pagevo.getFirstPage();i<=pagevo.getLastPage();i++){
			if(i>pagevo.getTotalPage()) break;
			
			if(i==currentPage){%>
				<span style="color:blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
="list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i %>]</a>
			<%} %>
	<%	}	%>	
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%if(pagevo.getLastPage()<pagevo.getTotalPage()){ %>
		<a href="list.jsp?currentPage=<%=pagevo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/last.JPG">
		</a>
	<%} %>
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" action='list.jsp'>
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
    <a href='write.jsp' >글쓰기</a>
</div>

</body>
</html>

