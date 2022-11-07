package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;

public class DeleteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 [9] 삭제처리 - delete
			/board/delete_ok.do => DispatcherServlet => DeleteOkController
			1) => list.do 로 redirect
			또는
			2) 메시지 띄우는 경우
			message.jsp로 포워드
		 */
		//1
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");

		//2
		BoardService boardService = new BoardService();

		String msg="글 삭제 실패",url="/board/delete.do?no="+no;
		try {
			if(boardService.checkPwd(Integer.parseInt(no), pwd)) {
				int cnt = boardService.deleteBoard(Integer.parseInt(no));
				if(cnt>0) {
					msg="글 삭제되었습니다";
					url="/board/list.do";
				}
			}else {
				msg="비밀번호가 일치하지않습니다.";
			}

		}catch (SQLException e) {
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
