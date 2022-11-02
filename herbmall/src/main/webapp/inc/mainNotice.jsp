<%@page import="java.sql.SQLException"%>
<%@page import="com.herbmall.board.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardService" class="com.herbmall.board.model.BoardService" 
scope="session" ></jsp:useBean>
<jsp:useBean id="boardVo" class="com.herbmall.board.model.BoardVO"
scope="session"></jsp:useBean>
<%
	List<BoardVO> list = null;
	try{
		list = boardService.selectTitle();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<style type="text/css">
		.divNotice{
			width:310px
		}
		.divNotice div table{
			width:300px
		}
		.divNotice div span{
			padding:0 0 0 160px;
		}
		.divNotice div .img1{
			width:310px;height:6px
		}
</style>
<div class="divNotice">
	<div>
		<img src="<%=request.getContextPath() %>/images/notice2.JPG" alt="공지사항">		
		<span><a href="<%=request.getContextPath()%>/board/list.jsp">
    
    			<img src="<%=request.getContextPath() %>/images/more.JPG" 
					border="0" alt="more - 더보기"></a></span>
	</div>
	<div>
		<img src ="<%=request.getContextPath() %>/images/Line.JPG" alt="" class="img1">
	</div>
	<div>	<!-- 공지사항 -->
		<table summary="최근 공지사항 6건을 보여주는 표입니다.">			
			<tbody>
    			<% if(list==null || list.isEmpty()){%>
    				<tr>
    				<td class="align_center">공지사항이 없습니다.</td>
    				</tr>
    			<%}else{
    				for(int i =0;i<list.size();i++){
    				BoardVO vo = list.get(i); %>
    			<!-- 반복 시작 -->
    			<tr>
    				<td>
    					<img src="<%=request.getContextPath() %>/images/dot.JPG">
    <a href="<%=request.getContextPath() %>/board/detail.jsp?no=<%=vo.getNo() %>">
    						<%=vo.getTitle() %></a>
    				</td>
    			</tr><%
    				}
    			}%>
    			<!-- 반복 끝 -->    
    		</tbody>
    	</table>
    </div>
</div>    		