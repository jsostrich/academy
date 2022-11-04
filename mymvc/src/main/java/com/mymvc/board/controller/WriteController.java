package com.mymvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class WriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		/*
			[1] 글쓰기 화면 보여주기 write.jsp
			/board/write.do = > DispatchServlet =>
			 	WriteController => write.jsp로 포워드
		*/
		return "/board/write.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
