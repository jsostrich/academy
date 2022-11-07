package com.mymvc.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.board.model.BoardService;

public class DeleteOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		
		BoardService service = new BoardService();
		
		String msg = "삭제 실패", url="/board/delete.jsp?no="+no;
		try {
			if(service.checkPwd(Integer.parseInt(no), pwd)) {
				int cnt = service.deleteBoard(Integer.parseInt(no));
				if(cnt>0) {
					msg="삭제 성공";
					url="/board/list.do";
				}
			}else {
				msg="비밀번호부터 맞추세요";
			}
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

}
