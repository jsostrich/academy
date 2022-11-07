package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;
import com.mymvc.board.model.BoardVO;

public class EditOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 	[7] 수정 처리 - update
			/board/edit_ok.do = > DispatcherServlet => EditOkController
			/detail.do로 redirect
		*/
		//1
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		
		//2
		BoardService boardService=new BoardService();		
		String msg="글 수정 실패", url="/board/edit.do?no="+no;
		try {
			if(boardService.checkPwd(Integer.parseInt(no), pwd)) {
				BoardVO vo = new BoardVO();
				vo.setContent(content);
				vo.setEmail(email);
				vo.setName(name);
				vo.setNo(Integer.parseInt(no));
				vo.setPwd(pwd);
				vo.setTitle(title);
				
				int cnt=boardService.updateBoard(vo);
				if(cnt>0) {
					msg="글 수정되었습니다.";
					url="/board/detail.do?no="+no;
				}
			}else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		//4		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
