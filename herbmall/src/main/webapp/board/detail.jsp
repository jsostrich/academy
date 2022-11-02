<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.herbmall.member.model.MemberVO"%>
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
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>

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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
		#don{
			border: 1px solid blue;
			width: 500px;
			border-collapse: collapse;
		}
		#don2{
			border: 1px solid blue;
		}
	.divff{
		width : 500px;
	}
	.spc1{
		float:left;
	}
	.spc2{
		float: right; 
	}
	.firstDiv{
		clear: both;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#comBtn').click(function(){
			if($('#name').val().length<1){
				alert('이름을 입력하셔야 합니다.');
				event.preventDefault();
			}
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하셔야 합니다.');
				event.preventDefault();
			}
			if($('#content').val().length<1){
				alert('뭐라도 입력하셔야 합니다.');
				event.preventDefault();
			}
		});
	});
</script>
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
		<table id="don">
		<%for(int i =0;i<list.size();i++){
			commentVo = list.get(i);%>
		
		<tr>
			<td id ="don2">
			<%=commentVo.getName() %>
			</td>
			<td id ="don2">
			<%=commentVo.getContent() %>
			</td>
			<td id ="don2">
			<%=sdf.format(commentVo.getRegdate()) %>
			</td>
		</tr>
		<% }%>
		</table> 
	</div><br>
	<div class="divff">
		<h3>댓글</h3>
		<form name ="frmComment" method ="post" action="comment_ok.jsp">
		<fieldset>
				<legend>글수정</legend>
				<span class="spc1">
					<label for="name">이름</label> 
					<input type="text" id="name"
						name="name" />
				</span>
				<span class="spc2"> 
					<label for="pwd">비밀번호</label> 
					<input type="password" id="pwd"
						name="pwd" />
				</span><br><br>
				<div class="firstDiv">
					<label for="content">내용</label> 
					<textarea id="content" name="content" cols="70">
					</textarea>
				</div>
				<input type="submit" value="댓글달기" id="comBtn"/>
				</fieldset>
		</form>
	</div>
	
</body>
</html>