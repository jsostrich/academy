package com.mymvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class DeleteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 [8] 삭제화면
			/board/delete.do => DispatcherServlet => DeleteController
			=> delete.jsp 로 포워드
		*/
		//1
		String no = request.getParameter("no");
		if(no ==null || no.isEmpty()) {
			request.setAttribute("msg", "잘못된 url입니다");
			request.setAttribute("url", "/board/list.do");

			return "/common/message.jsp";
		}
		
		//2
		//3
		//4
		return "/board/delete.jsp";

	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
