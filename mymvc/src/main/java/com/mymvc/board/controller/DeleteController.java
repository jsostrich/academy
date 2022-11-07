package com.mymvc.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class DeleteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		return "/board/delete.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

}
