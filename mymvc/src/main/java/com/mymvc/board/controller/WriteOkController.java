package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;
import com.mymvc.board.model.BoardVO;

public class WriteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		/*
		 [2] 글쓰는 db작업 실행
			/board/write_ok.do => DispatchServlet => 
			  WriteOkController => list.do로 redirect 
		 */
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String content=request.getParameter("content");
		
		BoardService service = new BoardService();
		BoardVO vo = new BoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setTitle(title);
		
		try {
			int cnt =service.insertBoard(vo);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		return "/board/list.do";
	}

	@Override
	public boolean isRedirect() {
		
		return true;
	}

}
