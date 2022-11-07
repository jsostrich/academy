package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;
import com.mymvc.board.model.BoardVO;

public class EditOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		BoardVO vo =(BoardVO)request.getAttribute("vo");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		BoardService service = new BoardService();
		
		vo.setTitle(title);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setContent(content);
		
		int cnt = 0;
		
		try {
			cnt = service.updateBoard(vo);
			if(!(cnt>0)) {
				request.setAttribute("msg", "비밀번호가 맞지 않아요");
				request.setAttribute("url", "/board/detail.jsp?no="+vo.getNo());
				
				return "common/message.jsp";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

}
