<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//bookList에서 이름을 클릭해서 오는곳
	//=>http://localhost:9090/mystudy/book/bookDetail.jsp?no=
	
	//1.요청 파라미터 읽어오기
	String no = request.getParameter("no");
	
	if(no==null || no.isEmpty()){%>
		<<script type="text/javascript">
			alert('잘못된 url');
		</script>
	<% return;
	}
	//db처리
	BookDAO dao = new BookDAO();
	BookDTO dto = null;
	
	try{
		dto=dao.selectNO(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bookDetail.jsp</title>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#bookdel').click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="bookDelete.jsp?no=<%=no%>";
			}else{
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
<h1>상품 상세보기</h1>
<a>번호 : <%=no %></a><br>
<a>책명 : <%=dto.getTitle() %></a><br>
<a>가격 : <%=dto.getPrice() %></a><br>
<a>출판사 : <%=dto.getPublisher() %></a><br>
<a>등록일 : <%=dto.getJoindate() %></a><br>
<br>
<a href="bookList.jsp">목록</a>
<a href="bookEdit.jsp?no=<%=no%>">수정</a>
<a href="bookDelete.jsp?no=<%=no%>" id="bookdel">삭제</a>
</body>
</html>