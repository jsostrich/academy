package com.mymvc.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;
import com.mymvc.board.model.BoardVO;
import com.mymvc.common.PagingVO;

public class ListControllor implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		/*
		  [3 ] 목록 보기 /board/list.do => DispatchServlet =>
		   ListController => list.jsp로 포워드
		  
		 */
		String condition = request.getParameter("searchCondition");
		String keyword = request.getParameter("searchKeyword");
		
		BoardService service = new BoardService();
		List<BoardVO> list = null;
		try {
			list=service.selectAll(condition, keyword);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		// 페이징 처리 관련
		int currentPage = 1;
		String strCurPage = request.getParameter("currentPage");
		if(strCurPage!=null) {
			currentPage = Integer.parseInt(strCurPage);
		}
		
		int totalRecord = 0;
		if(list!= null) {
			totalRecord=list.size();
		}
		int pageSize=5;
		int blockSize=10;
		
		PagingVO pageVo 
		= new PagingVO(currentPage, totalRecord,pageSize, blockSize);
		
		//3
		request.setAttribute("list", list);
		request.setAttribute("pageVo", pageVo);
		
		//4
		return "/board/list.jsp";
	}

	@Override
	public boolean isRedirect() {

		return false;
	}

}
