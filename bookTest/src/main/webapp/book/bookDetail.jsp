<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDTO"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//bookList���� �̸��� Ŭ���ؼ� ���°�
	//=>http://localhost:9090/mystudy/book/bookDetail.jsp?no=
	
	//1.��û �Ķ���� �о����
	String no = request.getParameter("no");
	
	if(no==null || no.isEmpty()){%>
		<<script type="text/javascript">
			alert('�߸��� url');
		</script>
	<% return;
	}
	//dbó��
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
			if(confirm("�����Ͻðڽ��ϱ�?")){
				location.href="bookDelete.jsp?no=<%=no%>";
			}else{
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
<h1>��ǰ �󼼺���</h1>
<a>��ȣ : <%=no %></a><br>
<a>å�� : <%=dto.getTitle() %></a><br>
<a>���� : <%=dto.getPrice() %></a><br>
<a>���ǻ� : <%=dto.getPublisher() %></a><br>
<a>����� : <%=dto.getJoindate() %></a><br>
<br>
<a href="bookList.jsp">���</a>
<a href="bookEdit.jsp?no=<%=no%>">����</a>
<a href="bookDelete.jsp?no=<%=no%>" id="bookdel">����</a>
</body>
</html>