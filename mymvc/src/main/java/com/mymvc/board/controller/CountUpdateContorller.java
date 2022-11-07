package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;

public class CountUpdateContorller implements Controller{

	/**
	 *
	 */
	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		//list.do에서 클릭
		
		
		String no = request.getParameter("no");
		BoardService service = new BoardService();
		
		try {
			int cnt = service.updateReadCount(Integer.parseInt(no));
			
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//3 넘겨줄값이 없으므로 스킵
		//4
		return "/board/detail.do?no="+no;
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

}
