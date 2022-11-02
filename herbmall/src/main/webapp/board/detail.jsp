<%@page import="com.herbmall.comment.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.herbmall.board.model.BoardVO"%>
<%@page import="com.herbmall.board.model.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="commentService" class="com.herbmall.comment.CommentService" 
scope="session"></jsp:useBean>
<jsp:useBean id="commentVo" class="com.herbmall.comment.CommentVO" 
scope="session"></jsp:useBean>
<%
	//list.jsp에서 [제목] 클릭하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/board/detail.jsp?no=3
	//1
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert('잘못된 url입니다');
			location.href="list.jsp";
		</script>
		
	<%	return;	
	}
	
	//2
	BoardDAO dao = new BoardDAO();
	BoardVO vo = null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent();
	if(content!=null && !content.isEmpty()){
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	
	List<CommentVO> list =null;
	try{
		list=commentService.selectNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자유게시판 상세보기 - 허브몰</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>

	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span><%=vo.getTitle() %></span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span><%=vo.getName() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getRegdate() %></span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getReadcount() %></span>
		</div>
		<div class="lastDiv">			
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<a href='edit.jsp?no=<%=no%>'>수정</a> |
        	<a href='delete.jsp?no=<%=no%>'>삭제</a> |
        	<a href='list.jsp'>목록</a>			
		</div>
	</div>
	<div class="divForm">
		<table>
		<%for(int i =0;i<list.size();i++){
			%>
		
		<tr>
			<td>
			dd
			</td>
			<td>
			ff
			</td>
			<td>
			ee
			</td>
		</tr>
		
		
		<% }%>
		</table> 
		
	</div>

	
</body>
</html>